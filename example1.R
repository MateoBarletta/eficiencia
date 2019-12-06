
# EXAMPLE 1 
# Coelli(2005) p165

setwd("C:/Users/...")

rm(list=ls(all=TRUE))

# load the Benchmarking library
library(Benchmarking) 

#load data
y <- matrix(c(1,2,3,1,2),ncol=1) # output matrix Mxq
x1 <- matrix(c(2, 2, 6,3,6),ncol=1)
x2<-matrix(c(5,4,6,2,2),ncol=1)
x <- matrix(c(x1,x2),ncol=2) #input matrix Nxp

# plot the input isoquant (Frontier)
dea.plot.isoquant(x1%/%y, x2%/%y, RTS="vrs",main="DEA isoquant",txt=TRUE,xlim=c(0,6))

# envelopment form
env <- dea(x,y, RTS="crs", ORIENTATION="in") 

eff(env)
peers(env)
lambda(env)

# multiplier form
mult <-dea(x,y, RTS="crs", ORIENTATION="in",DUAL=TRUE) 

# Print results
print(cbind("theta"=env$eff,peers(env),lambda(env),mult$u, mult$v), digits=3)
# Targets
x_star<-cbind(x1*env$eff, x2*env$eff); x_star # using efficiency scores
x_star2 <- lambda(env)%*%rbind(x[2,],x[5,]); x_star2 #using lambdas
