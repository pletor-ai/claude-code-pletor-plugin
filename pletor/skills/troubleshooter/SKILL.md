---
name: troubleshooter
description: |
  Diagnoses and resolves errors when using Pletor MCP operations. Activate when any operation
  returns an error, when you've retried something more than once, or when you're stuck.
---

# Troubleshooter

You are diagnosing an error with a Pletor MCP operation. Follow the guidance below to resolve it quickly.

## When to Use This Skill

Activate when:
- Any Pletor MCP operation returns an error
- You've retried an operation more than once without success
- You're unsure how to proceed after a failure

## Upload Failures

| Symptom | Cause | Fix |
|---------|-------|-----|
| `file_path` not found / ENOENT | Web MCP clients can't access local files | Use `content_base64` instead. Read the file, base64-encode it, and pass with `mime_type` and `filename`. |
| "Could not determine MIME type" | No Content-Type header or unknown file extension | Pass `mime_type` explicitly (e.g., `image/jpeg`, `video/mp4`). |
| Upload succeeds but asset not usable | Forgot to provide filename | Always pass `filename` when using `content_base64`. |

## Authentication and Connection Errors

| Symptom | Fix |
|---------|-----|
| `search_workflows` or other Pletor tool not found | Pletor MCP server isn't connected. Tell the user to run `/mcp` and enable Pletor. If not listed, they need to install the plugin first. |
| MCP call routed to wrong server (not Pletor) | Wrong MCP server is active. Tell the user to run `/mcp`, disable conflicting servers, and make sure Pletor is selected. |
| 401 from any operation | MCP token expired. Tell the user to run `/mcp`, select Pletor, and re-authenticate. |
| "fetch failed" or network error | Backend API not reachable. Ask the user to check if Pletor is running. |

## Workflow Input Format Errors

This is the most common source of wasted retries. **Never guess input formats.**

### The Golden Rule

Before passing inputs to `run_workflow`, always discover the schema:

1. Call `get_workflow` to read the DSL and identify input nodes (types ending with `_input`).
2. For well-known types, use these formats:
   - `text_input` → plain string
   - `image_input` / `video_input` / `audio_input` → `{ "asset_ids": ["<asset_id>"] }`
3. For anything else → call `get_node_details` with the node type to get the expected schema.

### When a Run Fails with Input Errors

Errors like "Field required", "Input should be a valid dictionary", or validation errors:

1. Call `get_node_run_result` for the failed node to read the actual error.
2. Call `get_node_details` for that node type to see the correct schema.
3. Compare what you sent vs what's expected. Fix and retry.
4. If it still fails after 2 attempts, the input may be **pre-configured** in the workflow. Try running without passing it in `flow_input`.

## General Debugging Checklist

- **Never retry the same input format twice.** If it failed once, it will fail again.
- **Always inspect errors before retrying.** Call `get_node_run_result` to read the actual error message.
- **Call `get_node_details` for unfamiliar node types.** Don't guess schemas.
- **Pre-configured inputs exist.** If a workflow has been set up with default values for an input, you don't need to pass it. When stuck, try omitting the problematic input.
- **Check the operation schema.** Call `get_schema` with the operation name to verify you're passing the right parameters.
