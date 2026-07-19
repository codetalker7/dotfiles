# Workflow for theory research with AI agents/chat

Here are some of my ideas on how to adequately use AI agents and chatbots to do
theory research optimally. When using AI models for doing theory research, it is
important for the user to keep the context clean (so that the model doesn't
waste any tokens thinking about useless problems like writing things to LaTeX,
spending time in reading/writing files etc. For LaTeX specific or writing, use a
separate chat context. So, here is what I do:

1. All math is to be written in LaTeX. I maintain a file usually called
`main.tex` which contains the main problem statement. As quality progress is
made, I add it up to `main.tex`; the point of `main.tex` is to only include
proofs/theorems which are factually correct and verified. Use one chat/agent
context to "think" about the problem; this context should only be used for
thinking and making progress on the problem.

2. Relevant citations, papers etc. should be given to the model/agent as PDF
files. If using a chat interface, just upload the PDFs; if using a terminal
agent, then just put the PDFs in your current working directory.

3. Use separate chats/agent contexts for LaTex related/filesystem/any technical
issues which are not directly related to the math.

4. Make small steps, and verify each small step. If you ask the model to "do a
full analysis, or write the complete proof" or something along these lines,
you're probably just wasting your time. Instead, do the following:
    - Ask the model to devise a plan first. Even better, devise the plan
      yourself, and break it into steps.
    - Ask the model to implement your plan step by step. Verify each step
      independently. This is crucial to not waste your time.
    - Once each of the individual steps are verified, you can even fire up a new
      context on the verified work.

# Tooling and pipelines

Here's the overall tooling and workflow that I use:

1. For active thinking, use a tablet/whiteboard interface. This simply cannot be
replaced by typing/keyboard interfaces. Thinking is done best the old fashioned
way.

2. Use LaTeX to write the project. There's simply no better alternative to LaTeX
to write full-fledged research papers, specially for theory.
    
    - Preferably, use a local tex installation; I prefer TexLive for this.
    - Version control the project with `git`. This makes it easy to go back
    in time if bugs in the proofs/anything else are found.
    - Push to overleaf using `olcli`. Only do pushes, there's no need to pull
      from overleaf as we'll be developing locally.

3. However, a LaTeX codebase is not suitable for LLMs. The best math format for
LLMs seems to be markdown. So, we need a way to convert our LaTeX codebase to
markdown; use `pandoc` for this.

4. Finally, if you have a PDF file that you want to convert to markdown (to be
fed into LLMs), then you can use this really amazing tool:
https://github.com/opendatalab/mineru.
