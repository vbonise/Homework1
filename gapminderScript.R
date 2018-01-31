# ================================
# R Code for Gapminder Exercise
#
# Modify this code to help 
# complete Homework 1
# ================================

# Packages needed for Homework 1
# - gapminder
# - ggplot2

# load gapminder package
library(gapminder)

# look at variables in the gapminder
# package - list variable names
names(gapminder)

# look at structure of gapminder
# dataset (columns in the dataframe)
str(gapminder)

# run simple summary stats for the
# columns/variables in gapminder package
summary(gapminder)

# find the mean life expectancy
mean(gapminder$lifeExp)
round(mean(gapminder$lifeExp), digits=2)

# find the median life expectancy
# for each continent
aggregate(lifeExp ~ continent, gapminder, median)

# load the ggplot2 package
library(ggplot2)

# make a plot of life expectancy by
# continent - dots overlaid on top of boxplots
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)

# for convenience, integrate the 
# country colors into the data.frame
# we'll use these color in next plot
gap_with_colors <-
  data.frame(gapminder,
             cc = I(country_colors[match(gapminder$country,
                                         names(country_colors))]))

# bubble plot, focus just on 
# Africa and Europe in 2007
keepers <- with(gap_with_colors,
                continent %in% c("Africa", "Europe") & year == 2007)
plot(lifeExp ~ gdpPercap, gap_with_colors,
     subset = keepers, log = "x", pch = 21,
     cex = sqrt(gap_with_colors$pop[keepers]/pi)/1500,
     bg = gap_with_colors$cc[keepers])

