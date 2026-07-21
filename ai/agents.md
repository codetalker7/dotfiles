# Overall workflow and philosphy

My basic approach with agents is: 

1. Create easy-to-follow, reusable *workflows* for all tasks. Ideally, you
shouldn't need to run *any* command yourself.

2. Use `AGENTS.md` in your project root to let the agent know about the
project-specific workflow.

3. Use `SKILLS.md` for any specific skills that you want the agent to be using.

4. Distribute work amongst agents, don't use one agent for everything. Get used
to an agent multiplexer like `herdr`. Restrict permissions for agents that don't
need them. `herdr` is good for TUIs, but GUIs are much better for this: use
something like OpenHands.

5. Use heavier/costlier models for hard problems: research + hard coding tasks.
For easy tasks (easy re-writes, parsing files, bash commands etc.), use dumber
models. Don't burn your strong tokens on easy tasks.

6. Use a plan + verify + commit workflow: don't implement everything at once.
Break the problem down into steps (planning stage). The agent should then
implement things one step at a time, and then you should verify each step. Once
each step is verified, commit.

# Useful models to use in agents

1. `/plan`: planning mode. Agent first creates a plan, and does not edit any
files.

2. `/undo` and `/redo`: undo or redo changes.

# What terminal agents I'm using

For complex coding/research tasks, I use:

1. Antigravity CLI (free tier)
2. Codex

For simple coding tasks, I use:

1. OpenRouter + OpenCode (see `.config/opencode/opencode.json` for the model)

# IDEs with agentic workflows

1. Antigravity IDE

# Online Chat Interfaces

1. ChatGPT (really good at theory research)
2. Gemini Pro (good for theory research)
3. Deepseek Chat (good for proofs and stuff, but no file upload option in expert mode)
4. Qwen Chat

# For multi-agent workflows

Use `herdr`.
