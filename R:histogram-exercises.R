#load packages
library(tidyverse)

#load data
party <- read_csv("data/nominate.csv")

#quick look
glimpse(party)

#histogram
ggplot(party, aes(x = ideology)) +
  geom_histogram()

#Review Exercises
- The data, the aesthetics, and the geometry
- The data = nominate, the aesthetics = aes(x=ideology), the geometry = geom histogram
- ggplot is a complex package that tells R to make a plot of some kind
- aes() is a package that accounts for aesthetics and is the first argument 
- geom_histogram is the geometry that tells R to make a histogram

# specify data and aesthetic, then add geometry
ggplot(party, aes(x=ideology, y=..density..)) + geom_histogram()

#filter the 100th congress
nominate100 <- filter(party, congress==100)

#quick look
glimpse(nominate100)

#create histogram for 100th congress
ggplot(nominate100, aes(x=ideology)) + geom_histogram()

#filter for the 114th congress
nominate114 <- filter(party, congress ==114)

#quick look
glimpse(nominate114)

#create histogram for 114th congress

ggplot(nominate114, aes(x=ideology)) + geom_histogram()

#review exercise 4.3
- The filter() allows us to separate out smaller segments of larger data set.sets
  the first argument is what data set in our subdirectory it should pull from and 
  the second argument is the specific snippet of data that it is pulling from.

#build histogram
ggplot(nominate100, aes(x=ideology)) + geom_histogram() + facet_grid(vars(party))

#exercises 4.4
- A facet wrap creates subsets from data frames and draws one histogram per subset
- A facet wrap creates a separate histogram for each variable we are trying to
  distinguish from the two within that variable. The function works by adding it 
  to the code for making a histogram to tell R to make separate hisograms
- This would not work because you are missing "vars" in the code. This is essential
  because vars stands for variables and R would not know where to look if you did not have it.
- Having just run it, R creates separate histograms for all 50 states - that is super cool. 
- Facet grid is most useful for two discrete variables, so using it for state (as I did at first)
  will not tell you much. However, using it for party might tell you more. It functions
  in much the same way that facet wrap does, it just shows you different grids for each 
  variable
  
  #4.5 density plots
  
  #create density plot
  
  ggplot(nominate100, aes(x=ideology)) + geom_density()
  
  #4.5 exercises
  - A density plot is different from a histogram because it shows you different information.
    A density plot shows how much of the data is in each point - it is a rough sketch of the 
    data contained in a histogram. It is similar in that it is delivering the same data to us,
    but it represents the data differently
  - geom density is used similarly to the hisogram function and is the third key element of making
    a histogram of geography. As mentioned, it shows the density of points on each side, and 
    represents the same data using a different graphical means of doing so
    
#4.6 - Color
#build density plot

ggplot(nominate100, aes(x=ideology, color=party)) + geom_density()

#4.6.2 - Fill
#build density plot

ggplot(nominate100, aes (x=ideology, fill=party)) + geom_density()

#4.6.3 alpha
#build density plot
ggplot(nominate100, aes(x=ideology, fill=party)) + geom_density(alpha=0.5)

#exercises 4.6
- Color function colors only the lines, while fill colors in all the points underneath the lines.default(
  Fill, in my opinion, is more visiually pleasing. 
ggplot(party, aes(x=ideology, color=party)) + geom_density(alpha=0.5)
- This is useful in that it shows the overall accumulated data for all the Congresses,
  but is not useful if you are trying to know how it has changed over time
- Alpha transparency allows you to see the overlap without one covering up the other. If it is 
  on color mode it does not noticeably change anything, but if you have it on fill, the shading is
  less prominent and it is harder to discern the overlap.

#4.7 Labels
#build density plot
  
ggplot(party, aes(x=ideology, fill=party)) + geom_density (alpha = 0.5) + labs(x = "Ideology Score", y= "Density", fill="Party", title="A Density Plot of Ideology Scores for the 100th Congress", subtitle="There are Few Moderates in Congress", caption="Data Source: DW-NOMINATE from voteview.com")

#4.7 Exercises
- R uses variable names by default to label X and Y axes and legends
- This default can be changed by using the labs function following the geography. 
  Each one mentioned can be altered in this way.
- Labs makes labels for each set of the plot and to use it, you need to specify what part you want to change
  by providing one argument per aesthetic (including label, title, subtitle) - be sure to use quotes
- Each part in the last block of code sets up what the label will be in each part of the density plot.
  The x refers to the x-axis, the y to the y-axis, the fill to the color, the title to the title of the plot
  the subtitle to the subtitle of the  ploy, and the caption is for the source

#4.8: Themes

ggplot(nominate100, aes(x=ideology, fill=party)) + geom_density(alpha=0.5) + theme_bw()

#load packages
library(ggthemes) #for additional themes and more "fun"
ggplot(nominate100, aes(x=ideology, fill=party)) + geom_density(alpha=0.5)+theme_bw()

#exercises 4.8
- Themes in ggplot help to add depth to the plot and make it more "artsy".They control the background and chnage the overlay of the plot 
- You add it to the end of the geometric code and can use a pretty large number of theme
- You can do things like black and white in ggplot2, grey, line draw, and light. In 
  gg themes you have more varied and idiosyncratic themes like excel, economist, economist white, etc.
- After trying several out, I found that I liked the BW theme the most because it just has a reader-friendly look
  so even if I am reading late at night, it does not require mental stress to read it and the data is central, not the artsy parts of it.

#4.9 putting it all together
#build density plot
ggplot(party, aes(x=ideology, fill=party)) + geom_density(alpha=0.5) +facet_wrap(vars(congress)) + labs(x="Ideology Score", y="Density", fill="Party", title="A Density Plot of Ideology Scores for the 100th-114th Congress", subtitle="There are Few Moderates in Congress", caption="Data Source: DW-NOMINATE from voteview.com") + theme_bw() 
# save last plot as png
ggsave("doc-figs/ideology-density-by-congress.png", height=5, width=8)

#4.10 Exercises
- First, create the plot that you want - since gg save by default saves the most recently created plot, try to have that be the one you save
  second, decide the file type that you want (i.e., pdf, png, etc) - this helps you to read the plot
  third, choose where you want to save your figure within your working directory - name it something effective 
  fourth, choose a compact and descriptive name for your figure that acts as an intuitive reminder of what it actually is
  fifth, use gg save where it contains the full path to the plot under the Working Directory
- The first argument to gg save is the file name that has the file path. This is just where you are saving the plot. 
  The height is the height of the figure in inches, and the width is how wide the figure is in inches
- The last block of code above saves the previously created figure to the doc-figs subdirectory in the working directory of hw02 as a png document (and can save a pdf as well) 
  the other two arguments control the height and width of the figure. This dictates how big the plot will be when I open it in my usual PDF/PNG software. If done correctly,
  the figure should now show up in the correct folder