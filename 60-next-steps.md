---
source: Rmd
title: Next steps
teaching: 45
exercises: 45
---



::::::::::::::::::::::::::::::::::::::: objectives

- Introduce the Bioconductor project.
- Introduce the notion of data containers.
- Give an overview of the `SummarizedExperiment`, extensively used in
  omics analyses.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What is a `SummarizedExperiment`?
- What is Bioconductor?

::::::::::::::::::::::::::::::::::::::::::::::::::

## Next steps



Data in bioinformatics is often complex.  To deal with this,
developers define specialised data containers (termed classes) that
match the properties of the data they need to handle.

This aspect is central to the **Bioconductor**[^Bioconductor] project
which uses the same **core data infrastructure** across packages. This
certainly contributed to Bioconductor's success. Bioconductor package
developers are advised to make use of existing infrastructure to
provide coherence, interoperability, and stability to the project as a
whole.

[^Bioconductor]: The [Bioconductor](https://www.bioconductor.org) was
    initiated by Robert Gentleman, one of the two creators of the R
    language. Bioconductor provides tools dedicated to omics data
    analysis. Bioconductor uses the R statistical programming language
    and is open source and open development.

To illustrate such an omics data container, we'll present the
`SummarizedExperiment` class.

## SummarizedExperiment

The figure below represents the anatomy of the SummarizedExperiment class.

<img src="https://uclouvain-cbio.github.io/WSBIM1322/figs/SE.svg" alt="Schematic representation of the SummarizedExperiment class illustrating the following slots: fowData and rowRanges, one assay or multiple assays, colData and metadata." width="80%" style="display: block; margin: auto;" />

Objects of the class SummarizedExperiment contain :

- **One (or more) assay(s)** containing the quantitative omics data
  (expression data), stored as a matrix-like object. Features (genes,
  transcripts, proteins, ...) are defined along the rows, and samples
  along the columns.

- A **sample metadata** slot containing sample co-variates, stored as a
  data frame. Rows from this table represent samples (rows match exactly the
  columns of the expression data).

- A **feature metadata** slot containing feature co-variates, stored as
  a data frame. The rows of this data frame match exactly the rows of the
  expression data.

The coordinated nature of the `SummarizedExperiment` guarantees that
during data manipulation, the dimensions of the different slots will
always match (i.e the columns in the expression data and then rows in
the sample metadata, as well as the rows in the expression data and
feature metadata) during data manipulation. For example, if we had to
exclude one sample from the assay, it would be automatically removed
from the sample metadata in the same operation.

The metadata slots can grow additional co-variates
(columns) without affecting the other structures.

### Creating a SummarizedExperiment

In order to create a `SummarizedExperiment`, we will create the
individual components, i.e the count matrix, the sample and gene
metadata from csv files. These are typically how RNA-Seq data are
provided (after raw data have been processed).



- **An expression matrix**: we load the count matrix, specifying that
  the first columns contains row/gene names, and convert the
  `data.frame` to a `matrix`. You can download it [by clicking this
  link](https://carpentries-incubator.github.io/bioc-intro/data/count_matrix.csv).


``` r
count_matrix <- read.csv("data/count_matrix.csv",
                         row.names = 1) |>
    as.matrix()

count_matrix[1:5, ]
```

``` output
        GSM2545336 GSM2545337 GSM2545338 GSM2545339 GSM2545340 GSM2545341
Asl           1170        361        400        586        626        988
Apod         36194      10347       9173      10620      13021      29594
Cyp2d22       4060       1616       1603       1901       2171       3349
Klk6           287        629        641        578        448        195
Fcrls           85        233        244        237        180         38
        GSM2545342 GSM2545343 GSM2545344 GSM2545345 GSM2545346 GSM2545347
Asl            836        535        586        597        938       1035
Apod         24959      13668      13230      15868      27769      34301
Cyp2d22       3122       2008       2254       2277       2985       3452
Klk6           186       1101        537        567        327        233
Fcrls           68        375        199        177         89         67
        GSM2545348 GSM2545349 GSM2545350 GSM2545351 GSM2545352 GSM2545353
Asl            494        481        666        937        803        541
Apod         11258      11812      15816      29242      20415      13682
Cyp2d22       1883       2014       2417       3678       2920       2216
Klk6           742        881        828        250        798        710
Fcrls          300        233        231         81        303        285
        GSM2545354 GSM2545362 GSM2545363 GSM2545380
Asl            473        748        576       1192
Apod         11088      15916      11166      38148
Cyp2d22       1821       2842       2011       4019
Klk6           894        501        598        259
Fcrls          248        179        184         68
```

``` r
dim(count_matrix)
```

``` output
[1] 1474   22
```

- **A table describing the samples**, available [at this
  link](https://carpentries-incubator.github.io/bioc-intro/data/sample_metadata.csv).


``` r
sample_metadata <- read.csv("data/sample_metadata.csv")
sample_metadata
```

``` output
       sample     organism age    sex   infection  strain time     tissue mouse
1  GSM2545336 Mus musculus   8 Female  InfluenzaA C57BL/6    8 Cerebellum    14
2  GSM2545337 Mus musculus   8 Female NonInfected C57BL/6    0 Cerebellum     9
3  GSM2545338 Mus musculus   8 Female NonInfected C57BL/6    0 Cerebellum    10
4  GSM2545339 Mus musculus   8 Female  InfluenzaA C57BL/6    4 Cerebellum    15
5  GSM2545340 Mus musculus   8   Male  InfluenzaA C57BL/6    4 Cerebellum    18
6  GSM2545341 Mus musculus   8   Male  InfluenzaA C57BL/6    8 Cerebellum     6
7  GSM2545342 Mus musculus   8 Female  InfluenzaA C57BL/6    8 Cerebellum     5
8  GSM2545343 Mus musculus   8   Male NonInfected C57BL/6    0 Cerebellum    11
9  GSM2545344 Mus musculus   8 Female  InfluenzaA C57BL/6    4 Cerebellum    22
10 GSM2545345 Mus musculus   8   Male  InfluenzaA C57BL/6    4 Cerebellum    13
11 GSM2545346 Mus musculus   8   Male  InfluenzaA C57BL/6    8 Cerebellum    23
12 GSM2545347 Mus musculus   8   Male  InfluenzaA C57BL/6    8 Cerebellum    24
13 GSM2545348 Mus musculus   8 Female NonInfected C57BL/6    0 Cerebellum     8
14 GSM2545349 Mus musculus   8   Male NonInfected C57BL/6    0 Cerebellum     7
15 GSM2545350 Mus musculus   8   Male  InfluenzaA C57BL/6    4 Cerebellum     1
16 GSM2545351 Mus musculus   8 Female  InfluenzaA C57BL/6    8 Cerebellum    16
17 GSM2545352 Mus musculus   8 Female  InfluenzaA C57BL/6    4 Cerebellum    21
18 GSM2545353 Mus musculus   8 Female NonInfected C57BL/6    0 Cerebellum     4
19 GSM2545354 Mus musculus   8   Male NonInfected C57BL/6    0 Cerebellum     2
20 GSM2545362 Mus musculus   8 Female  InfluenzaA C57BL/6    4 Cerebellum    20
21 GSM2545363 Mus musculus   8   Male  InfluenzaA C57BL/6    4 Cerebellum    12
22 GSM2545380 Mus musculus   8 Female  InfluenzaA C57BL/6    8 Cerebellum    19
```

``` r
dim(sample_metadata)
```

``` output
[1] 22  9
```

- **A table describing the genes**, available [at this
  link](https://carpentries-incubator.github.io/bioc-intro/data/gene_metadata.csv).


``` r
gene_metadata <- read.csv("data/gene_metadata.csv")
gene_metadata[1:10, 1:4]
```

``` output
      gene ENTREZID
1      Asl   109900
2     Apod    11815
3  Cyp2d22    56448
4     Klk6    19144
5    Fcrls    80891
6   Slc2a4    20528
7     Exd2    97827
8     Gjc2   118454
9     Plp1    18823
10    Gnb4    14696
                                                                         product
1                                 argininosuccinate lyase, transcript variant X1
2                                         apolipoprotein D, transcript variant 3
3   cytochrome P450, family 2, subfamily d, polypeptide 22, transcript variant 2
4                           kallikrein related-peptidase 6, transcript variant 2
5                  Fc receptor-like S, scavenger receptor, transcript variant X1
6            solute carrier family 2 (facilitated glucose transporter), member 4
7                                          exonuclease 3'-5' domain containing 2
8                            gap junction protein, gamma 2, transcript variant 1
9                           proteolipid protein (myelin) 1, transcript variant 1
10 guanine nucleotide binding protein (G protein), beta 4, transcript variant X2
      ensembl_gene_id
1  ENSMUSG00000025533
2  ENSMUSG00000022548
3  ENSMUSG00000061740
4  ENSMUSG00000050063
5  ENSMUSG00000015852
6  ENSMUSG00000018566
7  ENSMUSG00000032705
8  ENSMUSG00000043448
9  ENSMUSG00000031425
10 ENSMUSG00000027669
```

``` r
dim(gene_metadata)
```

``` output
[1] 1474    9
```

We will create a `SummarizedExperiment` from these tables:

- The count matrix that will be used as the **`assay`**

- The table describing the samples will be used as the **sample
  metadata** slot

- The table describing the genes will be used as the **features
  metadata** slot

To do this we can put the different parts together using the
`SummarizedExperiment` constructor:


``` r
## BiocManager::install("SummarizedExperiment")
library("SummarizedExperiment")
```

``` error
Error in `library()`:
! there is no package called 'SummarizedExperiment'
```

First, we make sure that the samples are in the same order in the
count matrix and the sample annotation, and the same for the genes in
the count matrix and the gene annotation.


``` r
stopifnot(rownames(count_matrix) == gene_metadata$gene)
stopifnot(colnames(count_matrix) == sample_metadata$sample)
```


``` r
se <- SummarizedExperiment(assays = list(counts = count_matrix),
                           colData = sample_metadata,
                           rowData = gene_metadata)
```

``` error
Error in `SummarizedExperiment()`:
! could not find function "SummarizedExperiment"
```

``` r
se
```

``` error
Error:
! object 'se' not found
```

### Saving data

Exporting data to a spreadsheet, as we did in a previous episode, has
several limitations, such as those described in the first chapter
(possible inconsistencies with `,` and `.` for decimal separators and
lack of variable type definitions). Furthermore, exporting data to a
spreadsheet is only relevant for rectangular data such as dataframes
and matrices.

A more general way to save data, that is specific to R and is
guaranteed to work on any operating system, is to use the `saveRDS`
function. Saving objects like this will generate a binary
representation on disk (using the `rds` file extension here), which
can be loaded back into R using the `readRDS` function.


``` r
saveRDS(se, file = "data_output/se.rds")
rm(se)
se <- readRDS("data_output/se.rds")
head(se)
```

To conclude, when it comes to saving data from R that will be loaded
again in R, saving and loading with `saveRDS` and `readRDS` is the
preferred approach. If tabular data need to be shared with somebody
that is not using R, then exporting to a text-based spreadsheet is a
good alternative.

Using this data structure, we can access the expression matrix with
the `assay` function:


``` r
head(assay(se))
```

``` error
Error in `assay()`:
! could not find function "assay"
```

``` r
dim(assay(se))
```

``` error
Error in `assay()`:
! could not find function "assay"
```

We can access the sample metadata using the `colData` function:


``` r
colData(se)
```

``` error
Error in `colData()`:
! could not find function "colData"
```

``` r
dim(colData(se))
```

``` error
Error in `colData()`:
! could not find function "colData"
```

We can also access the feature metadata using the `rowData` function:


``` r
head(rowData(se))
```

``` error
Error in `rowData()`:
! could not find function "rowData"
```

``` r
dim(rowData(se))
```

``` error
Error in `rowData()`:
! could not find function "rowData"
```

### Subsetting a SummarizedExperiment

SummarizedExperiment can be subset just like with data frames, with
numerics or with characters of logicals.

Below, we create a new instance of class SummarizedExperiment that
contains only the 5 first features for the 3 first samples.


``` r
se1 <- se[1:5, 1:3]
```

``` error
Error:
! object 'se' not found
```

``` r
se1
```

``` error
Error:
! object 'se1' not found
```


``` r
colData(se1)
```

``` error
Error in `colData()`:
! could not find function "colData"
```

``` r
rowData(se1)
```

``` error
Error in `rowData()`:
! could not find function "rowData"
```

We can also use the `colData()` function to subset on something from
the sample metadata or the `rowData()` to subset on something from the
feature metadata.  For example, here we keep only miRNAs and the non
infected samples:


``` r
se1 <- se[rowData(se)$gene_biotype == "miRNA",
          colData(se)$infection == "NonInfected"]
```

``` error
Error:
! object 'se' not found
```

``` r
se1
```

``` error
Error:
! object 'se1' not found
```

``` r
assay(se1)
```

``` error
Error in `assay()`:
! could not find function "assay"
```

``` r
colData(se1)
```

``` error
Error in `colData()`:
! could not find function "colData"
```

``` r
rowData(se1)
```

``` error
Error in `rowData()`:
! could not find function "rowData"
```

<!--For the following exercise, you should download the SE.rda object
(that contains the `se` object), and open the file using the 'load()'
function.-->

<!-- ```{r, eval = FALSE, echo = FALSE} -->

<!-- download.file(url = "https://raw.githubusercontent.com/UCLouvain-CBIO/bioinfo-training-01-intro-r/master/data/SE.rda", -->

<!--               destfile = "data/SE.rda") -->

<!-- load("data/SE.rda") -->

<!-- ``` -->

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Extract the gene expression levels of the 3 first genes in samples
at time 0 and at time 8.

:::::::::::::::  solution

## Solution


``` r
assay(se)[1:3, colData(se)$time != 4]
```

``` error
Error in `assay()`:
! could not find function "assay"
```

``` r
# Equivalent to
assay(se)[1:3, colData(se)$time == 0 | colData(se)$time == 8]
```

``` error
Error in `assay()`:
! could not find function "assay"
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Verify that you get the same values using the long `rna` table.

:::::::::::::::  solution

## Solution


``` r
rna |>
    filter(gene %in% c("Asl", "Apod", "Cyd2d22")) |>
    filter(time != 4) |>
    select(expression)
```

``` output
# A tibble: 28 × 1
   expression
        <dbl>
 1       1170
 2      36194
 3        361
 4      10347
 5        400
 6       9173
 7        988
 8      29594
 9        836
10      24959
# ℹ 18 more rows
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

The long table and the `SummarizedExperiment` contain the same
information, but are simply structured differently. Each approach has its
own advantages: the former is a good fit for the `tidyverse` packages,
while the latter is the preferred structure for many bioinformatics and
statistical processing steps. For example, a typical RNA-Seq analyses using
the `DESeq2` package.

#### Adding variables to metadata

We can also add information to the metadata.
Suppose that you want to add the center where the samples were collected...


``` r
colData(se)$center <- rep("University of Illinois", nrow(colData(se)))
```

``` error
Error in `colData()`:
! could not find function "colData"
```

``` r
colData(se)
```

``` error
Error in `colData()`:
! could not find function "colData"
```

This illustrates that the metadata slots can grow indefinitely without
affecting the other structures!

### tidySummarizedExperiment

You may be wondering, can we use tidyverse commands to interact with
`SummarizedExperiment` objects? The answer is yes, we can with the
`tidySummarizedExperiment` package.

Remember what our SummarizedExperiment object looks like:


``` r
se
```

``` error
Error:
! object 'se' not found
```

Load `tidySummarizedExperiment` and then take a look at the se object
again.


``` r
## BiocManager::install("tidySummarizedExperiment")
library("tidySummarizedExperiment")
```

``` error
Error in `library()`:
! there is no package called 'tidySummarizedExperiment'
```

``` r
se
```

``` error
Error:
! object 'se' not found
```

It's still a `SummarizedExperiment` object, so maintains the efficient
structure, but now we can view it as a tibble. Note the first line of
the output says this, it's a `SummarizedExperiment`\-`tibble`
abstraction. We can also see in the second line of the output the
number of transcripts and samples.

We can now use tidyverse commands to interact with the
`SummarizedExperiment` object.

We can use `filter` to filter for rows using a condition e.g. to view
all rows for one sample.


``` r
se |> filter(sample == "GSM2545336")
```

``` error
Error:
! object 'se' not found
```

``` r
se |> filter(sex == "Female")
```

``` error
Error:
! object 'se' not found
```

We can use `select` to specify columns we want to view.


``` r
se |> select(sample, sex)
```

``` error
Error:
! object 'se' not found
```

We can use `mutate` to add metadata info.


``` r
se |> mutate(center = "Heidelberg University")
```

``` error
Error:
! object 'se' not found
```

We can also combine commands with the tidyverse pipe `|>`. For
example, we could combine `group_by` and `summarise` to get the total
counts for each sample.


``` r
se |>
    group_by(.sample) |>
    summarise(total_counts=sum(counts))
```

``` error
Error:
! object 'se' not found
```

We can treat the tidy SummarizedExperiment object as a normal tibble
for plotting.

Here we plot the distribution of counts per sample.


``` r
se |>
    ggplot(aes(counts + 1, group=.sample, color=infection)) +
    geom_density() +
    scale_x_log10() +
    theme_bw()
```

``` error
Error:
! object 'se' not found
```

For more information on `tidySummarizedExperiment`, see the [package
website](https://stemangiola.github.io/tidySummarizedExperiment/).

**Take-home message**

- `SummarizedExperiment` represents an efficient way to store and
  handle omics data.

- They are used in many Bioconductor packages.

If you follow the next training focused on RNA sequencing analysis,
you will learn to use the Bioconductor `DESeq2` package to do some
differential expression analyses.  The whole analysis of the `DESeq2`
package is handled in a `SummarizedExperiment`.

:::::::::::::::::::::::::::::::::::::::: keypoints

- Bioconductor is a project provide support and packages for the
  comprehension of high high-throughput biology data.
- A `SummarizedExperiment` is a type of object useful to store and
  manage high-throughput omics data.

::::::::::::::::::::::::::::::::::::::::::::::::::
