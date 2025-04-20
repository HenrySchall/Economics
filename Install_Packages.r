########################
### Install Packages ###
########################

packages <- c("magrittr","httpgd","mFilter","BCDating","rio","timetk","pdftools","textdata","tm",
"tidytext","dplyr","tidyverse","tidyr","ggplot2","readr","readxl","forecast","zoo","lubridate",
"ipeadatar","sidrar","GetBCBData","PNADcIBGE","survey","dygraphs","tseries","quantmod",
"Quandl","discreteRV","aTSA","fGarch","fUnitRoots","vars","MTS","seasonal","stats","nortest",
"scales","urca","dlm","seasonalview","stringr","fma","languageserver","PerformanceAnalytics",
"getSymbols","jsonlite","purrr","curl)")

packages_install <- packages [!packages %in% installed.packages()[,"Package"]]
if(length(packages_install) > 0)
{install.packages(packages_install)} else {message("Todos os pacotes já estão instalados.")}