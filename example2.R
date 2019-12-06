
# EXAMPLE 2
# Bogetoft & Otto (2011, p.95)

setwd("C:/Users/...")
rm(list=ls(all=TRUE))

#Input oriented VRS model

library(Benchmarking) # load the Benchmarking library
x <- matrix(c(20, 40, 40, 60, 70, 50),ncol=1) # define inputs
y <- matrix(c(20, 30, 50, 40, 60, 20),ncol=1) # define outputs
e_vrs <- dea(x,y, RTS="vrs", ORIENTATION="in")# solve LP envelopment problem
ivrs<- eff(e_vrs);ivrs # select efficiency scores from the results in e
dea.plot.frontier(x, y, RTS="vrs",main="VRS frontier",txt=LETTERS[1:length(x)])
dea.plot(x,y,RTS="crs",ORIENTATION="in-out",add=TRUE,lty="dashed")
  
# peers
peers(e_vrs)
lambda(e_vrs)

# scale efficiency
e_vrs <- dea(x,y,RTS='vrs')
e_drs <- dea(x,y,RTS='drs')
e_crs <- dea(x,y,RTS='crs') 
se <- eff(e_crs)/eff(e_vrs);se

abs(eff(e_vrs)-eff(e_drs)) < 1e-4 # test if DRS eff = VRS eff
 

