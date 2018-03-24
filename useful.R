foo <- c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5")

S1 <- read.csv("Spectrum1.csv")
S2 <- read.csv("Spectrum2.csv")
S3 <- read.csv("Spectrum3.csv")
S4 <- read.csv("Spectrum4.csv")
S5 <- read.csv("Spectrum5.csv")

SpecList <- list(S1 ,S2 ,S3 ,S4 ,S5)
names(SpecList) <- c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5")
