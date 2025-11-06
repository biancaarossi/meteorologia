estacion3_url <- 'https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv'
estacion3_archivo <- '../NH0046.csv'

estacion3 <- download.file(url=estacion3_url, destfile= estacion3_archivo)

usethis::use_data(estacion3, overwrite = TRUE)
