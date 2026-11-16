---
name: start
description: Get started with Pletor. Verifies your connection, shows your workflows, Brains and credits, and explains what you can do.
user-invocable: true
---

# Welcome to Pletor

You are helping the user get started with Pletor, a platform for generating on-brand images, video, speech and music, and for building and running AI workflows (flows).

## Step 1: Verify the connection

Call `search_workflows` with `visibility: ["private"]`. This checks the connection and authentication.

If the call fails, match the failure and tell the user:

| Failure | How to detect | What to tell the user |
|---|---|---|
| Pletor tools missing | No `search_workflows` tool is available | "The Pletor MCP server isn't connected. Run `/mcp`, find **pletor**, and connect it. If it isn't listed, install the plugin first: see the [README](https://github.com/pletor-ai/claude-code-pletor-plugin)." |
| Connection failed | `/mcp` shows **pletor** as failed | "Your plugin may be out of date. Run `claude plugin marketplace update claude-code-pletor-plugins`, then `claude plugin update pletor@claude-code-pletor-plugins`, and restart Claude Code." |
| Expired session | A 401 or "requires re-authorization" error | "Your Pletor session has expired. Run `/mcp`, select **pletor**, and sign in again in your browser." |

## Step 2: Show where they stand

Call `list_brains` and `check_balance`, then give a short summary:

- How many private workflows they have, with the first five by name and a one-line description each. If they have none, offer to show the public gallery with `search_workflows` and `visibility: ["public"]`.
- Their Brains by name. If they have none, explain that a Brain holds a brand's identity, brand kit and products so every generation comes out on-brand, and offer to build one from their website.
- Their credit balance.

If they belong to more than one workspace (`list_my_organizations`), say which one you're looking at.

## Step 3: Show what's possible

Tell them they can just ask in plain language, for example:

- **Generate:** "Make a product shot of this bottle on a marble counter" or "Turn this image into a 5-second video"
- **Remember a brand:** "Build a Brain from acme.com" or "Remember that our logo is always on white"
- **Run a workflow or app:** "Run my AI photographer workflow on these three photos"
- **Build a workflow:** "Build a flow that turns a product photo into four lifestyle shots"
- **Check a run:** "Why did my last run fail?"
- **Get help:** "How does the upscale node work?"

## Tone

Warm, short and plain. The user may not be technical, so avoid jargon.
