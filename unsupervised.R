# Dit is een kleine test om te kijken in hoeverre je met clustering (k-means) handgeschreven cijfers
# kunt herkennen. Er worden 10 clusters aangemaakt en in een ideale situatie, zouden daarmee
# de 10 verschillende cijfers van 0 tot 9 moeten kunnen worden gescheiden.

# Haal functions op.
source("functions.R")

# Haal de MNIST-data op 
load_mnist()

# Toon de eerste 100 cijfers in een matrix
par( mfrow = c(10,10), mai = c(0,0,0,0))
for(i in 1:100){
  y = as.matrix(train$x[i, 1:784])
  dim(y) = c(28, 28)
  image( y[,nrow(y):1], axes = FALSE, col = gray(255:0 / 255))
}

# Voer het cluster algoritme uit
set.seed(20)
mnistCluster <- kmeans(train$x[1:10000,], 10, nstart = 20, iter.max = 15)

# Bouw een vector van toegewezen clusters
clusterVec <- mnistCluster$cluster[1:100]

# Selecteer de beelden die bij een bepaald cluster horen
selectCluster <- train$x[1:100,][clusterVec == 10,]

# Toon de beelden van het gelecteerde cluster. Idealiter zouden dit allemaal dezelfde cijfers moeten zijn.
m <- dim(selectCluster)[1]
par( mfrow = c(10,15), mai = c(0,0,0,0))
for(i in 1:m){
  y = as.matrix(selectCluster[i, 1:784])
  dim(y) = c(28, 28)
  image( y[,nrow(y):1], axes = FALSE, col = gray(255:0 / 255))
}