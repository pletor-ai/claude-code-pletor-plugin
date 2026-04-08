# Asset Manager — Tool Reference

Parameter reference for asset management and model discovery tools.

## upload_asset

Upload a file from a URL, local path, or base64-encoded content. Handles the entire upload lifecycle in one call.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `source_url` | string (url) | no* | Public URL of the file to upload |
| `file_path` | string | no* | Local file path to upload |
| `content_base64` | string | no* | Base64-encoded file content (for web MCP clients) |
| `mime_type` | string | no | MIME type override (auto-detected if omitted). **Required** when using `content_base64`. |
| `filename` | string | no | Display filename for the asset |
| `visibility` | string | no | `private` (default), `public`, or `shared` |

*Exactly one of `source_url`, `file_path`, or `content_base64` is required.

**Returns:** `asset_id`, `url`, `media_type`, and instructions for using the asset in workflows.

## list_models

List available AI models, optionally filtered by node type.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `node_type` | string | no | Filter by node type (e.g., `image_generation`, `video_generation`, `llm`) |

## find_model

Search for a model by name. Supports partial, abbreviated, or misspelled names.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | yes | Model name to search for |
| `limit` | number | no | Max results (default 5) |
| `category` | string | no | Filter by category: `text`, `image`, `video`, `audio`, `other` |
