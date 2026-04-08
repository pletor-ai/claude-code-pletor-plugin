# Pletor Plugin

Run AI workflows, manage assets, and explore templates on [Pletor](https://pletor.ai) — directly from Claude.

## Installation

```bash
claude plugin marketplace add pletor-ai/plugins
claude plugin install pletor@pletor-plugins
```

## Getting Started

Type `/pletor:start` to see your workflows and learn what's available. After that, just talk naturally.

## Skills

| Skill | Type | Description |
|-------|------|-------------|
| `/pletor:start` | Command | Onboarding — shows your workflows and verifies connection |
| Workflow Runner | Auto | Discovers input schemas, runs workflows, polls for results |
| Asset Manager | Auto | Uploads files (URL, path, base64) and discovers AI models |
| Tool Guide | Auto | Searches docs, finds templates, explains node capabilities |
| Troubleshooter | Auto | Diagnoses errors and prevents blind retries |

Auto skills activate when Claude detects they're relevant — no commands needed.

## MCP Tools (17)

**Workflow Execution:** `run_workflow`, `get_flow_run_status`

**Node Results:** `get_latest_node_runs`, `get_node_run_status`, `get_node_run_result`

**Asset Management:** `upload_asset`, `list_models`, `find_model`

**Discovery:** `search_workflows`, `get_workflow`, `search_templates`, `list_template_tags`, `get_node_details`

**Documentation:** `search_documentation`, `search_resource`, `get_resource_content`

## Authentication

OAuth via browser on first use.

## License

Apache-2.0
