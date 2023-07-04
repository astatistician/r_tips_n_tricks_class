# Created by Piotr Prostko 
# Presented on 04/07/2023
# email contact: piotr.prostko@uhasselt.be or prostko.p@gmail.com

# Disclaimer: I prepared this script to share the experience of working in
# RStudio throughout my PhD. Apologies in advance for any unintended mistakes in
# the following codes and for presenting potentially obvious-by-now commands (I
# started learning R in the pre-tidyverse era)

library(tidyverse)
# https://www.tidyverse.org/packages/

# RStudio keyboard shortcuts ----------------------------------------------

# KS - keyboard shortcut

# References:
# my own exploration of ALT + SHIFT + K 
# part1: https://appsilon.com/r-studio-shortcuts-and-tips-2/
# part2: https://appsilon.com/r-studio-shortcuts-and-tips-part-2/

# That source notes: Although the gifs have both PC and Mac shortcuts, I am
# using the former in the text. If you are a Mac user, most of the shortcuts
# fall under this dependence: Ctrl == ⌘ Command  &&  Alt == ⌥ Option  
# but keep in mind that in some cases Ctrl will also be a Control key on Mac
# which can be confusing. You can always look up the proper shortcut in R Studio
# with ⌥ Option+Shift+K (Alt+Shift+K)

# KS1: PG UP/DN - move vertically through your document
  
# KS2: CTRL + HOME/END - move to the beginning/end of the entire script
  
# KS3: CTRL + LEFT/RIGHT ARROW - move to the left/right by ONE 'WORD' instead of one cursor position
  
# KS4: HOME/END - move to the beginning or the end of the current line
  
# KS5: SHIFT + ARROWS - select a piece of code within (left/right arr, try adding HOME or END) or across lines (up/down arr)
  
# KS6: ALT + UP/DN ARROW - move the selected lines of code
  
# KS7: CTRL + SHIFT + M - pipe operator from package magrittr, named after the
# famous Belgian surrealist painter René Magritte
# %>% %>% %>% %>% %>% 
  
# KS8: ALT + minus sign - the '<-' assignment operator
# <- <- <- <- <- <- 
  
# KS10: CTRL + SHIFT + C - (un)comment the line(s)
# comment me or I will throw an error
  
# KS11: ALT + SHIFT + DOWN ARR - copy the line(s) [sometimes while doing this you
# may change your keyboard language]
head(iris)
  
# KS12: ALT + ENTER - run the current line of code without proceeding to the next
# line BTW, I was raised on CTRL + R and ALT + R shortcuts for running things,
# but this is a matter of taste
head(starwars)
tail(starwars)
  
# KS13: CTRL + ALT + B(E) - run everything above (or below) your current position in the code

# KS14: TAB: code completion or path completion, also the built-in code snippets are handy

# autocomplete the lines below
lib
for
mat
app
fun

# this allows for easy path specification within or outside the working
# directory (but the WD is the starting point)
path1 <- '' 
path2 <- '../' 

# NAVIGATING THROUGH R STUDIO

# KS15: moving the cursor to 
#  the code editor: CTRL + 1 
#  the console: CTRL + 2

#  the history tab: CTRL + 4
#  the environment tab (default): CTRL + 8

#  the files tab (default): CTRL + 5
#  the plots tab (default): CTRL + 6

# add SHIFT to any of the above and it will maximise the selected pane (repeat
# this combination to undo)

# KS16: CTRL + TAB + (shift) - switch between tabs with open R programs
# press CTRL + SHFIT + N to create untitled R scripts and to be able to toggle
# between tabs

# KS17: CTRL + W - close a tab
# KS18: CTRL + SHIFT + . - search among open tabs

# NEAT CODE ORGANISATION

# KS19: CTRL + I - nice code indentation (though not always work, KS20 is better)
for(i in 1:10){
x=i %% 2 
if (x==0) print('div by 2') 
else print('not div by 2')}

# KS20: CTRL + SHIFT + A - nice code formatting 
for(i in 1:10){
x=i %% 2 
if (x==0) print('div by 2') 
else print('not div by 2')}

# KS21: CTRL + SHIFT + / - nice comment formatting a way too long comment: Lorem
# ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate luctus
# commodo. Phasellus fermentum dolor nec urna

# KS22: CTRL + SHIFT + R - insert structured code headers!!

# KS23: CTRL + SHIFT + O - open and close the pane with code headers

# KS24: ALT + L (+SHIFT) - collapse (or open) LOCAL code section embraced with curly parentheses

# KS25: ALT + O (+SHIFT) - collapse (or open) EVERY code section embraced with
# curly parentheses. Mnemonic: L - local, O - 'OLL~ALL'

# OTHER SHORTCUTS

# KS26 press F1 while having the cursor on a function/R object to get its
# documentation 
?lm

# KS27 F2 - similar but shows the source code (if available). F2 on
# data frames is equivalent to View(df)
iris
# click on the wizard wand for more info

# KS28: CTRL + L - clear console

# KS29: CTRL + SHIFT + F10 - restart the RStudio session 

# KS30: CTRL + .(i.e., dot) - go to a file/function

# KS31: CTRL + shift + F - search in multiple files inside a specified directory directories

# KS32: CTRL + P - jump between brackets
set.seed(123)
LETTERS[sample(seq_along(LETTERS), size = 5)]

# KS33: CTRL + up/down arr - do this in the console to browse through the relevant command history

# KS34: CTRL + 4, and then browse through the relevant command history, press ENTER or SHIFT + ENTER 
 
# KS35: CTRL + F - search functionality
# F3 - to go the next hit
# SHIFT + F3 - go to the previous hit

# KS36: CTRL + ALT + UP/DN ARROW - cursor selection across multiple lines;
# create a vector from the following values copied from an xlsx files
0.2
0.2
0.2
0.2
0.2
0.1
0.1

# KS37: CTRL + SHIFT + S - source the current file

# Cool addins:

# datapasta - addin for copying from websites and pasting as R objects (tribbles)
install.packages('datapasta')
# go to https://cran.r-project.org/web/packages/datapasta/vignettes/how-to-datapasta.html 
# select the first table and copy it,
# go to RStudio --> Tools --> Addins --> Browse addins --> data pasta paste as a data frame

# click and drag ggplot generation
install.packages('esquisse')

p1 <- starwars %>%
 filter(!(hair_color %in% c("blond", "auburn, white", "grey", "unknown")) | is.na(hair_color)) %>%
 ggplot() +
 aes(x = mass, y = height, colour = sex) +
 geom_point(shape = "circle", size = 2.65) +
 geom_smooth(span = 0.29) +
 scale_color_viridis_d(option = "viridis", direction = 1) +
 theme_classic() +
 theme(legend.position = "none")

# manual modifications of theme elements
install.packages('ggThemeAssist')

# addin for the nice formatting of the entire scripts
install.packages("styler")
# Addins --> Style active file or Style selection

# Optional
{
  # KS38: CTRL + ALT + X - function extraction, 
  
  # KS39: CTRL + ALT + V for variable extraction
  
  # KS40: pipe + ALT - renaming in scope
  # change rnorm to runif
  x1 <- rnorm(0, 1, 5)
  x2 <- rnorm(0, 1, 10)
}


# Selected processing operations with tidyverse ---------------------------

# References:
# https://r4ds.had.co.nz/
# ggplot, tidyr, dplyr documentation

# cool tidyr functions
# complete(), drop_na(), replace_na(), fill(), expand_grid(),
# pivot_, unnest(), unnest_wider(), unnest_longer(), hoist()

## ggplot ------------------------------------------------------------------

# Data and mappings specified in the ggplot() call are fed into the subsequent
# geoms; however 'local' values (i.e. data/mappings specified within individual geoms) have a higher
# priority. Thus it's possible to specify different datasets and/or mappings for different geoms.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

df <- data.frame(displ2 = 6, hwy2 = 40)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(colour = class)) + 
  geom_point(data = df, aes(x = displ2, y = hwy2), size = 5)

# several tricks for manipulating plot legend using guides() function: 
ggplot(mpg, aes(x = displ, y = hwy, colour = fl, shape = drv)) +
  geom_point() +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 8), order = 2, title = ''), 
         shape = guide_legend(ncol = 1, override.aes = list(size = 0.5), order = 1, title.position = 'right', label.position = 'bottom')) 

ggplot(mpg, aes(x = displ, y = hwy, colour = fl, shape = drv)) +
  geom_point() +
  theme(legend.position = "bottom") +
  guides(colour = 'none', 
         shape = guide_legend(ncol = 1, override.aes = list(size = 0.5), order = 1, title.position = 'right', label.position = 'bottom')) 
# order - control order of legends
# nrow, ncol - how legend elements should be displayed

## dplyr -------------------------------------------------------------------

starwars %>% 
  group_by(species) %>% 
  summarise(mean_height = mean(height, na.rm = TRUE))

# group_by() + mutate() computes a given 'summary statistic' and joins it to the
# input dataset
starwars %>% 
  group_by(species) %>% 
  mutate(mean_height = mean(height, na.rm = TRUE), .before = everything())

starwars %>% 
  group_by(species) %>% 
  transmute(mean_height = mean(height, na.rm = TRUE))

mtcars_w_rownames <- mtcars %>% rownames_to_column("model")

# pull and create a named vector where the names come from another variable
mtcars_w_rownames %>% pull(hp)
mtcars_w_rownames %>% pull(hp, name = model)

# rename within select
mtcars %>% select(mpg2 = mpg, everything())

# use predicate functions (those returning TRUE or FALSE) to select columns (e.g. useful when you need only numeric vars)
mtcars_w_rownames %>% select(where(is.numeric))
mtcars_w_rownames %>% summarise(across(where(is.numeric), mean))

# you can modify the group by variables on the fly
group_by(starwars, new = case_when(eye_color == "black" ~ "black",
                                   eye_color == "blue" ~ "blue",
                                   TRUE ~ "other")) %>% 
  summarise(mean_height = mean(height, na.rm = TRUE))

# proper SQL would not allow for this but in tidyverse RHS or LHS in filter can be a summary statistic value
mtcars %>% filter(disp == max(disp))
mtcars %>% group_by(cyl) %>% filter(n() > 10)


# Intro to tidyverse::purrr -----------------------------------------------

# References:
# https://r4ds.had.co.nz/
# purrr documentation
# https://www.monicathieu.com/posts/2020-04-08-tidy-multilevel/
# https://github.com/jennybc/row-oriented-workflows

## basics of purrr ---------------------------------------------------------

{
  # this won't work cause the new variable has two values per each observation.
  mtcars_w_rownames %>%   
    group_by(cyl) %>%
    mutate(quan = quantile(mpg, c(0.25, 0.75)))
  
  # we must wrap it into a list
  (temp <- mtcars_w_rownames %>%
      group_by(cyl) %>% 
      mutate(quan = list(quantile(mpg, c(
      0.25, 0.75
    )))))
  
  # working with such a list-column may be awkward at times
  temp$quan[[1]]
  temp$quan[[1]][1]
  temp$quan[[2]]
  
  # since this is a list-column, we could continue using standard tools for
  # processing such as for loops or lapply
  
  new_vec <- temp$quan
  for (i in seq_along(temp$quan)) {
    new_vec[[i]] <- temp$quan[[i]] + 10
  }
  # quite lengthy and repetitive
  
  lapply(temp$quan, function(x) x = x + 10)
  # this is ok, but doesn't have cool options as map() does
  
  # map() doc says:
  
  # map(.x, .f, ..., .progress = FALSE)
  # .x A list or atomic vector.
  # .f A function, specified in one of the following ways:
  # A named function, e.g. mean.
  # An anonymous function, e.g. ⁠\(x) x + 1⁠ or function(x) x + 1.
  # A formula, e.g. ~ .x + 1. You must use .x to refer to the first argument. Only
  # recommended if you require backward compatibility with older versions of R.
  # output: a list
  
  1:10 %>% 
    map(rnorm, n = 10)
  
  # Pros of map()
  
  # 1) convenient syntax for anonnymous functions
  map(temp$quan, ~. + 10)
  
  # 2) easier element extraction from complex lists
  
  # .default specifies value for elements that are missing or NULL
  l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
  
  # from each element of l1, extract an element named 'a'; return NA if such
  # doesn't exist
  l1 %>% map("a", .default = NA)
  
  # from each element of l1, extract its second value
  l1 %>% map(2, .default = NA)
  
  l2 <- list(
    list(num = 1:3,     letters[1:3]),
    list(num = 101:103, letters[4:6]),
    list()
  )
  
  l2 %>% map(c(2, 2))
  
  x <- list(1, 1, 1)
  y <- list(10, 20, 30)
  map2(x, y, ~.x + .y)
  
  x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
  str(x)
  pluck_depth(x)
  
  x %>%
    map_depth(2, ~ paste(.x, collapse = "/")) %>%
    str()
  
  l1 <- list(
    obj1 = list(
      prop1 = list(param1 = 1:2, param2 = 3:4),
      prop2 = list(param1 = 5:6, param2 = 7:8)
    ),
    obj2 = list(
      prop1 = list(param1 = 9:10, param2 = 11:12),
      prop2 = list(param1 = 12:14, param2 = 15:17)
    )
  )
  str(l1)
  pluck_depth(l1)
  
  # In the above list, "obj" is level 1, "prop" is level 2 and "param"
  # is level 3. To apply sum() on all params, we map it at depth 3:
  tmp <- l1 %>%  
    modify_depth(3, sum) 
  str(tmp)
  
  # ?map_dbl, ...
  # ?map2,
  # ?pmap,
  # imap, walk, ...
  
  # cheatsheet is your friend
  # https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf
  
  # useful funs for list processing
  l1 <- list(a = "a", b = NULL, c = integer(0), d = NA, e = list())
  str(l1)
  compact(l1)
  
  x <- list(1, list(2, 3), list(4, list(5)))
  str(x)
  x  %>% list_flatten() %>% str()
  
  x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
  x %>% list_transpose()
}
  
## nest + map + unnest workflow -----------------------------------------------------
{
  mtcars_w_rownames_nested <- mtcars_w_rownames %>% 
    group_by(cyl) %>% 
    nest()
  
  lin_mod_fun <- function(x) lm(data = x, mpg ~ hp)
  
  mtcars_w_rownames_nested2 <- mtcars_w_rownames_nested %>% 
    mutate(lin_mod = map(data, lin_mod_fun),
           rsq = map_dbl(lin_mod, ~summary(.)$r.squared),
           res = map(lin_mod, residuals)) %>% 
    select(-lin_mod) %>% 
    unnest(cols = c(data, res))
  
  # the workflow above resembles a lot BY statement in various SAS procedures 
}


## lists <--> df -----------------------------------------------------------

{
  # list --> df
  tmp_list <- list(a = 1:2, b = 3:4, c = 5:6)
  
  list2DF(tmp_list)
  
  df_from_list <- enframe(tmp_list, name = 'var_name', value = 'var_value') %>% 
    unnest(var_value) %>% 
    mutate(var_value2 = var_value * 2)
  
  tmp_list <- list(a = 1:2, b = 3:4, c = 5:8)
  # list2DF(tmp_list) will fail
  
  # df --> list
  deframe(df_from_list[,1:2]) 
}


# Wrappers on tidyverse functions -----------------------------------------

# References:
# https://dplyr.tidyverse.org/articles/programming.html
# Metaprogramming chapter from https://adv-r.hadley.nz/index.html
# https://raw.githubusercontent.com/rstudio/cheatsheets/master/tidyeval.pdf

## Non-Standard Evaluation -------------------------------------------------

# Why should we even bother? 

# Because computers need to be told what to do.

# Because Hadley Wickham wants so ;-) (aes_string() is deprecated in ggplot)

# Because writing code like 
starwars[starwars$homeworld == "Naboo" & starwars$species == "Human", ,]

# is extremely tiring, and even base R functions such as ave(), with() also allow for using
# 'bare' variable names
with(mtcars, mpg[cyl == 8  &  disp > 350])

# instead of 
mtcars$mpg[mtcars$cyl == 8  &  mtcars$disp > 350]
# This shows that non-standard evaluation is also a part of base R

# Also look at SAS macroprogramming and its variety of quoting functions: %Str,
# %Nrstr, %Bquote, %Nrbquote, %Superq !!!

# https://dplyr.tidyverse.org/articles/programming.html
# Docu says:

# Tidy evaluation is a special type of non-standard evaluation used throughout
# the tidyverse. There are two basic forms found in dplyr:
#
# arrange(), count(), filter(), group_by(), mutate(), and summarise() use data
# masking so that you can use data variables as if they were variables in the
# environment (i.e. you write my_variable not df$my_variable).

# across(), relocate(), rename(), select(), and pull() use tidy selection so you
# can easily choose variables based on their position, name, or type (e.g.
# starts_with("x") or is.numeric).

# Data masking - blurs the line between two meanings of the word “variable”:
# env-variables are “programming” variables that live in an environment. They are usually created with <-
# data-variables are “statistical” variables that live in a data frame.

df <- data.frame(x = runif(3), y = runif(3))
# df - env var; df$x - data var

# PROBLEM: indirection
# 1) When you have the data-variable in a function argument, embrace the argument in
# doubled braces, like filter(df, {{ var }})

# my interpretation within function environment, var is env variable, causing
# indirection in data-masking functions expecting data variables

var_summary <- function(data, var) {
  data %>%
    summarise(n = n(), min = min({{ var }}), max = max({{ var }}))
}
mtcars %>% 
  group_by(cyl) %>% 
  var_summary(mpg)

# 2) env-variable that is a character vector, you need to index into the .data
# pronoun with [[, like summarise(df, mean = mean(.data[[var]])).
#
# The following example uses .data to count the number of unique values in each
# variable of mtcars:
#                                                                                            }
# Note that .data is not a data frame; it’s a special construct, a pronoun, that
# allows you to access the current variables either directly, with .data$x or
# indirectly with .data[[var]]. Don’t expect other functions to work with it.

# Tidy selection

# PROBLEM: indirection
# When you have the data-variable in an env-variable that is a function
# argument, you use the same technique as data masking: you embrace the argument
# by surrounding it in doubled braces. The following function summarises a data
# frame by computing the mean of all variables selected by the user:

summarise_mean <- function(data, vars) {
  data %>% summarise(n = n(), across({{ vars }}, mean))
}
mtcars %>% 
  group_by(cyl) %>% 
  summarise_mean(where(is.numeric))

# When you have an env-variable that is a character vector, you need to use
# all_of() or any_of() depending on whether you want the function to error if a
# variable is not found. The following code uses all_of() to select all of the
# variables found in a character vector; then ! plus all_of() to select all of
# the variables not found in a character vector:

vars <- c("mpg", "vs")
mtcars %>% select(all_of(vars))
mtcars %>% select(!all_of(vars))

# Structuring your analysis and reporting pipeline ------------------------

# under construction

# code versioning definitely plays an important role
# https://gjbex.github.io/Version-control-with-git/
