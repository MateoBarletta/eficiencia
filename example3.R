

# EXAMPLE3
# Bogetoft & Otto (2011, p.103)

setwd("C:/Users/...")
rm(list=ls(all=TRUE))

library(Benchmarking)
x <- matrix(c(2, 2, 5, 10, 10, 3, 12, 8, 5, 4, 6,12),ncol=2)
y <- matrix(rep(1,6), ncol=1)
w <- matrix(c(1.5, 1), ncol=2) # vector of input's prices
te <- dea(x,y,RTS="vrs");te # technical efficiency
dea.plot.isoquant(x[,1]%/%y, x[,2]%/%y, RTS="vrs",main="DEA isoquant",txt=LETTERS[1:length(x)],xlim=c(0,14))

#DEA cost minimization
xopt <- cost.opt(x,y, w, RTS="vrs") 
cobs <- x %*% t(w) # observed cost
copt <- xopt$x %*% t(w) # minimum cost
ce <- copt/cobs;(ce) # cost efficiency (Farrel's global efficiency)
ae <- ce/te$eff;(ae) # allocative efficiency
res<-cbind(ce,te$eff,ae) 
rownames(res) <- c("A", "B", "C", "D","E","F")
colnames(res) <- c("CE", "TE", "AE"); res








