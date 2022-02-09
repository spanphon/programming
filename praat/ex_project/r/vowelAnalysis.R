# clean working directory
rm(list = ls(all = TRUE))

# Set working directory
setwd("~/academia/teaching/ru/ru_spanish_585/585_01_s2017/programming/praat/ex_project/")

# read data
df <- read.csv("./data/data.csv", header = TRUE, quote = "")

library(tidyverse)
library(lingStuff)

str(df)

separate(df, col = info, into = c("participant", "item"), sep = 4) %>%
separate(., col = item, into = c("item", "rep"), sep = -2) -> df_clean

items <- unique(df_clean$item)

df_clean[df_clean$item == "bait", 'vowel'] <- 'ei'
df_clean[df_clean$item == "bat", 'vowel'] <- 'ae'
df_clean[df_clean$item == "beat", 'vowel'] <- 'i'
df_clean[df_clean$item == "bet", 'vowel'] <- 'E'
df_clean[df_clean$item == "bit", 'vowel'] <- 'I'
df_clean[df_clean$item == "boat", 'vowel'] <- 'o'
df_clean[df_clean$item == "boot", 'vowel'] <- 'u'
df_clean[df_clean$item == "bought", 'vowel'] <- 'a'
df_clean[df_clean$item == "but", 'vowel'] <- 'V'
df_clean[df_clean$item == "frog", 'vowel'] <- 'a'
df_clean[df_clean$item == "had", 'vowel'] <- 'ae'
df_clean[df_clean$item == "hayed", 'vowel'] <- 'ei'
df_clean[df_clean$item == "head", 'vowel'] <- 'E'
df_clean[df_clean$item == "heed", 'vowel'] <- 'i'
df_clean[df_clean$item == "hid", 'vowel'] <- 'I'
df_clean[df_clean$item == "hod", 'vowel'] <- 'a'
df_clean[df_clean$item == "hoed", 'vowel'] <- 'o'
df_clean[df_clean$item == "hood", 'vowel'] <- 'u'
df_clean[df_clean$item == "hud", 'vowel'] <- 'V'
df_clean[df_clean$item == "log", 'vowel'] <- 'a'
df_clean[df_clean$item == "pot", 'vowel'] <- 'a'
df_clean[df_clean$item == "put", 'vowel'] <- 'V'
df_clean[df_clean$item == "whod", 'vowel'] <- 'u'


vowel_plot(data = df_clean, vowel = 'vowel', f1 = 'f1', f2 = 'f2')

df_clean %>%
  group_by(vowel) %>%
  summarize(., dur = mean(durationV), f0 = mean(f0), f1 = mean(f1), f2 = mean(f2)) %>%
  ggplot(., aes(x = f2, y = f1, label = vowel)) +
    scale_x_reverse() + 
    scale_y_reverse() +
    geom_text() + 
    theme_bw()