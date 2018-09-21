# Norms

## $$\psi_1$$-norm and $$\psi_2$$-norm

$$
\| X\|_{\psi_1} = \sup_{p \geq 1} \frac{\left(\mathbb{E}|X|^p\right)^{1/p}}{p}
$$

$$
\| X\|_{\psi_2} = \sup_{p \geq 1} \frac{\left(\mathbb{E}|X|^p\right)^{1/p}}{\sqrt{p}}
$$

and $$\psi_1$$-norm can be seen as a proxy of standard deviation.

## Schatten norms

$$
\|A_{m \times n}\|_p = \left(\sum_{i=1}^{\min\{m,n\}} \sigma_i^p(A) \right)^{1 / p}
$$

where $$\sigma_i(A)$$ denotes the $$i$$th singular value of $$A$$, and the $$p = 1$$ case yields the nuclear norm and $$p = 2$$ yields the Frobenius norm below.

## nuclear norm

$$
\|A_{m \times n}\|_* = \sum_{i=1}^{\min\{m,n\}} \sigma_i(A) = \mathrm{Tr}\left(\sqrt{AA^H}\right)
$$

## Frobenius norm

$$
\| A_{m \times n} \|_F = \sqrt{\sum_{i = 1}^m \sum_{j = 1}^n |a_{ij}|^2} = \sqrt{\mathrm{Tr}(AA^H)}
$$

## Max norm

$$
\|A\|_\max = \max_{ij} |a_{ij}|
$$

## Vector-induced Norm

$$
\|A\|_p = \sup_{x \neq 0} \frac{\|Ax\|_p}{\|x\|_p}
$$

- L-1 norm:

$$
\|A\|_1 = \max_{1 \leq j \leq n} \sum_{i=1}^m |a_{ij}|
$$

- L-$$\infty$$ norm:

$$
\|A\|_\infty = \max_{1 \leq i \leq m} \sum_{j=1}^n |a_{ij}|
$$

- L-2 Norm

$$
\|A\|_2 = \sigma_\max(A)
$$

the largest singular value of matrix A.

$$
\begin{aligned}
\|A\|_2 
= \sup_{x \neq 0} \frac{\|Ax\|_2}{\|x\|_2} 
&= \sup_{x \neq 0} \frac{\|U \Sigma V^T x \|_2}{\|x\|_2} \\
&= \sup_{x \neq 0} \frac{\|\Sigma V^T x \|_2}{\|x\|_2} \text{ (invariant under multiplication by unitary matrices)} \\
&= \sup_{y \neq 0} \frac{\|\Sigma y \|_2}{\|V y\|_2} \\
&= \sup_{y \neq 0} \frac{\|\Sigma y \|_2}{\|y\|_2} \\
&= \sup_{y \neq 0} \frac{\left(\sum_{i=1}^n \sigma_i^2 y_i^2\right)^{1/2}}{\left(\sum_{i=1}^n y_i^2\right)^{1/2}} \\
&\leq \sigma_1
\end{aligned}
$$

Also from above,
$$
\|Ax \| \geq \sigma_n, \quad x \in \mathbb{R}^n
$$

## Norm Equivalence

For matrix $$A \in \mathbb{R}^{m \times n}$$ with rank r.

$$
\| A \|_2 \leq \|A \|_F \leq \sqrt{r} \|A\|_2
$$

$$
\|A\|_F \leq \|A\|_* \leq \sqrt{r} \|A\|_F
$$

$$
\|A\|_{\max} \leq \|A \|_2 \leq \sqrt{mn} \|A \|_{\max}
$$

$$
\frac{1}{\sqrt{n}} \|A\|_\infty \leq \|A \|_2 \leq \sqrt{m} \|A\|_\infty
$$

$$
\frac{1}{\sqrt{m}} \|A\|_1 \leq \|A \|_2 \leq \sqrt{m} \|A\|_1
$$

$$
\|A\|_2 \leq \sqrt{\|A\|_1 \|A\|_\infty}
$$

We only prove the first one.

$$
\begin{aligned}
\| A_{m \times n} \|_F 
&= \sqrt{\sum_{i = 1}^m \sum_{j = 1}^n |a_{ij}|^2} = \sqrt{\mathrm{Tr}(AA^H)} \\
&= \sqrt{\sum_{i=1}^r \sigma_i^2}
\end{aligned}
$$

here r is the rank of A. Therefore, the first inequality is obvious.