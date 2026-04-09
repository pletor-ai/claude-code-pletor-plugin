# Pletor Plugin for Claude Code

This repository provides an official Claude Code plugin that bundles:

- **Pletor Skills** that teach Claude how to run AI workflows, upload assets, and explore models
- The **Pletor MCP Server**, which enables Claude to securely execute workflows and manage assets on your Pletor workspace
- **Automatic troubleshooting** that helps Claude recover from errors without guessing

Works with [Claude Code](https://claude.com/product/claude-code) and [Claude Cowork](https://claude.ai/cowork).

---

## 🚀 Features

### ✅ Integrated Pletor MCP Server

Claude connects to Pletor's MCP server with OAuth authentication. This gives Claude tools to:

- Run AI workflows and poll for results
- Upload files from URLs, local paths, or base64 content
- Browse templates and discover AI models
- Inspect node schemas and workflow structure
- Search documentation and tutorials

### ✅ Skills

Skills teach Claude how to combine individual tools into complete workflows.

| Skill | How it activates | What it does |
|-------|-----------------|--------------|
| `/pletor:start` | You type the command | Shows your workflows, verifies your connection |
| Workflow Runner | Automatically | Discovers input schemas, runs workflows, polls status, shares results |
| Asset Manager | Automatically | Uploads files (URL, local path, or base64), discovers AI models |
| Tool Guide | Automatically | Searches documentation, finds templates, explains node capabilities |
| Troubleshooter | Automatically | Diagnoses errors across all operations, prevents blind retries |

### ✅ Natural Language

Once installed, just talk to Claude:

| What you want | What to say |
|---------------|-------------|
| Run a workflow | "Run my AI photographer workflow with this image" |
| Upload and use | "Upload this product photo and run the background removal workflow on it" |
| Batch process | "Run the AI photographer once for each photo from my Notion page" |
| Check a run | "What's the status of my last run?" |
| Find templates | "Find a template for product photography" |
| Explore models | "What models are available for video generation?" |
| Fix an error | "The workflow failed, help me figure out why" |

---

## 📦 Installation

In Claude Code, run:

```bash
# Add this plugin's marketplace
claude plugin marketplace add pletor-ai/claude-code-pletor-plugin

# Install the plugin
claude plugin install pletor@claude-code-pletor-plugins
```

Then type `/pletor:start` to get oriented.

---

## 🔑 Authentication

The Pletor MCP server uses OAuth. Claude opens your browser to sign in on first use.

---

## ⚠️ Claude Cowork Notes

When using this plugin with Claude Cowork, be aware of one limitation:

- **File uploads:** Drag-and-drop file uploads are not yet fully supported by our implementation. To upload files, link the local folder containing your images instead. We're working on improving this experience.

---

## ⚖️ License

Apache-2.0
