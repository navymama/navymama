# bayesian networks monte carlo simulation
# assigning variables

trials <-100000
alpha <-9
beta <-1
SamplesA <-rbeta(trials, 27+alpha, 39+beta)
SamplesB <-rbeta(trials, 10+alpha, 45+beta)
Bsuperior <- sum(SamplesB > samplesA/ trials)
Bsuperior
# there is indication the mold will return
SamplesA
