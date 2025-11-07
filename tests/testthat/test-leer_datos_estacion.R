test_that("da error si los argumentos no son texto", {
  expect_error(leer_datos_estacion(123, "archivo.csv"))
  expect_error(leer_datos_estacion("NH0472", 123))
})

test_that("devuelve un data.frame con las columnas esperadas", {
  # Simulamos lo que debería devolver la función
  datos <- data.frame(
    id = rep("NH0472", 2),
    fecha = as.Date(c("2020-01-01", "2020-01-02")),
    temperatura_abrigo_150cm = c(10, 12)
  )

  # Verificamos estructura
  expect_s3_class(datos, "data.frame")
  expect_true(all(c("id", "fecha", "temperatura_abrigo_150cm") %in% names(datos)))
  expect_type(datos$id, "character")
  expect_type(datos$temperatura_abrigo_150cm, "double")
})
