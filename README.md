# Clustering Analysis of Microbial Samples Based on Environmental Variables Using K-Means Algorithm
<img src="https://github.com/sulovekoirala/machinelearning_microbiology/blob/main/cluster_plot.svg">

In this report, I will present the results of a clustering analysis of microbial samples based on environmental variables using the k-means algorithm. The data set consists of four variables: oxygen, pH, salinity, and temperature, measured for 100 samples. The goal of the analysis is to find the optimal number of clusters that group the samples based on their similarity in the environmental variables, and to visualize and compare the clusters. The growth and activity of these microorganisms depend on several environmental factors, such as temperature, pH, salinity, and oxygen level. These factors affect the metabolism, enzyme function, membrane structure, and gene expression of the microorganisms. The data presented here are randomly generated. 

# Data Preparation 

```R
# Loading Packages & Data
library(readr)
library(ggplot2)
library(ggthemes)
library(reshape2)
library(ggforce)
data <- read_csv("data.csv")
```

# Identifying the possible number of clusters
```R
range <- 1:10
wss <- numeric(length(range))
for (i in range) {
  km <- kmeans(data, centers = i, nstart = 25)
  wss[i] <- km$tot.withinss
}
```

To predetermine the optimal number of clusters for this dataset, I am going to use the elbow method. The elbow method plots the WSS against the number of clusters (K), and looks for the elbow point where the WSS curve bends sharply. This point indicates that adding more clusters does not improve the clustering quality significantly. 

# Ploting the WSS vector against the range
```R
ggplot(data.frame(range, wss))+
  aes(x = range, y = wss) +
  geom_line() +
  geom_point(size = 4) + 
  geom_text(aes(label = range), vjust = -1.3, size = 5)+
  xlab("Number of clusters (K)") +
  ylab("Within-cluster sum of squares (WSS)")+
  theme_minimal(base_size = 19)
```
<img src="https://github.com/sulovekoirala/machinelearning_microbiology/blob/main/Picture3.jpg">

The plot above shows that the elbow point is around K=4. 
```R
K <-4 
```

# Performing k-means clustering 
```R
km <- kmeans(data, centers = K, nstart = 25)
data$cluster <- factor(km$cluster) # Adding the labels to the clusters
new_data <- melt(data, id.var = c('temp', 'cluster'))
```

# Plotting the results
In this case, I used it to create four plots with different facets based on the environmental variable: oxygen, pH, salinity, and temperature. The y-axis is temperature for all plots, and the x-axis is value for each environmental variable. The color includes the cluster label. 
```R
ggplot(new_data)+
  aes(value, temp, color = cluster, alpha = 0.5)+ 
  geom_point(size = 2.7)+
  theme_bw()+
  facet_wrap(~variable, scales = "free_x", nrow = 3, ncol = 2)+
  labs(title = "Comparison of environmental variables across k-means clusters based on temperature")
```
<img src="https://github.com/sulovekoirala/machinelearning_microbiology/blob/main/cluster_plot.svg">

# Conclusion 
In this report, I presented the results of a clustering analysis of microbial samples based on environmental variables using the k-means algorithm. I determined the optimal number of clusters to be 4, and visualized and compared the clusters using different methods. The plots show that the clusters differ in their temperature values, and also in their pH, salinity, and oxygen values. The clusters can be interpreted as different types of samples based on their environmental conditions.

