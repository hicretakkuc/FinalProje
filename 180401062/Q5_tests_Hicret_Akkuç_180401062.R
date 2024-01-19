
#Oran hesaplamaları doğru yapılmış mı?

library(testthat)


test_that("Yüzdeliklerin doğru hesaplanıp hesaplanmadığını kontrol etme testi", {
  # Test işlemleri
  
  # 'tags' sütunundaki "30" ve "15" içeren verilerin oranını hesapla
  expected_tags_ratio <- sum(grepl("30|15", cmyDF$tags)) / nrow(cmyDF)
  
  # Test: 'tags_30_15_ratio' yüzdeliği doğru hesaplanmış mı?
  expect_equal(tags_30_15_ratio, expected_tags_ratio, tolerance = 0.001,
               info = "tags_30_15_ratio yüzdeliği doğru hesaplanmış mı?")
  
  # 'ingredients' sütunundaki "peanut butter" içeren verilerin oranını hesapla
  expected_peanut_butter_ratio <- sum(grepl("peanut butter", cmyDF$ingredients)) / nrow(cmyDF)
  
  # Test: 'peanut_butter_ratio' yüzdeliği doğru hesaplanmış mı?
  expect_equal(peanut_butter_ratio, expected_peanut_butter_ratio, tolerance = 0.001,
               info = "peanut_butter_ratio yüzdeliği doğru hesaplanmış mı?")
  
  # Hem "30" hem de "15" içeren, aynı zamanda "peanut butter" içeren verilerin oranını hesapla
  expected_both_ratio <- sum(grepl("30|15", cmyDF$tags) & grepl("peanut butter", cmyDF$ingredients)) / nrow(cmyDF)
  
  # Test: 'both_ratio' yüzdeliği doğru hesaplanmış mı?
  expect_equal(both_ratio, expected_both_ratio, tolerance = 0.001,
               info = "both_ratio yüzdeliği doğru hesaplanmış mı?")
})