# R Basics Introduction

A 10–15-minute, hands-on introduction to R and RStudio. Run a few commands, inspect a small dataset, and make a scatter plot. No programming experience is needed.

## What you will learn

- Tell R (the programming language) from RStudio (an application for writing and running R code).
- Run a command, add a comment with `#`, and save a value with `<-`.
- Check your working directory and load a package.
- Do simple arithmetic and recognize numbers, text, logical values, vectors, and data frames.
- Inspect and summarize data, select and filter observations, and draw a scatter plot.

## Before the session

1. Install [R](https://www.r-project.org/) for your operating system.
2. Install [RStudio Desktop](https://posit.co/download/rstudio-desktop) if you want the editor used in the session. RStudio is optional, but R itself is required.
3. Download this repository and extract it, or clone it with Git. Open `R-Basics-Introduction.Rproj` in RStudio.
4. In the RStudio **Console**, install the plotting package once if it is not already installed (this step needs an internet connection):

   ```r
   install.packages("ggplot2")
   ```

`install.packages()` downloads a package onto your computer. `library(ggplot2)` makes it available in the current R session; run `library()` again after restarting R.

## Run the lesson

Open `scripts/basics_intro.R`. Place the cursor on a line and click **Run**, or press **Ctrl+Enter** (Windows/Linux) or **Command+Return** (macOS). The result appears in the Console; charts appear in **Plots**. Run the script from top to bottom, one command or short group at a time. Lines beginning with `#` are comments and do not run.

You can also type commands directly in the Console and press Enter. When you open the `.Rproj` file, RStudio uses the project folder as the working directory. `getwd()` shows that folder, and `list.files()` shows files in it. The script shows a commented `setwd()` example, but you do not need it when using this project.

The final bar chart and the second filtering example are **optional**. For the short lesson, finish with the scatter plot.

## Lesson at a glance

| Time | Core demonstration | Commands to prioritize |
| --- | --- | --- |
| 0–1 min | R, RStudio, Console, comments, assignment | `x <- 10`, `x + y` |
| 1–3 min | Project folder and packages | `getwd()`, `list.files()`, `library(ggplot2)` |
| 3–5 min | Arithmetic and common object types | `10 / 5`, `2^3`, `10 %% 3`, `class(age)` |
| 5–9 min | Create and inspect student data | `data.frame()`, `head()`, `str()`, `summary()` |
| 9–11 min | Analyze a column and filter rows | `$`, `mean()`, `[condition, ]`, `passed` |
| 11–14 min | Plot study hours against exam score | `ggplot()`, `aes()`, `geom_point()` |
| 14–15 min | Recap and one student question | Revisit the scatter plot |

Ask students to install `ggplot2` before class. For a 10-minute version, demonstrate one arithmetic expression, `head()` and `mean()`, then move straight to the scatter plot. Leave the other calculations, `summary()`, and the filtering commands for students to try afterward.

## The example data

The `students` data frame is **synthetic and illustrative**, with eight rows. It is created in the script, so there is no separate data download.

| Column | Meaning |
| --- | --- |
| `student_id` | Number identifying each example student. |
| `study_hours` | Hours spent studying for an example exam. |
| `attendance` | Class attendance percentage, from 0 to 100. |
| `exam_score` | Example exam score, from 0 to 100. |
| `passed` | Added later: `TRUE` when `exam_score` is at least 50. |

The mean exam score is **73.125**, and the mean study time is **3.75 hours**. In these made-up data, students with more study hours tend to have higher scores. The plot shows an association in this example; it cannot establish that extra study caused the score difference.

## What the main commands mean

| Command | Plain-English meaning |
| --- | --- |
| `value <- 10` | Store `10` under the name `value`. |
| `c(70, 80, 90)` | Combine values into a vector. |
| `data.frame(...)` | Make a table with named columns. |
| `class(students)` / `str(students)` | Check the object type / column types and contents. |
| `head(students)` / `summary(students)` | See the first rows / quick statistics. |
| `students$exam_score` | Get the `exam_score` column. |
| `students[students$exam_score > 80, ]` | Keep rows with a score over 80; the empty part after the comma keeps all columns. |
| `ggplot(students, aes(...))` | Choose the data and map columns to the axes. |
| `geom_point()` | Add dots to make a scatter plot. |

## After the session: try these

1. Change one exam score in `data.frame()` and rerun the script. What happens to `mean(students$exam_score)`?
2. Find students whose attendance is at least 80% using `students[students$attendance >= 80, ]`.
3. Create `students$high_attendance` that is `TRUE` when attendance is at least 80%.
4. Change the scatter plot's title or the label on its x-axis. Then try the optional bar chart.

## Common problems

- **`there is no package called 'ggplot2'`:** Run `install.packages("ggplot2")` in the Console, then rerun `library(ggplot2)`.
- **`object 'students' not found`:** Run the `students <- data.frame(...)` block first; R needs objects to be created before they are used.
- **The Console shows `+` instead of `>`:** R is waiting for the rest of a command, often a closing `)` or a plot line after `+`. Finish the command, or press Esc to cancel it.
- **A file cannot be found:** Open the `.Rproj` file and check the folder with `getwd()` and `list.files()`.
- **No visible result after clicking Source:** For this lesson, use **Run** to execute lines interactively and see each result.

## Follow-up resources

- [RStudio Projects guide](https://docs.posit.co/ide/user/ide/guide/code/projects.html) for keeping files together.
- [RStudio beginner learning resources](https://education.rstudio.com/learn/beginner/) for a tour of the interface.
- [ggplot2 documentation](https://ggplot2.tidyverse.org/) for more plots.
- [R for Data Science (2e)](https://r4ds.hadley.nz/) for a longer introduction to data analysis.

## Repository contents

```text
R-Basics-Introduction/
├── README.md
├── R-Basics-Introduction.Rproj
├── .gitignore
├── scripts/
│   └── basics_intro.R
├── data/
│   └── README.md
└── outputs/
    └── README.md
```

The dataset lives in `scripts/basics_intro.R` to keep the first lesson self-contained. The `data/` and `outputs/` folders are available for future exercises; running this lesson does not write any files.
