# Tool Guide — Tool Reference

Parameter reference for documentation, template, and node discovery tools.

## search_documentation

Search Pletor documentation for information about features, nodes, models, and workflows.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | yes | Search query about Pletor features, nodes, models, or workflows |

## search_resource

Search for tutorials, guides, and reference agents.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | yes | Keyword to search tutorials, guides, and reference content |

## get_resource_content

Fetch the full markdown content of a resource found via `search_resource`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | yes | The record ID from `search_resource` results |

## list_template_tags

List available use-case and industry tags for filtering templates. No parameters.

## search_templates

Search for workflow templates by name or tags.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `search` | string | no | Text search on template name |
| `use_case_tags` | string[] | no | Filter by use-case tags (OR logic) |
| `industry_tags` | string[] | no | Filter by industry tags (OR logic) |
| `limit` | number | no | Max results (default 5) |
| `starting_after` | string | no | Pagination cursor |

## get_node_details

Get detailed information about a node type including its schema and compatible models.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `type` | string | yes | Node type (e.g., `image_generation`, `video_generation`, `llm`) |
| `model` | string | no | Specific model ID to filter configuration |
