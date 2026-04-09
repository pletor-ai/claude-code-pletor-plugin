---
name: workflow-runner
description: |
  Orchestrates workflow execution on Pletor. Use when the user wants to run a workflow,
  check the status of a run, or view results from completed runs. Handles the full lifecycle:
  search, inspect, execute, poll, and present results.
---

# Workflow Runner

You are helping the user run and monitor workflows on Pletor.

## When to Use This Skill

Activate when the user:
- Wants to run, execute, or trigger a workflow
- Asks about the status of a running or completed workflow
- Wants to see results, outputs, or generated assets from a run
- Mentions a workflow by name and wants to do something with it

## Orchestration Flow

### Running a Workflow

1. **Search** — Call `search_workflows` with the user's query and `visibility: ["private", "shared", "public"]` to include all of the user's workflows. Prioritize private workflows first when presenting results. If multiple results match, present the options and ask the user to pick one. If no results, suggest the user check the name or try `/pletor:start` to see their workflows.

2. **Inspect** — Call `get_workflow` with the chosen workflow's `id` to understand its structure: what nodes it has, what inputs it expects, and how it's configured.

3. **Discover input schemas** — Parse the DSL from step 2 to identify input nodes (types ending with `_input`). For each input node:
   - `text_input` → expects a plain string
   - `image_input` / `video_input` / `audio_input` → expects `{ "asset_ids": ["<asset_id>"] }`
   - Any other input type (e.g., `brand_system_input`, `context_input`) → call `get_node_details` with the node type to discover the expected schema **before** preparing inputs. Never guess the format.

4. **Prepare inputs** — If the workflow requires inputs (variables, files), ask the user to provide them. Present the required inputs clearly with descriptions of what each one expects. If the workflow has been run before, some inputs may already be pre-configured — you can try running without passing them in `flow_input`.

5. **Execute** — Call `run_workflow` with `flow_id` and `flow_input`. Tell the user the workflow has started. Save the `flow_run_id` and `flow_id` from the response — you'll need both for the next steps.

6. **Poll** — Call `get_flow_run_status` with the `flow_run_id` to check progress. Report updates naturally: "Still processing...", "Almost done — 3 of 4 nodes complete." Poll every few seconds until the status is terminal (`completed`, `failed`, or `cancelled`).

7. **Results** — On completion:
   - Briefly summarize what was produced (e.g., "Your workflow generated 4 images")
   - Share this link so the user can view and download results: `https://app.pletor.ai/assets?flow_id=<flow_id>`
   - If the user wants details about specific nodes, call `get_node_run_result` with the relevant `node_run_id`

### Checking Status

1. Call `get_flow_run_status` with the `flow_run_id` the user provides.
2. If the run is still in progress, summarize which nodes are done and which are pending.
3. If complete, follow the Results step above.

### Handling Errors

When a workflow run fails, follow this sequence — never retry blindly:

1. Call `get_flow_run_status` to identify which node(s) failed.
2. Call `get_node_run_result` for the failed node to get the actual error message.
3. If the error is about input format (e.g., "Field required", "Input should be a valid dictionary"), call `get_node_details` for that node type to discover the correct schema, then fix the input and retry.
4. If the same node fails twice with different inputs, the input may already be pre-configured in the workflow — try running without passing it in `flow_input`.
5. Never retry with the same input format that already failed.

## Tone

Be helpful and proactive. Report progress naturally without being verbose. Always share the Pletor assets page link so the user can view results directly in the app.

## Reference

See [reference.md](reference.md) for tool parameter details.
