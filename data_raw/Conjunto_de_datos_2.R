estacion2_url <- 'https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv'
estacion2_archivo <- '../NH0472.csv'

estacion2 <- download.file(url=estacion2_url, destfile= estacion2_archivo)

usethis::use_data(estacion2, overwrite = TRUE)
