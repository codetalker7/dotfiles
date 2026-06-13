# My protocol for understanding open source code

This is just a document that I've made for myself so that I have
a systematic way of understanding open source projects. Essentially,
understanding a large codebase involves the following steps:

1. Debugging/going through the code to understand internals, function
    call stacks, how components interact with each other, etc.
2. Making notes with code pointers and, if possible, a visualization
    of the code architecture.

This process takes time, and I just wanted to write a protocol for 
myself which I can follow to streamline the above process. So, here's
what I'll do:

- ~~I'll maintain a folder called `open-source` in my Google Docs. This
    folder will contain all of my "notes" from point number 2 above.
    These notes will contain code pointers, links to GitHub code etc.
    with the goal of giving a clear explanation of the codebase.~~
- Scratch the first point; I'm still doing this in markdown on GitHub.
    Markdown is simply the best note taking language to ever exist.
- For a given project that I want to understand, I'll fix a commit
    hash (or even better, a tag), and all of my notes will be based
    on this commit/tag. The point of this step is to ensure reproducible
    notes; large projects often get 100s of commits every day, and 
    it is important to fix a snapshot of the codebase that you're trying
    to understand. Then build on top of it.
- For each project I want to understand, I'll first make a GitHub fork
    of it. Then, I'll create a branch called `my-dev` that will contain
    all of my experimental code. This code will then be pushed onto
    my fork.
- Importantly, the `my-dev` branch should be based on the commit/tag
    that I've fixed.
- Further, for any experiments that I want to do which are specific to
    that repository, I will make a folder called `my-runs` and implement
    my experiments there.
