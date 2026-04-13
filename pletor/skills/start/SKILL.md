---
name: start
description: Get started with Pletor. Shows your workflows, explains what you can do, and verifies your connection.
user-invocable: true
---

# Welcome to Pletor

You are helping the user get started with Pletor, an AI workflow automation platform. Follow these steps:

## Before You Begin

Tell the user:
> Before connecting, make sure the Pletor MCP server is enabled. Run `/mcp` in Claude Code, find **Pletor** in the list, and confirm it shows as connected. If you don't see it, install the Pletor plugin first.

## Step 1: Verify Connection

Call the `search_workflows` MCP tool with an empty search and `visibility: ["private"]` to list only the user's private workflows. This verifies the connection and authentication.

If the call fails, identify which error occurred and respond with the matching guidance:

| Failure | How to detect | What to tell the user |
|---|---|---|
| Pletor MCP server not found | The `search_workflows` tool is not available or no matching MCP tool exists | "The Pletor MCP server isn't connected. Run `/mcp`, look for **Pletor**, and enable it. If it's not listed, install the plugin first — see the [README](https://github.com/pletor-ai/claude-code-pletor-plugin) for instructions." |
| Wrong MCP server used | The call was routed to a server that is not Pletor | "It looks like the wrong MCP server was used. Run `/mcp` and make sure **Pletor** is the one enabled — disable any other servers that might conflict." |
| Expired or invalid token | Auth error such as 401 or "requires re-authorization" | "Your Pletor session has expired. Run `/mcp`, select **Pletor**, and re-authenticate. Your browser will open to sign in." |

## Step 2: Show Summary

Once you have the private workflow list, present a friendly summary:

- How many private workflows the user has
- List the first 5 workflows by name with a brief description of each
- If the user has no private workflows, ask if they would like to see shared and public workflows instead. If they say yes, call `search_workflows` with `visibility: ["shared", "public"]` and present those results.

## Step 3: Show What's Possible

Tell the user they can interact with Pletor using natural language. Give these examples:

- **Run a workflow:** "Run my image generation workflow" or "Execute [workflow name]"
- **Upload assets:** "Upload this image and use it in my workflow"
- **Check status:** "What's the status of my last run?" or "Show me the results"
- **Find templates:** "Find a template for product photography" or "What templates are available?"
- **Explore models:** "What AI models are available?" or "Find a model for video generation"
- **Get help:** "How does the [node type] node work?" or "Search the docs for [topic]"

## Tone

Keep your responses warm, concise, and encouraging. The user may be non-technical — avoid jargon and explain things simply.
