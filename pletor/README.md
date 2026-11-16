# Pletor Plugin

Generate on-brand images, video, speech and music, keep each brand's memory in a Pletor Brain, and build and run AI workflows on [Pletor](https://pletor.ai), directly from Claude.

## Installation

```bash
claude plugin marketplace add pletor-ai/claude-code-pletor-plugin
claude plugin install pletor@claude-code-pletor-plugins
```

## Getting Started

Type `/pletor:start` to check your connection and see your workflows, Brains and credits. After that, just talk naturally.

## Skills

| Skill | Type | Description |
|-------|------|-------------|
| `/pletor:start` | Command | Onboarding: verifies the connection, shows workflows, Brains and credits |
| Playbooks | Auto | Points Claude to the playbook the Pletor server serves for Brains, flows, apps, prompts and models |

The playbooks themselves live on the Pletor MCP server, so they stay current without a plugin update.

## What the MCP server can do

- **Generate:** images, video, speech and music; edit, upscale and remove backgrounds
- **Brains:** build a brand's memory from its website, brand book or product files, and ground every generation in it
- **Workflows:** search, run, batch and diagnose workflows; build and edit flows you watch take shape live in Pletor
- **Apps:** find and run published apps
- **Assets:** upload local files or public URLs, search your assets
- **Help:** search the Pletor docs, find models, check your credit balance

The server also offers two prompts, `set_up_my_brand` and `make_on_brand`, available as slash commands: type `/` and search for their names.

## Authentication

OAuth via browser on first use.

## License

Apache-2.0
