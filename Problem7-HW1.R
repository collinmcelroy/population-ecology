install.packages('deSolve')
library(deSolve)
exp.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
  })
}
t<-1:100
p<-c('r'=0.25)
y<-c('N'=1)

sim<-ode(y=y,times=t,func=exp.growth,parms=p,method='lsoda')
sim.frame<-as.data.frame(sim)

names(sim.frame)
names(sim.frame)<-c('t','abundance')
sim.frame$t
sim.frame$abundance

plot(abundance~t,data=sim.frame,type='l',lwd=3,col='purple',bty='l')

