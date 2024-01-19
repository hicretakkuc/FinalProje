library(testthat)
library(readr)

test_that("Veri dosyasının başarıyla yüklendiği kontrol ediliyor", {
  # R chunk'ınızdan veri dosyasını yükle
  filename <- "RAW_recipes.csv"
  myDF <- suppressWarnings(read_csv(filename))
  
  # Dosyanın başarıyla yüklendiğini kontrol et
  expect_true(!is.null(myDF), "Veri dosyası başarıyla yüklendi.")
})

