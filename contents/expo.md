# Exponential Family

## Introduction

A probability density in the *exponential family* takes the following form:

$$
p(x | \theta) = h(x) \exp\left(\theta^T T(x) - A(\theta) \right)
$$

where $$T(x)$$ is actually called sufficient statistics and $$A(\theta)$$ is a normalization term (also noted as log-partition function) with the form

$$
A(\theta) = \log \int h(x) \exp\left\{\theta^T T(x)\right\}
$$

## Sufficient Statistics

**Definition.** We say a function of random variable $$X$$, $$T(X)$$, to be sufficient for $$\theta$$ if the conditional distribution of $$X$$ given $$T(X)$$ is not a function of $$\theta$$, i.e.

An alternative definition from a Bayesian perspective argues that $$T(X)$$ is sufficient for $$\theta$$ if $$\theta$$ is conditionally independent from $$X$$ given $$T(X)$$.

**Theorem.** If a function of random variable $$X$$, $$T(X)$$, satisfies

$$
p(x | \theta) = g(T(x), \theta) h(x, T(x))
$$

Then it is sufficient for $$\theta$$.

**Corollary.** $$T(x)$$ in the p.d.f. of exponential family is sufficient for $$\theta$$.

## Properties

- The log-partition function $$A(\theta)$$ satisfies that

$$
\frac{\partial A}{\partial \theta_k}(\theta) = \mathbb{E}_\theta [T_k(X)] = \int T_k(x) p(x | \theta) \, \mathrm{d} x
$$
which is equal to say

$$
\frac{\mathrm{d} A(\theta)}{\mathrm{d} \theta} = \mathbb{E} T(X)
$$

- The second derivatives,

$$
\frac{\mathrm{d^2} A(\theta)}{\mathrm{d} \theta^2} = \mathrm{Var} [T(X)]
$$


## Legendre Conjugate

**Definition.** Let $$f: \mathbb{R} \rightarrow \mathbb{R}$$ be a convex function. The *Legendre Transform* $$f^*$$ of $$f$$ is defined as

$$
f^*(u) = \sup_x(x u - f(x))
$$

$$f^*$$ is called the *convex conjugate* of $$f$$.

**Notice**

1. As we can see, $$f^*$$ is obviously convex. 

2. $$f^{**} = f$$.

## Legendre Conjugate of Log-partition

Now consider the exponential family, the conjugate duality representation of convex functions $$A(\theta)$$ is

$$
A^*(\mu) = \sup_{\theta \in \Omega} \left\{ \mu^T \theta - A(\theta)\right\}
$$

The supremum is obtain at

$$
\begin{align*}
\mu 
&= \frac{\int_X T(x) h(x) \exp\left(\theta^T T(x)\right)}{\int_X h(x) \exp\left(\theta^T T(x)\right)} \\
&= \int_X T(x) h(x) \exp\left(\theta^T T(x) - A(\theta)\right) \\
&= \mathbb{E} T(x)
\end{align*}
$$

and therefore

$$
\begin{align*}
A^*(\mu) 
&= \int_X T(x) h(x) \exp\left(\theta^T T(x) - A(\theta)\right) - A(\theta) \\
&= \int_X T(x) h(x) \exp\left(\theta^T T(x) - A(\theta)\right) - A(\theta) \int_X \exp\left(\theta^T T(x) - A(\theta)\right) \\
&= \int_X \left(\theta^T T(x) - A(\theta)\right) \exp\left(\theta^T T(x) - A(\theta)\right) \\
&= \mathbb{E} \log p(x | \theta)
\end{align*}
$$

Therefore, $$A^*(\mu)$$ can be interpreted as the negative entropy of $$p_{\theta(\mu)}$$ where $$p_{\theta(\mu)}$$ is the exponential family such that $$\mathbb{E}_{p_{\theta(\mu)}} T(X) = \mu$$.

## Exponential Family and EM algorithm

We derive the exact EM algorithm for exponential families with
latent variables. Given observed variables $$X$$ and latent variables $$Z$$, we consider

$$
p(x, z | \theta) = h(x, z) \exp\left(\theta^T T(x, z) - A(\theta) \right)
$$

and 

$$
A(\theta) = \log \int h(x, z) \exp\left\{\theta^T T(x, z)\right\}
$$

The MLE for our parameters $$\theta$$ is obtained by maximizing the incomplete log-likelihood of the data:

$$
\mathcal{L}(\theta, x) = \log \int_Z h(x, z) \exp\left\{\theta^T T(x, z) - A(\theta)\right\} = A_x(\theta) - A(\theta)
$$

where we define 

$$
A_x(\theta) = \log \int_Z h(x, z) \exp\left\{\theta^T T(x, z)\right\}
$$

The variational representation gives,

$$
\begin{align*}
A_x(\theta) &= \sup_{\mu_x} \left\{ \theta^T \mu_x - A^*_x(\mu_x)\right\} \\
A_x^*(\mu_x) &= \sup_{\theta} \left\{ \theta^T \mu_x - A_x(\theta)\right\}
\end{align*}
$$

Therefore, we obtain a lower bound for the incomplete log-likelihood:

$$
\mathcal{L}(\theta, x) \geq \theta^T \mu_x - A^*_x(\mu_x) - A(\theta) \triangleq \tilde{\mathcal{L}}(\mu_x, \theta)
$$

EM is thus a coordinate ascent on the lower bound

$$
\begin{align*}
\text{(E step)} \quad \mu_x^{(t+1)} &= \arg \max_{\mu_x} \tilde{\mathcal{L}}(\mu_x, \theta^{(t)}) \\
\text{(M step)} \quad \theta^{(t+1)} &= \arg \max_{\theta} \tilde{\mathcal{L}}(\mu_x^{(t+1)},\theta)
\end{align*}
$$

E step is called expectation step because the maximizer of $$\tilde{\mathcal{L}}(\mu_x, \theta)$$ for fixed $$\theta$$ is, by duality, the expectation

$$
\mu_x^{(t+1)} = \mathbb{E} T(x, Z)
$$

<span style="color:red"> I guess here it is confusing, cause $$\mu_x^{(t+1)} \neq \mathbb{E} T(x, Z)$$, but instead something only integral on $$Z$$.
</span>

## Reference

- Joan Bruna's [DS-GA.1005 Inference and Representation Lecture Notes](https://github.com/joanbruna/ir18), Lecture 8.

- Michael I. Jordan, *An Introdution to Probabilistic Graphical Models*, Chapter 8.