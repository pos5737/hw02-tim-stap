# hw02-tim-stap
load packages
load data
quick look
create histogram
facet only works for nominal vars
final histogram
ggplot(eg01,aes(x=enep, fill = social_heterogeneity)) + geom_density(alpha=1)+facet_wrap(vars(electoral_system)) + theme_bw() + abs(x="Effective Number of Electoral Parties", y="Density of Each Electoral System", fill="Social Heterogeneity", title="A Density Plot of Effective Number of Parties Based on Electoral Laws and Social Heterogeneity", Subtitle="A Robust Relationship")
ggsave
