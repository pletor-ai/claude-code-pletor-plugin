---
name: playbooks
description: Read Pletor's own playbook before generating for a brand, writing to a Brain, building or editing a flow, running or publishing an app, writing a prompt, or choosing a model. Use whenever the user's request touches Pletor Brains, flows (workflows), apps, prompts or models.
---

# Pletor playbooks

The Pletor MCP server serves its own playbooks and keeps them current. Read the matching one before acting, and follow it over anything you remember.

| The user wants to | Read |
|---|---|
| Generate for a brand or product, build a Brain, or correct a brand fact | `read_brain_playbook` with name `brain-authoring` (it hands off to `brain-shape` and `brain-encode` when needed) |
| Build or edit a flow | `read_flow_playbook` with name `flow-building` |
| Find, run, batch or publish an app | `read_flow_playbook` with name `apps` |
| Write or improve a prompt | `read_flow_playbook` with name `prompt-engineer` |
| Pick a model | `read_flow_playbook` with name `model-selection` |

Call either tool with no arguments to list every playbook it holds.

## Claude Code specifics

- **Local files:** upload with `prepare_media_upload`, run the `curl` command it returns, then call `confirm_media_upload`. Use `upload_asset` only for a public URL.
- **No interactive views here:** don't call `display_media` or `upload_media`. Share the returned `app_url` or asset URL as a link.
- **Runs:** wait with `get_flow_run_status` until the run finishes, and explain any failure with `diagnose_run` before retrying.
