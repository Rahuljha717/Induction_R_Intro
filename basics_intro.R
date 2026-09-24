# R basics: run these commands in order, one line or short block at a time.
# Core lesson: sections 1–6. The second filter and bar chart are optional.

# 1. R is the language; RStudio is an app for writing and running R code.
# Type a command in the Console and press Enter, or use Run on a script line.
# This is a comment: R ignores text after #.

x <- 10  # Store 10 in x.
y <- 5   # Store 5 in y.
x + y    # Running a calculation in the Console shows its result.

# 2. The working directory is the folder R looks in for relative file paths.
# Opening the included RStudio Project sets it to this repository's folder.
getwd()       # Show the current working directory.
list.files()  # List files in that folder.

# Example only: replace the path with an existing folder on your computer.
# Using the RStudio Project is easier than changing folders by hand.
# setwd("path/to/your/project")

# Packages add functions. Install once when needed; load in each new session.
# If you do not have ggplot2, run the next line once in the Console.
# install.packages("ggplot2")
library(ggplot2)

# 3. R can do arithmetic. Try each expression and read its result.
10 + 5  # Addition.
10 - 5  # Subtraction.
10 * 5  # Multiplication.
10 / 5  # Division.
2^3     # Exponent: 2 cubed.
10 %% 3 # Remainder after dividing 10 by 3.

# Save a calculation so that you can reuse it.
total <- x + y
total

# 4. Objects can hold different kinds of values.
age <- 20           # Numeric value.
name <- "Student"   # Character (text) value; quotes are required.
is_student <- TRUE  # Logical value: TRUE or FALSE, without quotes.
scores <- c(70, 80, 90, 85)  # A vector of several values.

class(age)
class(name)
class(is_student)
class(scores)

# 5. A data frame is a table: each column has a name, each row an observation.
# These eight student records are synthetic and used only for practice.
students <- data.frame(
  student_id = 1:8,
  study_hours = c(2, 3, 1, 5, 4, 6, 2, 7),
  attendance = c(75, 80, 65, 90, 85, 95, 70, 98),
  exam_score = c(60, 68, 45, 85, 78, 92, 62, 95)
)

class(students)   # Confirm that students is a data frame.
head(students)    # View the first six rows.
str(students)     # See the number of rows and each column's type.
summary(students) # See quick statistics for each numeric column.

# The $ sign selects a named column from a data frame.
students$exam_score

# Calculate the average exam score and average study time.
mean(students$exam_score)
mean(students$study_hours)

# Keep rows where exam_score is greater than 80; the comma keeps all columns.
students[students$exam_score > 80, ]

# Create a new TRUE/FALSE column using a pass mark of 50.
students$passed <- students$exam_score >= 50
head(students)

# OPTIONAL: another way to select rows, this time by study hours.
students[students$study_hours > 3, ]

# 6. A scatter plot compares two numeric columns.
# ggplot() chooses the table, aes() puts columns on the axes,
# and geom_point() draws one dot for each student.
ggplot(students, aes(x = study_hours, y = exam_score)) +
  geom_point(color = "#2063A5", size = 2.5) +
  labs(
    title = "Study Hours and Exam Score (Synthetic Data)",
    x = "Study hours",
    y = "Exam score (out of 100)"
  ) +
  theme_minimal()

# In these made-up data, more study hours go with higher exam scores.
# The plot alone does not show that studying caused the score difference.

# OPTIONAL: a bar chart shows one exam score for each student.
# geom_col() uses the numeric exam_score values as the bar heights.
ggplot(students, aes(x = student_id, y = exam_score)) +
  geom_col(fill = "#2063A5") +
  labs(
    title = "Exam Score by Student (Synthetic Data)",
    x = "Student ID",
    y = "Exam score (out of 100)"
  ) +
  theme_minimal()
