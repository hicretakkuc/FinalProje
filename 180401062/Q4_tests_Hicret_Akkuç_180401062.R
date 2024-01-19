
#Bu test, sonuç dataframe'inin boş olmamasını, sütun isimlerinin doğru olup olmamasını test eder.

library(testthat)
library(readr)  

# Veri setini yükle
myDF <- read_csv("RAW_recipes.csv")  

test_that("Tags sütununda '30' veya '15' içeren ve Ingredients sütununda 'peanut butter' içerenleri bulma testi", {
  # Yeni bir dataframe oluşturun
  df <- data.frame(Name = myDF$name, Tags = myDF$tags, Ingredients = myDF$ingredients)
  
  # 'Tags' sütununda '30' veya '15' içeren satırları bulma
  test_indices <- grep("30|15", df$Tags)
  
  # Boş bir dataframe oluşturun
  result_df <- data.frame()
  
  # Her bir indeksteki 'Ingredients' değerlerini kontrol etme ve peanut butter bulunanları döndürme
  invisible(lapply(test_indices, function(index) {
    test2 <- df[grepl("peanut butter", df$Ingredients[index]), ]
    if (nrow(test2) > 0) {
      result_df <<- rbind(result_df, df[index, ])
    }
  }))
  
  # Test: Sonuç dataframe'i boş olmamalıdır
  expect_true(nrow(result_df) > 0, "Sonuç dataframe'i boş olmamalıdır.")
  
  # Test: Sonuç dataframe'inin sütun isimleri doğru olmalıdır
  expect_identical(names(result_df), c("Name", "Tags", "Ingredients"), "Sonuç dataframe'inin sütun isimleri doğru olmalıdır.")
  

})