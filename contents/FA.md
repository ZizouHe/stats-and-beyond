# Factor Analysis

## Model

$$X \in \mathbb{R}^p$$ is linearly dependent upon a few common factors and specific factors, with

$$
X - \mu = L F + \epsilon
$$

where $$L \in \mathbb{R}^{p \times m}$$ the *factor loading*, $$F \in \mathbb{R}^{m \times 1}, m < p$$ the *factor (common factor)*, and $$\epsilon \in \mathbb{R}^{p \times 1}$$ the *noise (specific factor)*.

note that the representation is not unique, since

$$
X - \mu = (LT) (T'F) + \epsilon, \; \; T T^T = I
$$

There are some assumptions: factors are independent as well as noise

$$
\mathbb{E}(F) = 0, \quad \mathrm{Cov}(F) = I
$$

$$
\mathbb{E}(\epsilon) = 0, \quad \mathrm{Cov}(\epsilon) = \Psi = \mathrm{diag}(\psi_1, ..., \psi_p)
$$

and 

$$
\mathrm{Cov}(\epsilon, F) = \boldsymbol{0}
$$

## Covariance Matrix

Total covariance matrix is

$$
\Sigma = L L^T + \Psi
$$

and variance can be decomposited into two parts: communality and specific variance

$$
\sigma_{ii} = l_{i1}^2 + \cdots + l_{im}^2 + \psi_i \triangleq h_i^2 + \psi_i
$$

Notice that communality is not affected by $$T$$.

## Methods of Estimation

### PCA

1. Initial $$\tilde{\Psi}$$

2. Find $$L$$, the largest $$m$$ eigenvectors of the eigen decomposition of $$\hat{\Sigma} - \tilde{\Psi}$$

3. Update $$\tilde{\Psi} = \mathrm{diag}(\hat{\Sigma} - L L^T)$$

4. Repeat...

### Maximum Likelihood Method

Assumption: the common factors and the specific factors are jointly normally distributed.

It is not well defined because of multiplicity of choices of L, we can impose computationally convenient uniqueness condition:

$$
L^T \Psi^{-1} L = \Phi, \; \; \Phi \;\; \text{is diagonal matrix}
$$

## Factor Rotation

We have different choice of $$T$$. Ideally, we should like to see a pattern of loadings such that each variable loads highly on a single factor and has small to moderate loadings on the remaining factors.

We here introduce *Varimax Criterion*, Varimax procedure selects the orthogonal transformation $$T$$ that maximizes

$$
V = \frac{1}{p} \sum_{j=1}^m \left\{\sum_{i=1}^p \tilde{l}_{ij}^4 - \frac{1}{p}\left[\sum_{i=1}^p \tilde{l}_{ij}^2\right]^2\right\}
$$

## Reference

- [Andrew Ng's Lecture Notes on Factor Analysis](http://cs229.stanford.edu/notes/cs229-notes9.pdf).

- Chapter 9 of Johnson & Wichern, Applied Multivariate Statistical Analysis, 6th edition. 

- See below Lin Hou's lecture notes (*Tsinghua, Multivariate Statistical Analysis*) on Factor analysis.

{% pdf src="/assets/Factor Analysis_Tsinghua.pdf", width="100%", height="850" %}{% endpdf %}