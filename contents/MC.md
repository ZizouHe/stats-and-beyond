# Monte-Carlo Sampling

## Contents

Covering the topics below:

1. Rejection sampling (<span style="color:blue">*Deng's Lecture Notes 8, Gelman Chapter 10*</span>)

2. Adaptive rejection sampling (<span style="color:blue">*Deng's Lecture Notes 8, great example from P26-31*</span>)

3. Importance sampling (<span style="color:blue">*PRML Chapter 10 and corresponding notes*</span>)

4. Sampling-importance-resampling (<span style="color:blue">*PRML Chapter 10 and corresponding notes, Gelman Chapter 10*</span>)

5. Basis of markov chains (<span style="color:blue">*PRML Chapter 10 and corresponding notes, Deng's Lecture Notes 11*</span>)

6. The Metropolis-Hastings algorithm (<span style="color:blue">*Deng's Lecture Notes 9, Gelman Chapter 11*</span>)

	- Convergence, assessment and effective number of draws of MH algorithm (<span style="color:blue">*Gelman Chapter 11 from P281-288, Deng's Lecture Notes 11*</span>)
	- Jumping Rules. (<span style="color:blue">*Gelman Chapter 12 from P295-296, Deng's Lecture Notes 11*</span>)

7. Gibbs Sampling (<span style="color:blue">*Deng's Lecture Notes 10, Gelman Chapter 11*</span>)

	The Gibbs sampler can be slow to converge because of posterior dependence among parameters that cannot simply be resolved with a linear transformation.
	- Auxiliary variable method: using auxiliary variables to obtain conditionally independent components. (<span style="color:blue">*See an example in Gelman Chapter 12, P293-294*</span>)
	- Parameter expansion method: (<span style="color:blue">*See an example in Gelman Chapter 12, P294-295*</span>)

8. Slice sampling (<span style="color:blue">*PRML Chapter 10's corresponding notes*</span>)

9. Hybrid Monte-Carlo (PRML Chapter 10 and corresponding notes, [MCMC: Hamiltonian Monte Carlo](https://theclevermachine.wordpress.com/2012/11/18/mcmc-hamiltonian-monte-carlo-a-k-a-hybrid-monte-carlo/) and [R. M. Neal's paper](https://arxiv.org/pdf/1206.1901.pdf))

	- <span style="color:red">Leapfrog method introduce numerical error due to the step size can not be as small as possible, thus using a Metropolis-like acceptance probability to ensure system Hamiltonian remains constant.</span>

	- <span style="color:red">We sample momentum variable in the outer iteration so that the system energy will change, therefore we can arrive at an ergodic sampling scheme. Notice that sample from momentum will not change location variable x since they are independent.</span>

	- <span style="color:red">Although independent, we can use Hamiltonian dynamics to automatically update location variable with respect to momentum variable.</span>

	- <span style="color:red">With Hamiltonian dynamics, we avoid the random walk behaviour.</span>


## Reference

- Wanlu Deng’s Lecture Notes 8 - 10 (*Tsinghua University, Bayesian Methods for Statistical Inference, Spring 2018* ).

- Bishop, Christopher. Pattern Recognition and Machine Learning (PRML). Springer, 2006.

- Gelman, Andrew, et al. Bayesian data analysis. Chapman and Hall/CRC, 2013. 3rd edition.

- Neal, R. M. (2011). MCMC using Hamiltonian dynamics. Handbook of Markov Chain Monte Carlo, 2(11), 2.

- Joan Bruna's homework 5 on HMC *(New York University, DS.1005 Inference and Representation, Fall 2018)*

- See below my summary notes on PRML chapter 11.

{% pdf src="/assets/Bayesian Notes 14&15.pdf", width="100%", height="850" %}{% endpdf %}
