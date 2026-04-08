# Workflow Runner — Tool Reference

Parameter reference for workflow execution tools. Use this instead of calling `get_schema`.

## search_workflows

Search for workflows by name, tags, or type.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `search` | string | no | Text search on workflow name |
| `use_case_tags` | string[] | no | Filter by use-case tags (OR logic) |
| `industry_tags` | string[] | no | Filter by industry tags (OR logic) |
| `agent_types` | string[] | no | Filter by type: `standard`, `tool`, `reference`, `creative_assistant` |
| `visibility` | string[] | no | Filter by visibility: `public`, `shared`, `private` |
| `limit` | number | no | Max results (default 5) |
| `starting_after` | string | no | Pagination cursor |

## get_workflow

Get the full workflow definition including nodes and configuration.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | yes | The workflow/flow ID |

## run_workflow

Execute a workflow. Returns a `flow_run_id` for tracking.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `flow_id` | string | yes | The workflow ID |
| `flow_input` | object | no | Input data for workflow variables |
| `flow_definition_id` | string | no | Specific version to run (defaults to latest) |

## get_flow_run_status

Check the status of a workflow run.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `flow_run_id` | string | yes | The flow run ID |

**Status values:** `pending`, `running`, `completed`, `failed`, `cancelled`

## get_latest_node_runs

Get the latest run results for all nodes in a workflow.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `flow_id` | string | yes | The flow ID |
| `flow_definition_id` | string | yes | The flow definition ID (version) |

## get_node_run_status

Check the status of a single node run.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `node_run_id` | string | yes | The node run ID |

## get_node_run_result

Get the output and generated assets from a completed node run. Only call after the node status is `completed`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `node_run_id` | string | yes | The node run ID |
