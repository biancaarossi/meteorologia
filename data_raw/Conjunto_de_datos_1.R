estacion1_url <- 'https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv'
estacion1_archivo <- '../NH0910.csv'

estacion1 <- download.file(url=estacion1_url, destfile= estacion1_archivo)

usethis::use_data(estacion1, overwrite = TRUE)
