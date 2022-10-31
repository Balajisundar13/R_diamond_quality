## Step 1: Using `R packages`
`Packages` are a key part of working with `R.`They contain bundles of code called `functions` that allow you to perform a wide range of tasks in `R.` 
Some `packages` are installed by default, but many others can be downloaded from an external source such as the Comprehensive R Archive Network, or CRAN.
Here, I will be using a package called `tidyverse.` The `tidyverse` package is actually a collection individual `packages` that can help to perform a wide variety of analysis tasks.
To install the `tidyverse` package, execute the code in the code chunk below by clicking on the green arrow button in the top right corner. When you execute a code chunk in RMarkdown, the output will appear in the .rmd area and in console.

```{r}
install.packages("tidyverse")
```

Once a package is installed, we can load it by running the `library()` function with the package name inside the parentheses, like this:
  
  ```{r}
library(tidyverse)
```
Installing and loading the `tidyverse` package may take a few minutes-- be sure to wait for it to finish running before moving on to the next steps!
Now that i have loaded an `R package,` you can start exploring some data. 

# Step 2: Viewing data
One common function we can use to preview the data is the `head()` function, which displays the columns and the first several rows of data. You can test out how the `head()` function works by running the chunk below:
  
  ```{r}
head(diamonds)
```

In addition to `head()` there are a number of other useful functions. For example, the `str()` and `glimpse()` functions will both return summaries of each column in your data arranged horizontally.

```{r}
str(diamonds)
```

```{r}
glimpse(diamonds)
```

The column names will return only the column names in the table
```{r}
colnames(diamonds)
```

## Step 3: Cleaning data
One of the most frequent tasks that Data Analyst will have to perform is to clean and organize your data. `R` makes this easy! There are many functions to perform important tasks easily and quickly.

For example, to rename the columns, or variables, in your data. There is a function for that: `rename().` You can check out how it works in the chunk below:
  
  ```{r}
rename(diamonds, carat_new = carat)
```
Here, the function is being used to change the name of `carat` to `carat_new`. This is a pretty basic change, but `rename()` has many options that can help to do more complex changes across all of the variables in your data.

For example, we can rename more than one variable in the same `rename()` code. The code below demonstrates how:
  
  ```{r}
rename(diamonds, carat_new = carat, cut_new = cut)
```

Another handy function for summarizing your data is `summarize().` You can use it to generate a wide range of summary statistics for your data. For example, if you wanted to know what the mean for `carat` was in this dataset, you could run the code in the chunk below:
  
  ```{r}
summarize(diamonds, mean_carat = mean(carat))
```
These functions are a great way to get more familiar with your data and start making observations about it. But sometimes, previewing tables isnt enough to understand a dataset. Luckily, `R` has visualization tools built in. 

## Step 4: Visualizing data
With `R,` you can create data visualizations that are simple and easy to understand or complicated and beautiful just by changing a bit of code. `R` empowers you to present the same data in so many different ways, which can help you create new insights or highlight important data findings.  One of the most commonly used visualization packages is the `ggplot2` package, which is loaded automatically when you install and load `tidyverse.` The `diamonds` dataset that you have been using so far is a `ggplot2` dataset.

To build a visualization with `ggplot2` you layer plot elements together with a `+` symbol. You will learn a lot more about using `ggplot2` later in the course, but here is a preview of how easy and flexible it is to make visuals using code:
  
  ```{r}
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()
```

The code above takes the `diamonds` data, plots the carat column on the X-axis, the price column on the Y-axis, and represents the data as a scatter plot using the `geom_point()` command. 

`ggplot2` makes it easy to modify or improve your visuals. For example, if you wanted to change the color of each point so that it represented another variable, such as the cut of the diamond, you can change the code like this:
  
  ```{r}
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point()
```

Wow, thats a busy visual! Sometimes when we are trying to represent many different aspects of your data in a visual, it can help to separate out some of the components. For example, we can create a different plot for each type of cut. `ggplot2` makes it easy to do this with the `facet_wrap()` function:

```{r}
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)
```

