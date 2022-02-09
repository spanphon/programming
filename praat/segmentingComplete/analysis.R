
# Set working directory
setwd("~/Desktop/segmenting")

library(tidyverse); library(lingStuff)

# Combine files vertically into large data frame
temp <- list.files(path = "./data/", full.names = TRUE, pattern = ".csv")
myfiles = lapply(temp, read.csv, sep = ",")
df <- do.call("rbind", myfiles)

# remove unwanted characters from column
df$f0 <- gsub("--undefined--", "NA", paste(df$f0))
df$f0 <- as.numeric(df$f0)

df <- df %>%
  separate(., col = prefix, into = c('segment', 'id', 'item'), sep = "_")

df$vowel <- 'a'

str(df)



ggplot(df, aes(vot, color = id)) + 
  geom_density(bw = 10) + 
  xlim(-150, 150) + 
  theme_bw()


vowel_plot(df, vowel = 'vowel', f1 = 'f1', f2 = 'f2', group = 'id')





