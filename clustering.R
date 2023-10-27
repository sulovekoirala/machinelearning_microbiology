# Loading Packages
library(readr)
library(ggplot2)
library(ggthemes)
library(reshape2)
library(ggforce)

# Importing data
data <- read_csv("data.csv")

# Identifying the possible number of clusters
range <- 1:10
wss <- numeric(length(range))

#loop over the range and perform k-means clustering for each K
for (i in range) {
  km <- kmeans(data, centers = i, nstart = 25)
  wss[i] <- km$tot.withinss
}

#plot the WSS vector against the range using ggplot2
ggplot(data.frame(range, wss))+
  aes(x = range, y = wss) +
  geom_line() +
  geom_point(size = 4) + 
  geom_text(aes(label = range), vjust = -1.3, size = 5)+
  xlab("Number of clusters (K)") +
  ylab("Within-cluster sum of squares (WSS)")+
  theme_minimal(base_size = 19)

# Value for K chosen based on the above plot
K <-4 

# Performing k-means clustering 
km <- kmeans(data, centers = K, nstart = 25)
data$cluster <- factor(km$cluster) # Adding the labels to the clusters
new_data <- melt(data, id.var = c('temp', 'cluster'))

# Plotting the results
ggplot(new_data)+
  aes(value, temp, color = cluster, alpha = 0.5)+ 
  geom_point(size = 2.7)+
  theme_bw()+
  facet_wrap(~variable, scales = "free_x", nrow = 3, ncol = 2)+
  labs(title = "Comparison of environmental variables across k-means clusters based on temperature")+
  theme(legend.position="none")
