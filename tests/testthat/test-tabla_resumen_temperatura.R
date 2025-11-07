test_that("tabla_resumen_temperatura devuelve un data.frame con columnas correctas", {
  df <- data.frame(
    id = c("NH0910", "NH0910"),
    temperatura_abrigo_150cm = c(10, 12),
    temperatura_abrigo_150cm_maxima = c(15, 14),
    temperatura_abrigo_150cm_minima = c(8, 9)
  )
  resumen <- tabla_resumen_temperatura(df)
  expect_s3_class(resumen, "data.frame")
  expect_true(all(c("promedio_temperatura", "desvio_estandar", "temp_max", "temp_min") %in% colnames(resumen)))
})

test_that("tabla_resumen_temperatura falla si no es data.frame", {
  expect_error(tabla_resumen_temperatura(list(a=1, b=2)),
               "El argumento estacion debe ser un data.frame")
})
