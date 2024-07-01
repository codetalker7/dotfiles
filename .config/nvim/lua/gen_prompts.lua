require("gen").prompts["JuliaDocstring"] = {
    prompt = [[
        You are an expert in writing Julia docstrings. Here is an example of a Julia docstring from DataFrames.jl:

        ```julia
        """
            get_chunksize(collection::Collection, nranks::Int)

        Determine the size of chunks used to store the index, based on the size of the `collection` and the number of available GPUs.

        # Arguments

        - `collection::Collection`: The underlying collection of documents. 
        - `nranks::Int`: Number of available GPUs to compute the index. At this point, the package only supports `nranks = 1`.

        # Examples
        Continuing from the example from the [`Collection`](@ref) constructor:

        ```julia-repl
        julia> get_chunksize(collection, 1) 
        11
        ```
        """
        ```

        Inspired from this example, can you write a docstring for the following function? 

        ```julia
        $text
        ```
    ]],
    extract = "```julia\n(.*?)```",
}
