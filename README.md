# Pletor Plugin for Claude Code

This repository provides an official Claude Code plugin that bundles:

- The **Pletor MCP Server**, which lets Claude generate on-brand media, manage Brains, and build and run workflows on your Pletor workspace
- **Pletor Skills** that get you started and point Claude to the playbooks the server keeps up to date

Works with [Claude Code](https://claude.com/product/claude-code) and [Claude Cowork](https://claude.ai/cowork).

---

## 🚀 Features

### ✅ Integrated Pletor MCP Server

Claude connects to Pletor's MCP server with OAuth authentication. This gives Claude tools to:

- Generate images, video, speech and music; edit, upscale and remove backgrounds
- Build a Brain that holds a brand's identity, brand kit and products, and ground every generation in it
- Search, run, batch and diagnose workflows
- Build and edit flows that you watch take shape live in Pletor
- Find and run published apps
- Upload local files or public URLs, search assets, find models, search the docs and check credits

### ✅ Skills

| Skill | How it activates | What it does |
|-------|-----------------|--------------|
| `/pletor:start` | You type the command | Verifies your connection, shows your workflows, Brains and credits |
| Playbooks | Automatically | Points Claude to the playbook the server serves for Brains, flows, apps, prompts and models |

The playbooks live on the Pletor MCP server, so they stay current without a plugin update. The server also offers two prompts, `set_up_my_brand` and `make_on_brand`, available as slash commands under `/mcp__pletor__`.

### ✅ Natural Language

Once installed, just talk to Claude:

| What you want | What to say |
|---------------|-------------|
| Generate | "Make a product shot of this bottle on a marble counter" |
| Remember a brand | "Build a Brain from acme.com" |
| Stay on-brand | "Make three Instagram visuals for our winter launch" |
| Run a workflow | "Run my AI photographer workflow on these three photos" |
| Build a workflow | "Build a flow that turns a product photo into four lifestyle shots" |
| Run an app | "Run the background removal app on this image" |
| Fix an error | "My last run failed, help me figure out why" |

---

## 📦 Installation

In Claude Cowork:

Go to Customize -> Personal plugins -> Create plugin -> Add marketplace -> Paste the following
```
https://github.com/pletor-ai/claude-code-pletor-plugin
```
Then Personal plugins -> Browse plugins -> Personal -> Add Pletor plugin

<p align="center">
  <img src="https://github.com/user-attachments/assets/99a9e293-4bf3-4ba2-9a01-84b51b00d0cf" width="600">
</p>



In Claude Code, run:

```bash
# Add this plugin's marketplace
claude plugin marketplace add pletor-ai/claude-code-pletor-plugin

# Install the plugin
claude plugin install pletor@claude-code-pletor-plugins
```

Then type `/pletor:start` to get oriented.

To pick up a new version in Claude Code (a copy added on claude.ai is updated there):

```bash
claude plugin marketplace update claude-code-pletor-plugins
claude plugin update pletor@claude-code-pletor-plugins
```

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
