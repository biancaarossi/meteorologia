test_that("grafico_temperatura_mensual devuelve un objeto ggplot", {
  df <- data.frame(
    id = c("NH0910", "NH0910"),
    fecha = as.Date(c("2020-01-01", "2020-02-01")),
    temperatura_abrigo_150cm = c(10, 12)
  )
  g <- grafico_temperatura_mensual(df, colores = c("red"), titulo = "Ejemplo")
  expect_s3_class(g, "ggplot")
})

test_that("grafico_temperatura_mensual funciona con colores insuficientes", {
  df <- data.frame(
    id = c("NH0910", "NH0046"),
    fecha = as.Date(c("2020-01-01", "2020-02-01")),
    temperatura_abrigo_150cm = c(10, 15)
  )
  g <- grafico_temperatura_mensual(df, colores = c("blue"), titulo = "Ejemplo")
  expect_s3_class(g, "ggplot")
})

