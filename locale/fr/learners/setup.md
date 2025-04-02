---
title: Setup
---

- Veuillez vous assurer d'avoir accès à un tableur, tel que LibreOffice, Microsoft Excel ou Google Sheets.

- Installez R, RStudio et les packages (voir ci-dessous).

### R et RStudio

- R et RStudio sont des programmes a télécharger separemment et demandent des installations distincts. R est l'environnement de calcul statistique sous-jacent, mais utiliser R seul peut être pénible. RStudio est un environnement de développement graphique intégré
  (IDE) qui rend l'utilisation de R beaucoup plus simple et plus interactive. Vous avez besoin d' installer R avant d'installer RStudio. Après avoir installé les deux programmes, vous devrez installer des paquets R spécifiques depuis
  RStudio. Suivez les instructions ci-dessous pour votre système d'exploitation,
  puis suivez les instructions pour installer des paquets.

### You are running Windows

<br>

:::::::::::::::  solution

## Si vous avez déjà installé R et RStudio

- Ouvrez RStudio et cliquez sur « Aide » > « Rechercher les mises à jour ». Si une nouvelle version est
  disponible, quittez RStudio et téléchargez la dernière version de RStudio.

- Pour vérifier quelle version de R vous utilisez, démarrez RStudio et la première chose
  qui apparaît dans la console indique la version de R que vous
  exécutez. Alternativement, vous pouvez taper `sessionInfo()`, qui affichera également
  quelle version de R est installée. Allez sur
  le [site Web du CRAN](https://cran.r-project.org/bin/windows/base/) et vérifiez
  si une version plus récente est disponible. Si c'est le cas, veuillez le télécharger et l'installer. Vous pouvez [consulter ici](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f) pour
  plus d'informations sur la façon de supprimer les anciennes versions de votre système si vous souhaitez le faire.

- Suivez les étapes décrites dans les instructions [pour tout le monde](#pour-tout-le-monde) en bas de cette page.

:::::::::::::::::::::::::

:::::::::::::::  solution

## If you don't have R and RStudio installed

- Download R from
  the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm).

- Run the `.exe` file that was just downloaded

- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)

- Under _All Installers_ select **RStudio xxxx.yy.zz-uuu.exe - Windows 10/11** (where x, y, z, and u represent version numbers)

- Double click the file to install it

- Once it's installed, open RStudio to make sure it works and you don't get any
  error messages

- Suivez les étapes décrites dans les instructions [pour tout le monde](#pour-tout-le-monde) en bas de cette page.

:::::::::::::::::::::::::

### You are running macOS

<br>

:::::::::::::::  solution

## Si vous avez déjà installé R et RStudio

- Ouvrez RStudio et cliquez sur « Aide » > « Rechercher les mises à jour ». Si une nouvelle version est
  disponible, quittez RStudio et téléchargez la dernière version de RStudio.

- To check the version of R you are using, start RStudio and the first thing
  that appears on the terminal indicates the version of R you are running. Alternatively, you can type `sessionInfo()`, which will
  also display which version of R you are running. Go on
  the [CRAN website](https://cran.r-project.org/bin/macosx/) and check
  whether a more recent version is available. Si c'est le cas, veuillez le télécharger et l'installer.

- Suivez les étapes décrites dans les instructions [pour tout le monde](#pour-tout-le-monde) en bas de cette page.

:::::::::::::::::::::::::

:::::::::::::::  solution

## If you don't have R and RStudio installed

- Download R from
  the [CRAN website](https://cran.r-project.org/bin/macosx/).

- Select the `.pkg` file for the latest R version

- Double click on the downloaded file to install R

- It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed
  by some packages)

- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)

- Under _All Installers_ select **RStudio xxxx.yy.zz-uuu.dmg - macOS 10.15+** (where x, y, z, and u represent version numbers)

- Double click the file to install RStudio

- Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

- Suivez les étapes décrites dans les instructions [pour tout le monde](#pour-tout-le-monde) en bas de cette page.

:::::::::::::::::::::::::

### You are running Linux

<br>

:::::::::::::::  solution

## Install R using your package manager and RStudio

- Follow the instructions for your distribution
  from [CRAN](https://cloud.r-project.org/bin/linux), they provide information
  to get the most recent version of R for common distributions. For most
  distributions, you could use your package manager (e.g., for Debian/Ubuntu run
  `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we
  don't recommend this approach as the versions provided by this are
  usually out of date. In any case, make sure you have at least R 4.2.0.
- Go to the RStudio download
  page
- Under _All Installers_ select the version that matches your distribution, and
  install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i rstudio-xxxx.yy.zz-uuu-amd64.deb` at the terminal).
- Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.
- Follow the steps in the [instructions for everyone](#for-everyone)

:::::::::::::::::::::::::

### For everyone

After installing R and RStudio, you need to install a couple of
packages that will be used during the workshop. We will also learn
about package installation during the course to explain the following
commands. For now, simply follow the instructions below:

- Start RStudio by double-clicking the icon and then type:

```r
install.packages(c("BiocManager", "remotes"))
BiocManager::install(c("tidyverse", "SummarizedExperiment", "hexbin",
                       "patchwork", "gridExtra", "lubridate"))
```
