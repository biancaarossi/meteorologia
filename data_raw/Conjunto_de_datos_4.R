estacion4_url <- 'https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv'
estacion4_archivo <- '../NH0098.csv'

estacion4 <- download.file(url=estacion4_url, destfile= estacion4_archivo)

usethis::use_data(estacion4, overwrite = TRUE)
