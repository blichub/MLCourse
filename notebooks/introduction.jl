### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 065a1e67-6b63-43df-9d6d-303af08d8434
begin
using Pkg
Base.redirect_stdio(stderr = devnull, stdout = devnull) do
	Pkg.activate(joinpath(Pkg.devdir(), "MLCourse"))
end
using Revise, MLCourse, HypertextLiteral
MLCourse.CSS_STYLE
end

# ╔═╡ 2b67233e-76ba-40be-81e2-787fbe5d3641
using PlutoUI; PlutoUI.TableOfContents()

# ╔═╡ f3508747-da29-47c9-a98e-22ea15caaf2f
md"""
Hi and welcome to the first exercise session of this introduction to machine learning.

The goal of this week is to
1. decide which programming language you want to use
2. setup an environment and install some dependencies that we will use in the future
3. solve some exercises to generate, visualize and inspect some data.

# 1. Choice of Programming Language

Popular programming languages for work with data and machine learning allow high
interactivity, either through a [Read-eval-print loop (REPL)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) or interactive notebooks, like [Jupyter notebooks](https://en.wikipedia.org/wiki/Project_Jupyter).
The name "Jupyter" is a reference to the programming languages **Ju**lia, **Pyt**hon and **R**, which are among the most popular languages to work with data.
For this introduction to machine learning it does not really matter which of these three languages one chooses.
In fact, the code examples for this course will be given in Julia and Python and you can switch forth and back between these two languages with the language toggle button:
"""

# ╔═╡ 7343bb19-ed3f-4db1-be83-ca165099dcc3
mlcode(
"""
a_julia_function(x) = x^2

function another_julia_function(x)
	√x
end

another_julia_function(144)
"""
,
"""
import math
def a_python_function(x):
	return x**2

def another_python_function(x):
	return math.sqrt(x)

another_python_function(144)
"""
;
showoutput = true
)

# ╔═╡ fdae59d6-5cc6-40d3-9693-1ce08cdfc5a9
md"""
... and for R (and Python) there are also many code examples in the excellent textbook ["Introduction to Statistical Learning"](https://www.statlearning.com/).

Although it does not matter which language you choose for this course, it may be worthwhile to know a bit more about the pros and cons of each language. On the internet one can find many articles comparing those three languages; as a tiny overview the following table may help.

|              | Julia                 | Python                | R                    |
|--------------|:----------------------|:----------------------|:---------------------|
|created       | 2012                  | 1991                  | 1993                 |
|advantages    | + speed               | + large community     | + great statistics   |
|              | ⠀⠀runs as fast as C   | + many mature packages| ⠀⠀and bioinformatics |
|              | + interoperability    | ⠀⠀for datascience/ML: | ⠀⠀packages           |
|              | ⠀⠀easy to call        | ⠀⠀numpy, pandas, jax  | + many mature packages
|              | ⠀⠀python, R, C etc.   | ⠀⠀pytorch, matplotlib | ⠀⠀for datascience/ML:|
|              | + composability       | ⠀⠀scikit-learn        | ⠀⠀ggplot2, tidyverse |
|              | ⠀⠀easy to combine     | + many tutorials and  | ⠀⠀dplyr              |
|              | ⠀⠀different packages  | ⠀⠀code snippets for   |                      |
|              | ⠀⠀and modules thanks  | ⠀⠀data science and    |                      |
|              | ⠀⠀to multiple dispatch| ⠀⠀machine learning    |
|              | + Multithreading, GPU | + popular in industry |
|              | ⠀⠀easy to write fast  |                       |
|              | ⠀⠀parallelized code   |                       |
|              | + good package manager|                       |                     |
|disadvantages | - fewer features      | - slow                | - slow              |
|              | - fewer code snippets | - too simple (?)      | - uncommon syntax   |
|              | ⠀⠀on the internet     |                       |                     |
|popular for   | * scientific computing| * front-end           | * statistics        |
|              |                       | ⠀⠀many fast libraries | * bioinformatics    |
|              |                       | ⠀⠀have a python API   |                     |
|              |                       |

At some point in your career you will probably program in each of these languages.
For now you should decide, if you want to use this course to explore at the same time a new programming language or if you prefer to improve your skills in a language you know already.

If you want to learn more about $(MLCourse.language_selector())
"""

# ╔═╡ 6b0a0ff0-d6de-4665-8d10-6e6bd758d707
md"we recommend to have a look at"

# ╔═╡ cae1c3a3-2731-4f5c-a4b7-1dba075c7fda
mlstring(
md"""
* [Get started with Julia](https://julialang.org/learning)
* [Julia Youtube tutorials](https://www.youtube.com/@TheJuliaLanguage/playlists?view=50&sort=dd&shelf_id=5)
* [Julia Programming for ML (TU Berlin)](https://adrhill.github.io/julia-ml-course/)
* [Machine Learning in Julia (MLJ)](https://alan-turing-institute.github.io/MLJ.jl/dev/)
* [the Julia manual](https://docs.julialang.org/en/v1/)
* [cheat sheet](https://juliadocs.github.io/Julia-Cheat-Sheet/)
* [Noteworthy differences to other programming languages](https://docs.julialang.org/en/v1/manual/noteworthy-differences/)

If you decide to use Julia, install `juliaup` by following the descriptions for your platform: [Windows](https://github.com/JuliaLang/juliaup#windows)/[Mac and Linux](https://github.com/JuliaLang/juliaup#mac-and-linux).
Once `juliaup` is installed, run

```bash
juliaup add release
```

in a terminal.
"""
,
md"""
"""
)


# ╔═╡ c3ec2db2-a9fd-4118-90f8-1f59c54c42aa
md"""
# 2. Setup Programming Environment

Once you have chosen the programming language, you should decide which editor to use.
We recommend for all languages the [VS Code Editor](https://code.visualstudio.com/).
Alternatives include VIM/NeoVIM, Emacs, Rstudio, PyCharm, Jupyter Notebooks/Lab.

For $(MLCourse.language_selector())
"""

# ╔═╡ 67209e5c-0d11-4d61-ba1d-deb66f66efc4
md"we recommend to install the following packages in a clean environment."

# ╔═╡ 8ea85113-8872-4f9f-87d0-63cf8c8293ba
mlstring(
md"""
In a terminal, for example in the VS Code terminal, navigate to the folder where you want to store the exercise solution files and open julia there.
In the julia REPL press `]` to enter the package manager.
Create a new environment with

```julia
(@v1.9) pkg> activate MLCourseSolutions
(MLCourseSolutions) pkg> add DataFrames, Distributions, Plots, CSV, OpenML
```
Leave package mode with the `backspace` key and load the packages you want with
```julia
julia> using DataFrames, Distributions, Plots
```

Whenever you want to go back to working with this environment, navigate to the folder that contains `MLCourseSolutions`, open julia, type `]` and run again
```julia
(@v1.9) pkg> activate MLCourseSolutions
```
"""
,
md"""
"""
)


# ╔═╡ 4a03cfae-9876-4cf0-a498-d750853191cb
md"""# 3. Exercises
We will work a lot with real and artificial datasets.
To prepare for this work, we will familiarize ourselves in these exercises with the creation and manipulation of dataframes, loading and saving of data and plotting.

Knowing the tools for these tasks is essential. You should therefore spend some time looking at the documentation of the following packages:

$(MLCourse.language_selector())` `
"""

# ╔═╡ 4e55d688-15c4-49bd-be7c-5ea49add645d
mlstring(
md"""
* [DataFrames](https://dataframes.juliadata.org/stable/)
* [Distributions](https://juliastats.org/Distributions.jl/stable/)
* [Plots](https://docs.juliaplots.org/latest/)
* [CSV](https://csv.juliadata.org/stable/)
* [OpenML](https://juliaai.github.io/OpenML.jl/stable/)
"""
,
md"""
"""
)

# ╔═╡ 20f339a8-4f56-45c8-9ea3-d2da256565af
md"""
#### Exercise 1
$(MLCourse.language_selector())` `


Create an artificial data set with 3 columns named A, B and C.
   1. Column A contains 10 random numbers sampled from a Bernoulli distribution with rate 0.3, column B contains 10 random numbers from the uniform distribution over the interval [0, 1), and column C contains 10 samples from the set `("hip", "hop")`, where `"hip"` and `"hop"` have equal probability. *Hint:* $(mlstring(md"You can use the function `Bernoulli` from the `Distributions` package and the built-in function `rand`.", ""))
   2. Create a vector whose i'th element contains the sum of the i'th entries of columns A and B of the data frame created in 1.
   3. Select all rows with `"hop"` in column C and display the resulting data frame.
"""

# ╔═╡ 146b4094-f790-478d-b9f7-c0a9a2a3e5a2
md"""
#### Exercise 2
A common "trick" to generate 100 samples of a binary variable with probability ``p = 0.7`` for `true` (and probability ``1-p = 0.3`` for `false`) is to run the code

"""


# ╔═╡ 36e33686-4220-42dd-83a3-cdaeedd30d5b
mlcode(
"""
rand(100) .> 0.7
"""
,
"""
"""
)

# ╔═╡ 4ffa4078-67f7-4e0c-a196-80d94ff49196
md"""
Explain why this trick produces the desired result.
"""

# ╔═╡ dbe2c72c-bbc6-4912-af98-e8f473b7ac27
md"""
#### Exercise 3
$(MLCourse.language_selector())` `

Comprehension is a useful tool to generate artificial data.

   1. Use comprehension (see $(mlstring(md"[here](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions)", ""))) to create a vector with all numbers of the form ``x^y`` with ``x=1, \ldots, 10``, ``y = 2, \ldots, 7`` and ``y > x``.
   2. Compute the sum of the square root of these numbers.
"""

# ╔═╡ 2c527d8d-5e11-4089-ad32-355fc7ac5e10
md"""
#### Exercise 4
$(MLCourse.language_selector())` `

1. Write a function that returns the smallest entry of a vector (without using the built-in functions $(mlstring(md"`minimum`, `argmin` or `findmin`", ""))).
2. Test your function on a vector of 10 randomly sampled integers in the range 1 to 100.
"""

# ╔═╡ af94fccd-bb3e-498a-8d2a-f8e75740cd29
md"""
#### Exercise 5
$(MLCourse.language_selector())` `

In this exercise, we load some data, write it to a CSV file and visualize it.

1. Look at the description of the openml dataset 61. *Hint:* $(mlstring(md"use the function `OpenML.describe_dataset`.", ""))
2. Load dataset 61 from openml. *Hint:* $(mlstring(md"use the function `OpenML.load` and convert the loaded table into a `DataFrame`.", ""))
3. Write the data to a CSV-file on your harddisk. *Hint:* $(mlstring(md"use the function `CSV.write`", "")).
4. Load the data in the CSV file as a dataframe.  *Hint:* $(mlstring(md"use the function `CSV.read(filename, DataFrame)`", "")).
3. Produce a scatter plot that shows the `sepallength` versus the `sepalwidth`. Make sure both axes have the correct label.
4. Add to the same plot the "identiy"-line ``y = x`` in red.
"""

# ╔═╡ d6e5fe02-21a5-486c-a237-878be1d95439
MLCourse.list_notebooks(@__FILE__)

# ╔═╡ 8933325c-3be3-4a7e-bf71-df694f6c8776
Markdown.parse(haskey(ENV, "html_export") ? "This page was created with an interactive [Pluto notebook](https://plutojl.org/). If you want to run it locally on your machine, follow the instructions [here](https://github.com/jbrea/MLCourse)." :
"This is an interactive Pluto notebook. You can create new cells by clicking any \"+\" above or below existing cells. In these cells you can write code and run it by clicking the play button or [Shift] + [Enter] on your keyboard (or [Ctrl] + [Enter]).
The output gets displayed above the cell. Have a look at [this website](https://plutojl.org/) if you want to learn more about Pluto notebooks.

To get help, please open the Live docs at the bottom right of this page and click on the code you want to get help for.")


# ╔═╡ 0314376e-ff8c-4ad0-8a4b-f94f04f31f2c
MLCourse.FOOTER

# ╔═╡ Cell order:
# ╟─f3508747-da29-47c9-a98e-22ea15caaf2f
# ╟─7343bb19-ed3f-4db1-be83-ca165099dcc3
# ╟─fdae59d6-5cc6-40d3-9693-1ce08cdfc5a9
# ╟─6b0a0ff0-d6de-4665-8d10-6e6bd758d707
# ╟─cae1c3a3-2731-4f5c-a4b7-1dba075c7fda
# ╟─c3ec2db2-a9fd-4118-90f8-1f59c54c42aa
# ╟─67209e5c-0d11-4d61-ba1d-deb66f66efc4
# ╟─8ea85113-8872-4f9f-87d0-63cf8c8293ba
# ╟─4a03cfae-9876-4cf0-a498-d750853191cb
# ╟─4e55d688-15c4-49bd-be7c-5ea49add645d
# ╟─20f339a8-4f56-45c8-9ea3-d2da256565af
# ╟─146b4094-f790-478d-b9f7-c0a9a2a3e5a2
# ╟─36e33686-4220-42dd-83a3-cdaeedd30d5b
# ╟─4ffa4078-67f7-4e0c-a196-80d94ff49196
# ╟─dbe2c72c-bbc6-4912-af98-e8f473b7ac27
# ╟─2c527d8d-5e11-4089-ad32-355fc7ac5e10
# ╟─af94fccd-bb3e-498a-8d2a-f8e75740cd29
# ╟─d6e5fe02-21a5-486c-a237-878be1d95439
# ╟─8933325c-3be3-4a7e-bf71-df694f6c8776
# ╟─0314376e-ff8c-4ad0-8a4b-f94f04f31f2c
# ╟─065a1e67-6b63-43df-9d6d-303af08d8434
# ╟─2b67233e-76ba-40be-81e2-787fbe5d3641
