#' ## Data organisation with spreadsheets
#' 
#' ## Challenge: Discuss the following points with your neighbour
#' 
#' - Have you used spreadsheets, in your research, courses,
#'   or at home?
#' - What kind of operations do you do in spreadsheets?
#' - Which ones do you think spreadsheets are good for?
#' - Have you accidentally done something in a spreadsheet program that made you
#'   frustrated or sad?
#' 
#' ## Challenge: We're going to take a messy dataset and describe how we would clean it up.
#' 
#' 1. Download a messy dataset by clicking
#'   [here](https://github.com/UCLouvain-CBIO/WSBIM1207/raw/master/data/messy_covid.xlsx).
#' 
#' 2. Open up the data in a spreadsheet program.
#' 
#' 3. You can see that there are two tabs. The data contains various
#'   clinical variables recorded in various hospitals in Brussels during
#'   the first and second COVID-19 waves in 2020. As you can see, the
#'   data have been recorded differently during the March and November
#'   waves. Now you're the person in charge of this project and you want
#'   to be able to start analyzing the data.
#' 
#' 4. With the person next to you, identify what is wrong with this
#'   spreadsheet. Also discuss the steps you would need to take to clean
#'   up first and second wave tabs, and to put them all together in one
#'   spreadsheet.
#' 
#' **Important:** Do not forget our first piece of advice: to create a
#' new file (or tab) for the cleaned data, never modify your original
#' (raw) data.
#' 
#' ## Challenge: Once you have tidied up the data, answer the following questions:
#' 
#' - How many men and women took part in the study?
#' - How many A, AB, and B types have been tested?
#' - As above, but disregarding the contaminated samples?
#' - How many Rhesus + and - have been tested?
#' - How many universal donors (O-) have been tested?
#' - What is the average weight of AB men?
#' - How many samples have been tested in the different hospitals?
#' 
#' ## R and RStudio
#' 
#' ## Challenge: create your project directory structure
#' 
#' Under the `Files` tab on the right of the screen, click on `New Folder` and
#' create a folder named `data` within your newly created working directory
#' (e.g., `~/bioc-intro/data`). (Alternatively, type `dir.create("data")` at
#' your R console.) Repeat these operations to create a `data_output/` and a
#' `fig_output` folders.
#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## ?barplot

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## args(lm)

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## ??kruskal

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
## iris is an example data frame that comes with R and head() is a
## function that returns the first part of the data frame
dput(head(iris))

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
sessionInfo()

#' 
## ----loadp, eval=FALSE, purl=TRUE---------------------------------------------
## library("ggplot2")

#' 
## ----craninstall, eval=FALSE, purl=TRUE---------------------------------------
## install.packages("dplyr")

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## install.packages("BiocManager")

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## BiocManager::install("SummarizedExperiment")
## BiocManager::install("DESeq2")

#' 
#' ## Introduction to R
#' 
## ---- purl=TRUE---------------------------------------------------------------
3 + 5
12 / 7

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_kg <- 55

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_kg <- 55    # doesn't print anything
(weight_kg <- 55)  # but putting parenthesis around the call prints the value of `weight_kg`
weight_kg          # and so does typing the name of the object

#' 
## ---- purl=TRUE---------------------------------------------------------------
2.2 * weight_kg

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_kg <- 57.5
2.2 * weight_kg

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_lb <- 2.2 * weight_kg

#' 
#' ## Challenge:
#' 
#' What do you think is the current content of the object `weight_lb`?
#' 126\.5 or 220?
#' 
#' ## Challenge
#' 
#' What are the values after each statement in the following?
#' 
## ---- purl=TRUE---------------------------------------------------------------
mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
round(3.14159)

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
args(round)

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## ?round

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
round(3.14159, digits = 2)

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
round(3.14159, 2)

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
round(digits = 2, x = 3.14159)

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_g <- c(50, 60, 65, 82)
weight_g

#' 
## ---- purl=TRUE---------------------------------------------------------------
molecules <- c("dna", "rna", "protein")
molecules

#' 
## ---- purl=TRUE---------------------------------------------------------------
length(weight_g)
length(molecules)

#' 
## ---- purl=TRUE---------------------------------------------------------------
class(weight_g)
class(molecules)

#' 
## ---- purl=TRUE---------------------------------------------------------------
str(weight_g)
str(molecules)

#' 
#' ## Challenge:
#' 
#' We've seen that atomic vectors can be of type character, numeric (or
#' double), integer, and logical. But what happens if we try to mix
#' these types in a single vector?
#' 
#' ## Challenge:
#' 
#' What will happen in each of these examples? (hint: use `class()` to
#' check the data type of your objects and type in their names to see what happens):
#' 
## ---- eval=TRUE---------------------------------------------------------------
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE, FALSE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

#' 
#' ## Challenge:
#' 
#' Why do you think it happens?
#' 
#' ## Challenge:
#' 
#' How many values in `combined_logical` are `"TRUE"` (as a character)
#' in the following example:
#' 
## ---- eval=TRUE---------------------------------------------------------------
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

#' 
#' ## Challenge:
#' 
#' In R, we call converting objects from one class into another class
#' *coercion*. These conversions happen according to a hierarchy,
#' whereby some types get preferentially coerced into other types. Can
#' you draw a diagram that represents the hierarchy of how these data
#' types are coerced?
#' 
## ---- echo=FALSE, eval=FALSE, purl=TRUE---------------------------------------
## ## We've seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
## num_char <- c(1, 2, 3, "a")
## 
## num_logical <- c(1, 2, 3, TRUE)
## 
## char_logical <- c("a", "b", "c", TRUE)
## 
## tricky <- c(1, 2, 3, "4")
## 
## ## Why do you think it happens?
## 
## ## You've probably noticed that objects of different types get
## ## converted into a single, shared type within a vector. In R, we call
## ## converting objects from one class into another class
## ## _coercion_. These conversions happen according to a hierarchy,
## ## whereby some types get preferentially coerced into other types. Can
## ## you draw a diagram that represents the hierarchy of how these data
## ## types are coerced?

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
molecules <- c("dna", "rna", "peptide", "protein")
molecules[2]
molecules[c(3, 2)]

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
more_molecules <- molecules[c(1, 2, 3, 2, 1, 4)]
more_molecules

#' 
## ---- purl=TRUE---------------------------------------------------------------
weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

#' 
## ---- purl=TRUE---------------------------------------------------------------
## will return logicals with TRUE for the indices that meet
## the condition
weight_g > 50
## so we can use this to select only the values above 50
weight_g[weight_g > 50]

#' 
## ---- results="show", purl=TRUE-----------------------------------------------
weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g >= 30 & weight_g == 21]

#' 
## ---- purl=TRUE---------------------------------------------------------------
molecules <- c("dna", "rna", "protein", "peptide")
molecules[molecules == "rna" | molecules == "dna"] # returns both rna and dna
molecules %in% c("rna", "dna", "metabolite", "peptide", "glycerol")
molecules[molecules %in% c("rna", "dna", "metabolite", "peptide", "glycerol")]

#' 
#' ## Challenge:
#' 
#' Can you figure out why `"four" > "five"` returns `TRUE`?
#' 
#' ## Challenge:
#' 
#' 1. Using this vector of heights in inches, create a new vector with the NAs removed.
#' 
## -----------------------------------------------------------------------------
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

#' 
#' 2. Use the function `median()` to calculate the median of the `heights` vector.
#' 3. Use R to figure out how many people in the set are taller than 67 inches.
#' 
## ---- purl=TRUE---------------------------------------------------------------
numeric(3)
numeric(10)

#' 
## ---- purl=TRUE---------------------------------------------------------------
numeric(0)

#' 
#' ## Challenge:
#' 
#' What are the defaults for character and logical vectors?
#' 
## ---- purl=TRUE---------------------------------------------------------------
rep(-1, 5)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rep(NA, 5)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rep(c(1, 2, 3), 5)

#' 
#' ## Challenge:
#' 
#' What if we wanted to repeat the values 1, 2 and 3 five times, but
#' obtain five 1s, five 2s and five 3s in that order? There are two
#' possibilities - see `?rep` or `?sort` for help.
#' 
## ---- purl=TRUE---------------------------------------------------------------
seq(from = 1, to = 20, by = 2)

#' 
## ---- purl=TRUE---------------------------------------------------------------
seq(1, 5, 1)
seq(1, 5) ## default by
1:5

#' 
## ---- purl=TRUE---------------------------------------------------------------
seq(from = 1, to = 20, length.out = 3)

#' 
## ---- purl=TRUE---------------------------------------------------------------
sample(1:10)

#' 
## ---- purl=TRUE---------------------------------------------------------------
sample(letters, 5)

#' 
## ---- purl=TRUE---------------------------------------------------------------
sample(1:5, 10, replace = TRUE)

#' 
#' ## Challenge:
#' 
#' When trying the functions above out, you will have realised that the
#' samples are indeed random and that one doesn't get the same
#' permutation twice. To be able to reproduce these random draws, one can
#' set the random number generation seed manually with `set.seed()`
#' before drawing the random sample.
#' 
#' Test this feature with your neighbour. First draw two random
#' permutations of `1:10` independently and observe that you get
#' different results.
#' 
#' Now set the seed with, for example, `set.seed(123)` and repeat the
#' random draw. Observe that you now get the same random draws.
#' 
#' Repeat by setting a different seed.
#' 
## ---- purl=TRUE---------------------------------------------------------------
rnorm(5)
rnorm(5, 2, 2)
rnorm(5, 100, 5)

#' 
#' ## Starting with data
#' 
## ---- eval=TRUE, purl=TRUE----------------------------------------------------
rna <- read.csv("data/rnaseq.csv")

#' 
## ---- purl=TRUE---------------------------------------------------------------
head(rna)
## Try also
## View(rna)

#' 
## ---- eval=TRUE, purl=TRUE----------------------------------------------------
rna <- read.table(file = "data/rnaseq.csv",
                  sep = ",",
                  header = TRUE)

#' 
#' ## Challenge:
#' 
#' Based on the output of `str(rna)`, can you answer the following
#' questions?
#' 
#' - What is the class of the object `rna`?
#' - How many rows and how many columns are in this object?
#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## # first element in the first column of the data frame (as a vector)
## rna[1, 1]
## # first element in the 6th column (as a vector)
## rna[1, 6]
## # first column of the data frame (as a vector)
## rna[, 1]
## # first column of the data frame (as a data.frame)
## rna[1]
## # first three elements in the 7th column (as a vector)
## rna[1:3, 7]
## # the 3rd row of the data frame (as a data.frame)
## rna[3, ]
## # equivalent to head_rna <- head(rna)
## head_rna <- rna[1:6, ]
## head_rna

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## rna[, -1]          ## The whole data frame, except the first column
## rna[-c(7:66465), ] ## Equivalent to head(rna)

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## rna["gene"]       # Result is a data.frame
## rna[, "gene"]     # Result is a vector
## rna[["gene"]]     # Result is a vector
## rna$gene          # Result is a vector

#' 
#' ## Challenge
#' 
#' 1. Create a `data.frame` (`rna_200`) containing only the data in
#'   row 200 of the `rna` dataset.
#' 
#' 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
#' 
#' - Use that number to pull out just that last row in the initial
#'   `rna` data frame.
#' 
#' - Compare that with what you see as the last row using `tail()` to
#'   make sure it's meeting expectations.
#' 
#' - Pull out that last row using `nrow()` instead of the row number.
#' 
#' - Create a new data frame (`rna_last`) from that last row.
#' 
#' 3. Use `nrow()` to extract the row that is in the middle of the
#'   `rna` dataframe. Store the content of this row in an object
#'   named `rna_middle`.
#' 
#' 4. Combine `nrow()` with the `-` notation above to reproduce the
#'   behavior of `head(rna)`, keeping just the first through 6th
#'   rows of the rna dataset.
#' 
## ---- purl=TRUE---------------------------------------------------------------
sex <- factor(c("male", "female", "female", "male", "female"))

#' 
## ---- purl=TRUE---------------------------------------------------------------
levels(sex)
nlevels(sex)

#' 
## ---- purl=TRUE---------------------------------------------------------------
sex ## current order
sex <- factor(sex, levels = c("male", "female"))
sex ## after re-ordering

#' 
## ----firstfactorplot, fig.cap="Bar plot of the number of females and males.", purl=TRUE----
plot(sex)

#' 
## ---- purl=TRUE---------------------------------------------------------------
as.character(sex)

#' 
## ---- purl=TRUE---------------------------------------------------------------
levels(sex)
levels(sex) <- c("M", "F")
sex
plot(sex)

#' 
#' ## Challenge:
#' 
#' - Rename "F" and "M" to "Female" and "Male" respectively.
#' 
#' ## Challenge:
#' 
#' We have seen how data frames are created when using `read.csv()`, but
#' they can also be created by hand with the `data.frame()` function.
#' There are a few mistakes in this hand-crafted `data.frame`. Can you
#' spot and fix them?  Don't hesitate to experiment!
#' 
## ---- eval=FALSE--------------------------------------------------------------
## animal_data <- data.frame(
##        animal = c(dog, cat, sea cucumber, sea urchin),
##        feel = c("furry", "squishy", "spiny"),
##        weight = c(45, 8 1.1, 0.8))

#' 
#' ## Challenge:
#' 
#' Can you predict the class for each of the columns in the following
#' example?
#' 
#' Check your guesses using `str(country_climate)`:
#' 
#' - Are they what you expected?  Why? Why not?
#' 
#' - Try again by adding `stringsAsFactors = TRUE` after the last
#'   variable when creating the data frame. What is happening now?
#'   `stringsAsFactors` can also be set when reading text-based
#'   spreadsheets into R using `read.csv()`.
#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## country_climate <- data.frame(
##        country = c("Canada", "Panama", "South Africa", "Australia"),
##        climate = c("cold", "hot", "temperate", "hot/temperate"),
##        temperature = c(10, 30, 18, "15"),
##        northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
##        has_kangaroo = c(FALSE, FALSE, FALSE, 1)
##        )

#' 
## ----mat1, purl=TRUE----------------------------------------------------------
m <- matrix(1:9, ncol = 3, nrow = 3)
m

#' 
#' ## Challenge:
#' 
#' Using the function `installed.packages()`, create a `character` matrix
#' containing the information about all packages currently installed on
#' your computer. Explore it.
#' 
#' ## Challenge:
#' 
#' Construct a matrix of dimension 1000 by 3 of normally distributed data
#' (mean 0, standard deviation 1)
#' 
## ----loadlibridate, message=FALSE, purl=TRUE----------------------------------
library("lubridate")

#' 
## ---- purl=TRUE---------------------------------------------------------------
my_date <- ymd("2015-01-01")
str(my_date)

#' 
## ---- purl=TRUE---------------------------------------------------------------
# sep indicates the character to use to separate each component
my_date <- ymd(paste("2015", "1", "1", sep = "-"))
str(my_date)

#' 
## ---- purl=TRUE---------------------------------------------------------------
x <- data.frame(year = c(1996, 1992, 1987, 1986, 2000, 1990, 2002, 1994, 1997, 1985),
                month = c(2,  3,  3, 10,  1,  8,  3,  4,  5,  5),
                day = c(24,  8,  1,  5,  8, 17, 13, 10, 11, 24),
                value = c(4,  5,  1,  9,  3,  8, 10,  2,  6,  7))
x

#' 
## ---- purl=TRUE---------------------------------------------------------------
paste(x$year, x$month, x$day, sep = "-")

#' 
## ---- purl=TRUE---------------------------------------------------------------
ymd(paste(x$year, x$month, x$day, sep = "-"))

#' 
## ---- purl=TRUE---------------------------------------------------------------
x$date <- ymd(paste(x$year, x$month, x$day, sep = "-"))
str(x) # notice the new column, with 'date' as the class

#' 
## ---- purl=TRUE---------------------------------------------------------------
summary(x$date)

#' 
## ---- purl=TRUE---------------------------------------------------------------
dmy(paste(x$day, x$month, x$year, sep = "-"))

#' 
## ----list0, purl=TRUE---------------------------------------------------------
l <- list(1:10, ## numeric
          letters, ## character
          installed.packages(), ## a matrix
          cars, ## a data.frame
          list(1, 2, 3)) ## a list
length(l)
str(l)

#' 
## ---- purl=TRUE---------------------------------------------------------------
l[[1]] ## first element
l[1:2] ## a list of length 2
l[1]   ## a list of length 1

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## write.csv(rna, file = "data_output/my_rna.csv")

#' 
#' ## Manipulating and analysing data with dplyr
#' 
## ---- message=FALSE, purl=TRUE------------------------------------------------
## load the tidyverse packages, incl. dplyr
library("tidyverse")

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## BiocManager::install("tidyverse")

#' 
## ---- message=FALSE, purl=TRUE------------------------------------------------
rna <- read_csv("data/rnaseq.csv")

## view the data
rna

#' 
## ---- purl=TRUE---------------------------------------------------------------
select(rna, gene, sample, tissue, expression)

#' 
## ---- purl=TRUE---------------------------------------------------------------
select(rna, -tissue, -organism)

#' 
## ---- purl=TRUE---------------------------------------------------------------
filter(rna, sex == "Male")
filter(rna, sex == "Male" & infection == "NonInfected")

#' 
## ---- purl=TRUE---------------------------------------------------------------
filter(genes, is.na(hsapiens_homolog_associated_gene_name))

#' 
## ---- purl=TRUE---------------------------------------------------------------
filter(genes, !is.na(hsapiens_homolog_associated_gene_name))

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna2 <- filter(rna, sex == "Male")
rna3 <- select(rna2, gene, sample, tissue, expression)
rna3

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna3 <- select(filter(rna, sex == "Male"), gene, sample, tissue, expression)
rna3

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  filter(sex == "Male") %>%
  select(gene, sample, tissue, expression)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna3 <- rna %>%
  filter(sex == "Male") %>%
  select(gene, sample, tissue, expression)

rna3

#' 
#' ## Challenge:
#' 
#' Using pipes, subset the `rna` data to keep observations in female mice at time 0,
#' where the gene has an expression higher than 50000, and retain only the columns
#' `gene`, `sample`, `time`, `expression` and `age`.
#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  mutate(time_hours = time * 24) %>%
  select(time, time_hours)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  mutate(time_hours = time * 24,
         time_mn = time_hours * 60) %>%
  select(time, time_hours, time_mn)

#' 
#' ## Challenge
#' 
#' Create a new data frame from the `rna` data that meets the following
#' criteria: contains only the `gene`, `chromosome_name`,
#' `phenotype_description`, `sample`, and `expression` columns. The expression
#' values should be log-transformed. This data frame must
#' only contain genes located on sex chromosomes, associated with a
#' phenotype\_description, and with a log expression higher than 5.
#' 
#' **Hint**: think about how the commands should be ordered to produce
#' this data frame!
#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  group_by(gene, infection, time) %>%
  summarise(mean_expression = mean(expression),
            median_expression = median(expression))

#' 
#' ## Challenge
#' 
#' Calculate the mean expression level of gene "Dok3" by timepoints.
#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
    count(infection)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
    group_by(infection) %>%
    summarise(n = n())

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
    count(infection, time)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  group_by(infection, time) %>%
  summarise(n = n())

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  count(infection, time) %>%
  arrange(time)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  count(infection, time) %>%
  arrange(n)

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna %>%
  count(infection, time) %>%
  arrange(desc(n))

#' 
#' ## Challenge
#' 
#' 1. How many genes were analysed in each sample?
#' 2. Use `group_by()` and `summarise()` to evaluate the sequencing depth (the sum of all counts) in each sample. Which sample has the highest sequencing depth?
#' 3. Pick one sample and evaluate the number of genes by biotype.
#' 4. Identify genes associated with the "abnormal DNA methylation" phenotype description, and calculate their mean expression (in log) at time 0, time 4 and time 8.
#' 
## ---- purl=TRUE---------------------------------------------------------------
rna_exp <- rna %>%
  select(gene, sample, expression)
rna_exp

#' 
## ---- purl=TRUE, echo=FALSE---------------------------------------------------
rna_with_missing_values <- rna %>%
  select(gene, sample, expression) %>%
  filter(gene %in% c("Asl", "Apod", "Cyp2d22")) %>%
  filter(sample %in% c("GSM2545336", "GSM2545337", "GSM2545338")) %>%
  arrange(sample) %>%
  filter(!(gene == "Cyp2d22" & sample != "GSM2545338"))

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna_with_missing_values

#' 
## ---- purl=TRUE---------------------------------------------------------------
rna_with_missing_values %>%
  pivot_wider(names_from = sample,
              values_from = expression)

rna_with_missing_values %>%
  pivot_wider(names_from = sample,
              values_from = expression,
              values_fill = 0)

#' 
#' ## Question
#' 
#' Starting from the rna table, use the `pivot_wider()` function to create
#' a wide-format table giving the gene expression levels in each mouse.
#' Then use the `pivot_longer()` function to restore a long-format table.
#' 
#' ## Question
#' 
#' Subset genes located on X and Y chromosomes from the `rna` data frame and
#' spread the data frame with `sex` as columns, `chromosome_name` as
#' rows, and the mean expression of genes located in each chromosome as the values,
#' as in the following tibble:
#' 
## ---- echo=FALSE, message=FALSE-----------------------------------------------
knitr::include_graphics("fig/Exercise_pivot_W.png")

#' 
#' You will need to summarise before reshaping!
#' 
#' ## Question
#' 
#' Use the `rna` dataset to create an expression matrix where each row
#' represents the mean expression levels of genes and columns represent
#' the different timepoints.
#' 
#' ## Question
#' 
#' Use the previous data frame containing mean expression levels per timepoint and create
#' a new column containing fold-changes between timepoint 8 and timepoint 0, and fold-changes
#' between timepoint 8 and timepoint 4.
#' Convert this table into a long-format table gathering the fold-changes calculated.
#' 
#' ## Challenge:
#' 
#' Download the `annot3` table by clicking
#' [here](https://carpentries-incubator.github.io/bioc-intro/data/annot3.csv)
#' and put the table in your data/ repository.  Using the `full_join()`
#' function, join tables `rna_mini` and `annot3`. What has happened for
#' genes *Klk6*, *mt-Tf*, *mt-Rnr1*, *mt-Tv*, *mt-Rnr2*, and *mt-Tl1* ?
#' 
## ---- purl=TRUE, eval=FALSE---------------------------------------------------
## write_csv(rna_wide, file = "data_output/rna_wide.csv")

#' 
#' ## Data visualization
#' 
## ----load-package, message=FALSE, purl=TRUE-----------------------------------
library("tidyverse")

#' 
## ----load-data, eval=FALSE, purl=TRUE-----------------------------------------
## rna <- read.csv("data/rnaseq.csv")

#' 
## ----first-ggplot, cache=FALSE, purl=TRUE-------------------------------------
ggplot(data = rna, mapping = aes(x = expression)) +
  geom_histogram()

#' 
## ---- eval=FALSE, purl=TRUE---------------------------------------------------
## # Assign plot to a variable
## rna_plot <- ggplot(data = rna,
##                    mapping = aes(x = expression))
## 
## # Draw the plot
## rna_plot + geom_histogram()

#' 
#' ## Challenge
#' 
#' You have probably noticed an automatic message that appears when
#' drawing the histogram:
#' 
## ---- echo=FALSE, fig.show="hide"---------------------------------------------
ggplot(rna, aes(x = expression)) +
  geom_histogram()

#' 
#' Change the arguments `bins` or `binwidth` of `geom_histogram()` to
#' change the number or width of the bins.
#' 
## ----log-transfo, cache=FALSE, purl=TRUE--------------------------------------
rna <- rna %>%
  mutate(expression_log = log2(expression + 1))

#' 
## ----second-ggplot, cache=FALSE, purl=TRUE------------------------------------
ggplot(rna, aes(x = expression_log)) + geom_histogram()

#' 
#' ## Challenge
#' 
#' Another way to visualize this transformation is to consider the scale
#' of the observations. For example, it may be worth changing the scale
#' of the axis to better distribute the observations in the space of the
#' plot. Changing the scale of the axes is done similarly to
#' adding/modifying other components (i.e., by incrementally adding
#' commands). Try making this modification:
#' 
#' - Represent the un-transformed expression on the log10 scale; see
#'   `scale_x_log10()`. Compare it with the previous graph. Why do you
#'   now have warning messages appearing?
#' 
## ----rna_fc, cache=FALSE, purl=TRUE-------------------------------------------
rna_fc <- rna %>% select(gene, time,
                         gene_biotype, expression_log) %>%
  group_by(gene, time, gene_biotype) %>%
  summarize(mean_exp = mean(expression_log)) %>%
  pivot_wider(names_from = time,
              values_from = mean_exp) %>%
  mutate(time_8_vs_0 = `8` - `0`, time_4_vs_0 = `4` - `0`)


#' 
## ----create-ggplot-object, cache=FALSE, purl=TRUE-----------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0)) +
  geom_point()

#' 
## ----adding-transparency, cache=FALSE, purl=TRUE------------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0)) +
  geom_point(alpha = 0.3)

#' 
## ----adding-colors, cache=FALSE, purl=TRUE------------------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0)) +
  geom_point(alpha = 0.3, color = "blue")

#' 
## ----color-by-gene_biotype1, cache=FALSE, purl=TRUE---------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0)) +
  geom_point(alpha = 0.3, aes(color = gene_biotype))


#' 
## ----color-by-gene_biotype2, cache=FALSE, purl=TRUE---------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0,
                                color = gene_biotype)) +
  geom_point(alpha = 0.3)

#' 
## ----adding-diag, cache=FALSE, purl=TRUE--------------------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0,
                                color = gene_biotype)) +
  geom_point(alpha = 0.3) +
  geom_abline(intercept = 0)

#' 
## ----color-by-gene_biotype3, cache=FALSE, purl=TRUE---------------------------
ggplot(data = rna_fc, mapping = aes(x = time_4_vs_0, y = time_8_vs_0,
                                color = gene_biotype)) +
  geom_jitter(alpha = 0.3) +
  geom_abline(intercept = 0)

#' 
#' ## Challenge
#' 
#' Scatter plots can be useful exploratory tools for small datasets. For
#' data sets with large numbers of observations, such as the `rna_fc`
#' data set, overplotting of points can be a limitation of scatter plots.
#' One strategy for handling such settings is to use hexagonal binning of
#' observations. The plot space is tessellated into hexagons. Each
#' hexagon is assigned a color based on the number of observations that
#' fall within its boundaries.
#' 
#' - To use hexagonal binning in `ggplot2`, first install the R package
#'   `hexbin` from CRAN and load it.
#' 
#' - Then use the `geom_hex()` function to produce the hexbin figure.
#' 
#' - What are the relative strengths and weaknesses of a hexagonal bin
#'   plot compared to a scatter plot? Examine the above scatter plot
#'   and compare it with the hexagonal bin plot that you created.
#' 
#' ## Challenge
#' 
#' Use what you just learned to create a scatter plot of `expression_log`
#' over `sample` from the `rna` dataset with the time showing in
#' different colors. Is this a good way to show this type of data?
#' 
## ----boxplot, cache=FALSE, purl=TRUE------------------------------------------
ggplot(data = rna,
         mapping = aes(y = expression_log, x = sample)) +
  geom_boxplot()

#' 
## ----boxplot-with-points, cache=FALSE, purl=TRUE------------------------------
ggplot(data = rna,
         mapping = aes(y = expression_log, x = sample)) +
  geom_jitter(alpha = 0.2, color = "tomato") +
  geom_boxplot(alpha = 0)

#' 
#' ## Challenge
#' 
#' Note how the boxplot layer is in front of the jitter layer? What do
#' you need to change in the code to put the boxplot below the points?
#' 
## ----boxplot-xaxis-rotated, cache=FALSE, purl=TRUE----------------------------
ggplot(data = rna,
         mapping = aes(y = expression_log, x = sample)) +
  geom_jitter(alpha = 0.2, color = "tomato") +
  geom_boxplot(alpha = 0) +
  theme(axis.text.x = element_text(angle = 90,  hjust = 0.5, vjust = 0.5))

#' 
#' ## Challenge
#' 
#' Add color to the data points on your boxplot according to the duration
#' of the infection (`time`).
#' 
#' *Hint:* Check the class for `time`. Consider changing the class of
#' `time` from integer to factor directly in the ggplot mapping. Why does
#' this change how R makes the graph?
#' 
#' ## Challenge
#' 
#' Boxplots are useful summaries, but hide the *shape* of the
#' distribution. For example, if the distribution is bimodal, we would
#' not see it in a boxplot. An alternative to the boxplot is the violin
#' plot, where the shape (of the density of points) is drawn.
#' 
#' - Replace the box plot with a violin plot; see `geom_violin()`. Fill
#'   in the violins according to the time with the argument `fill`.
#' 
#' ## Challenge
#' 
#' - Modify the violin plot to fill in the violins by `sex`.
#' 
## ---- purl=TRUE---------------------------------------------------------------
rna_fc <- rna_fc %>% arrange(desc(time_8_vs_0))

genes_selected <- rna_fc$gene[1:10]

sub_rna <- rna %>%
    filter(gene %in% genes_selected)

mean_exp_by_time <- sub_rna %>%
  group_by(gene,time) %>%
    summarize(mean_exp = mean(expression_log))

mean_exp_by_time

#' 
## ----first-time-series, purl=TRUE---------------------------------------------
ggplot(data = mean_exp_by_time, mapping = aes(x = time, y = mean_exp)) +
  geom_line()

#' 
## ----time-series-by-gene, purl=TRUE-------------------------------------------
ggplot(data = mean_exp_by_time,
       mapping = aes(x = time, y = mean_exp, group = gene)) +
  geom_line()

#' 
## ----time-series-with-colors, purl=TRUE---------------------------------------
ggplot(data = mean_exp_by_time,
       mapping = aes(x = time, y = mean_exp, color = gene)) +
  geom_line()

#' 
## ----first-facet, purl=TRUE---------------------------------------------------
ggplot(data = mean_exp_by_time,
       mapping = aes(x = time, y = mean_exp)) + geom_line() +
  facet_wrap(~ gene)

#' 
## ----first-facet-scales, purl=TRUE--------------------------------------------
ggplot(data = mean_exp_by_time,
       mapping = aes(x = time, y = mean_exp)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y")

#' 
## ----data-facet-by-gene-and-sex, purl=TRUE------------------------------------
mean_exp_by_time_sex <- sub_rna %>%
  group_by(gene, time, sex) %>%
    summarize(mean_exp = mean(expression_log))

mean_exp_by_time_sex

#' 
## ----facet-by-gene-and-sex, cache=FALSE, purl=TRUE----------------------------
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = sex)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y")

#' 
## ----facet-by-gene-and-sex-white-bg, cache=FALSE, purl=TRUE-------------------
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = sex)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y") +
  theme_bw() +
  theme(panel.grid = element_blank())

#' 
#' ## Challenge
#' 
#' Use what you just learned to create a plot that depicts how the
#' average expression of each chromosome changes through the duration of
#' infection.
#' 
## ----mean-exp-time-facet-sex-rows, purl=TRUE----------------------------------
# One column, facet by rows
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = gene)) +
  geom_line() +
  facet_grid(sex ~ .)

#' 
## ----mean-exp-time-facet-sex-columns, purl=TRUE-------------------------------
# One row, facet by column
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = gene)) +
  geom_line() +
  facet_grid(. ~ sex)

#' 
## ----mean_exp-time-with-right-labels, cache=FALSE, purl=TRUE------------------
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = sex)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(title = "Mean gene expression by duration of the infection",
       x = "Duration of the infection (in days)",
       y = "Mean gene expression")

#' 
## ----mean_exp-time-with-right-labels-xfont-size, cache=FALSE, purl=TRUE-------
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = sex)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(title = "Mean gene expression by duration of the infection",
       x = "Duration of the infection (in days)",
       y = "Mean gene expression")  +
  theme(text = element_text(size = 16))

#' 
## ----mean_exp-time-with-theme, cache=FALSE, purl=TRUE-------------------------
ggplot(data = mean_exp_by_time_sex,
       mapping = aes(x = time, y = mean_exp, color = sex)) +
  geom_line() +
  facet_wrap(~ gene, scales = "free_y") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(title = "Mean gene expression by duration of the infection",
       x = "Duration of the infection (in days)",
       y = "Mean gene expression")  +
  theme(text = element_text(size = 16),
        axis.text.x = element_text(colour = "royalblue4", size = 12),
        axis.text.y = element_text(colour = "royalblue4", size = 12),
        panel.grid = element_line(colour="lightsteelblue1"),
        legend.position = "top")

#' 
## ----mean_exp-time-with-right-labels-xfont, cache=FALSE, purl=TRUE------------
blue_theme <- theme(axis.text.x = element_text(colour = "royalblue4",
                                               size = 12),
                    axis.text.y = element_text(colour = "royalblue4",
                                               size = 12),
                    text = element_text(size = 16),
                    panel.grid = element_line(colour="lightsteelblue1"))

ggplot(rna, aes(x = expression_log)) +
  geom_histogram(bins = 20) +
    blue_theme

#' 
#' ## Challenge
#' 
#' With all of this information in hand, please take another five minutes
#' to either improve one of the plots generated in this exercise or
#' create a beautiful graph of your own. Use the RStudio [`ggplot2` cheat
#' sheet](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf)
#' for inspiration. Here are some ideas:
#' 
#' - See if you can change the thickness of the lines.
#' - Can you find a way to change the name of the legend? What about
#'   its labels? (hint: look for a ggplot function starting with
#'   `scale_`)
#' - Try using a different color palette or manually specifying the
#'   colors for the lines (see
#'   [http://www.cookbook-r.com/Graphs/Colors\_(ggplot2)/](https://www.cookbook-r.com/Graphs/Colors_\(ggplot2\)/)).
#' 
## ----sub1, purl=TRUE----------------------------------------------------------
rna$chromosome_name <- factor(rna$chromosome_name,
                               levels = c(1:19,"X","Y"))

count_gene_chromosome <- rna %>% select(chromosome_name, gene) %>%
  distinct() %>% ggplot() +
  geom_bar(aes(x = chromosome_name), fill = "seagreen",
           position = "dodge", stat = "count") +
  labs(y = "log10(n genes)", x = "chromosome") +
  scale_y_log10()

count_gene_chromosome

#' 
## ----sub2, purl=TRUE----------------------------------------------------------
exp_boxplot_sex <- ggplot(rna, aes(y=expression_log, x = as.factor(time),
                 color=sex)) +
   geom_boxplot(alpha = 0) +
  labs(y = "Mean gene exp",
       x = "time") + theme(legend.position = "none")

exp_boxplot_sex

#' 
## ----install-patchwork, message=FALSE, eval=FALSE, purl=TRUE------------------
## install.packages("patchwork")

#' 
## ----patchworkplot1, purl=TRUE------------------------------------------------
library("patchwork")
count_gene_chromosome + exp_boxplot_sex
## or count_gene_chromosome | exp_boxplot_sex

#' 
## ----patchwork2, purl=TRUE----------------------------------------------------
count_gene_chromosome / exp_boxplot_sex

#' 
## ----patchwork3, purl=TRUE----------------------------------------------------
count_gene_chromosome + exp_boxplot_sex + plot_layout(ncol = 1)

#' 
## ----patchwork4, purl=TRUE----------------------------------------------------
count_gene_chromosome +
 (count_gene_chromosome + exp_boxplot_sex) +
 exp_boxplot_sex +
 plot_layout(ncol = 1)

#' 
## ----patchwork5, purl=TRUE----------------------------------------------------
count_gene_chromosome /
 (count_gene_chromosome | exp_boxplot_sex) /
 exp_boxplot_sex

#' 
## ----install-gridextra, message=FALSE, eval=FALSE, purl=TRUE------------------
## install.packages("gridExtra")

#' 
## ----gridarrange-example, message=FALSE, fig.width=10, purl=TRUE--------------
library("gridExtra")
grid.arrange(count_gene_chromosome, exp_boxplot_sex, ncol = 2)

#' 
## ----ggsave-example, eval=FALSE, purl=TRUE------------------------------------
## my_plot <- ggplot(data = mean_exp_by_time_sex,
##        mapping = aes(x = time, y = mean_exp, color = sex)) +
##   geom_line() +
##   facet_wrap(~ gene, scales = "free_y") +
##   labs(title = "Mean gene expression by duration of the infection",
##          x = "Duration of the infection (in days)",
##          y = "Mean gene expression") +
##   guides(color=guide_legend(title="Gender")) +
##   theme_bw() +
##   theme(axis.text.x = element_text(colour = "royalblue4", size = 12),
##         axis.text.y = element_text(colour = "royalblue4", size = 12),
##         text = element_text(size = 16),
##         panel.grid = element_line(colour="lightsteelblue1"),
##         legend.position = "top")
## ggsave("fig_output/mean_exp_by_time_sex.png", my_plot, width = 15,
##        height = 10)
## 
## # This also works for grid.arrange() plots
## combo_plot <- grid.arrange(count_gene_chromosome, exp_boxplot_sex,
##                            ncol = 2, widths = c(4, 6))
## ggsave("fig_output/combo_plot_chromosome_sex.png", combo_plot,
##        width = 10, dpi = 300)

#' 
## ----final-challenge, eval=FALSE, purl=TRUE, echo=FALSE-----------------------
## ### Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf

#' 
#' ## Next steps
#' 
#' ## Challenge
#' 
#' Extract the gene expression levels of the 3 first genes in samples
#' at time 0 and at time 8.
#' 
#' ## Challenge
#' 
#' Verify that you get the same values using the long `rna` table.
#' 
