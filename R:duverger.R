# load packages
library(tidyverse)
#load data
cg01 <- read_rds("data/parties.rds")
#quick look
glimpse(cg01)
#create histogram
ggplot(cg01, aes(x=enep, y=..density..)) + geom_histogram()
#create facet - SH
ggplot(cg01, aes(x=enep)) + geom_histogram() + facet_grid(vars(social_heterogeneity))
#create facet - districts
ggplot(cg01, aes(x=enep)) + geom_histogram() + facet_wrap(vars(electoral_system))
#create facet - two things?
ggplot(cg01, aes(x=enep)) + geom_histogram() + facet_wrap(vars(social_heterogeneity))
ggplot(cg01, aes(x=enep)) + geom_histogram() + facet_wrap(vars(social_heterogeneity)) + facet_wrap (vars(electoral_system))
ggplot(cg01, aes(x=enep)) + geom_histogram() + facet_grid(vars(eneg))
ggplot(cg01, aes(x=enep)) + geom_density() + facet_grid(vars(electoral_system)) 
#Isolate Upper Tier
ut<- subset(cg01, upper_tier >1)
#final ggplot
ggplot(cg01, aes(x=enep, fill=social_heterogeneity)) + geom_density(alpha=1) + facet_wrap(vars(electoral_system)) + theme_bw() + labs(x="Effective Number of Electoral Parties", y="Density of Each Electoral System", fill="Social Heterogeneity", title="A Density Plot of Effective Number of Parties Based on Electoral Laws and Heterogeneity", Subtitle="A Robust Relationship")
#Save
ggsave("doc-figs/electoral-parties-socialheterogeneity-systems.pdf", height=5, width=8)
