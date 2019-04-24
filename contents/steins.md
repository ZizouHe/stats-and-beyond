# Stein's Method

- [Liu, Qiang, Jason Lee, and Michael Jordan. "A kernelized Stein discrepancy for goodness-of-fit tests." International Conference on Machine Learning. 2016.](http://proceedings.mlr.press/v48/liub16.pdf)
- [Ley, Christophe, Gesine Reinert, and Yvik Swan. "Stein’s method for comparison of univariate distributions." Probability Surveys 14 (2017): 1-52.](http://emis.ams.org/journals/PS/images/getdocbf05.pdf?id=1180&article=278&mode=pdf)

## Definition

**Definition.** Assume that $$\mathcal{X}$$ is a subset of $$\mathbb{R}^{d}$$ and $$p(x)$$ a continuous differentiable (also called smooth) density whose support is $$\mathcal{X}$$. The (Stein) ***score function*** of $$p$$ is defined as

$$
\boldsymbol{s}_{p}=\nabla_{x} \log p(x)=\frac{\nabla_{x} p(x)}{p(x)}
$$


**Definition.** We say that a function $$f : \mathcal{X} \rightarrow \mathbb{R}$$ is in the ***Stein class*** of $$p$$ if $$f$$ is smooth and satisfies

$$
\int_{x \in \mathcal{X}} \nabla_{x}(f(x) p(x)) \, \mathrm{d} x=0
$$

*Notice that the RBF kernel $$k\left(x, x^{\prime}\right)= \exp \left(-\frac{1}{2 h^{2}}\left\|x-x^{\prime}\right\|_{2}^{2}\right)$$ is in the Stein class for smooth densities supported on $$\mathcal{X}=\mathbb{R}^{d}$$.* 

**Definition.**  The ***Stein’s operator*** of $$p$$ is a linear operator acting on the Stein class of $$p$$, defined as

$$
\mathcal{A}_{p} \, f(x)=s_{p}(x) \, f(x)+\nabla_{x} \, f(x)
$$

Applying $$\mathcal{A}_{p}$$ on a vector-valued $$\boldsymbol{f}(x)$$ results a $$d \times d^\prime$$ matrix-valued function,

$$
\mathcal{A}_{p} \, \boldsymbol{f}(x)=\boldsymbol{s}_{p}(x) \, \boldsymbol{f}(x)^{\top} + \nabla_{x} \,  \boldsymbol{f}(x)
$$

## Stein's Identity

**Theorem.** Assume $$p(x)$$ is a smooth density supported on $$\mathcal{X}$$, then

$$
\mathbb{E}_{p}\left[\mathcal{A}_{p} \, \boldsymbol{f}(x)\right]=\mathbb{E}_{p}\left[\boldsymbol{s}_{p}(x) \,  \boldsymbol{f}(x)^{\top}+ \nabla \, \boldsymbol{f}(x)\right]=0
$$

for any $$\boldsymbol{f}$$ that is in the Stein class of $$p$$.

Another useful variate of Stein's Identity is as follows.

**Theorem.** Assume $$p(x)$$ and $$q(x)$$ are smooth densities supported on $$\mathcal{X}$$ and $$\boldsymbol{f}(x)$$ in the Stein class of $$p$$ , we have

$$
\mathbb{E}_{p}\left[\mathcal{A}_{q} \, \boldsymbol{f}(x)\right] = \mathbb{E}_{p}\left[\left(\boldsymbol{s}_{q}(x) - \boldsymbol{s}_{p}(x)\right) \, \boldsymbol{f}(x)^{\top}\right]
$$
