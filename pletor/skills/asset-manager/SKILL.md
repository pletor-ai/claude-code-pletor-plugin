---
name: asset-manager
description: |
  Manages file uploads and AI model discovery on Pletor. Use when the user wants to upload
  images or files, explore available AI models, or find the right model for their use case.
---

# Asset Manager

You are helping the user manage assets and explore AI models on Pletor.

## When to Use This Skill

Activate when the user:
- Wants to upload a file, image, or video to Pletor
- Asks about available AI models or their capabilities
- Wants to find a specific model by name or category
- Needs help choosing the right model for a task

## Upload Flow

The `upload_asset` operation handles the entire upload lifecycle in a single call. You just need to determine the right input mode.

### From a URL

When the user provides a link to a file (CDN URL, public image URL, etc.):

```
execute operation=upload_asset params={ "source_url": "https://example.com/photo.png" }
```

The MIME type is detected automatically from the URL response headers. If detection fails, pass `mime_type` explicitly.

### From a Local File

When the user has a file on disk:

```
execute operation=upload_asset params={ "file_path": "/Users/me/Downloads/image.png" }
```

The MIME type is detected from the file extension. If the extension is unusual, pass `mime_type` explicitly.

### From File Content (web MCP clients)

When you don't have access to the file system or a public URL (e.g., running in Claude Cowork or other web-based MCP clients), read the file, base64-encode it, and pass it directly:

```
execute operation=upload_asset params={ "content_base64": "<base64-encoded-bytes>", "mime_type": "image/jpeg", "filename": "photo.jpg" }
```

**Important:** When using `content_base64`, you must provide `mime_type` explicitly since there is no URL or file extension to detect it from. Always provide `filename` too for display purposes.

### After Upload

The operation returns an `asset_id`. Tell the user the upload is complete and explain how to use the asset in a workflow:

> To use this asset in a workflow, pass it as input: `{ "<input_node_id>": { "asset_ids": ["<asset_id>"] } }`

### Common MIME Types

| Extension | MIME Type |
|-----------|-----------|
| `.png` | `image/png` |
| `.jpg`, `.jpeg` | `image/jpeg` |
| `.webp` | `image/webp` |
| `.gif` | `image/gif` |
| `.mp4` | `video/mp4` |
| `.mp3` | `audio/mpeg` |
| `.wav` | `audio/wav` |
| `.pdf` | `application/pdf` |

## Model Discovery

### Listing models
Call `list_models` to show all available AI models. Optionally filter by `node_type` if the user is looking for models compatible with a specific node (e.g., `image_generation`, `video_generation`, `llm`).

### Finding a specific model
Call `find_model` with the user's search term. This supports partial, abbreviated, or even misspelled model names. Present the results with:
- Model name and provider
- Supported capabilities (what node types it works with)
- Pricing information if available

## Tone

Be practical and clear. When presenting models, organize them by category or capability so the user can compare options easily.

## Reference

See [reference.md](reference.md) for tool parameter details.
