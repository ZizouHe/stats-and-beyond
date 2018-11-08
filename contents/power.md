# Power Iteration

The power method for computing the top eigenvector of a symmetric, diagonalizable A starts with an initial vector $$x$$ and repeatedly multiplies by A, eventually causing $$x$$ to converge to the top eigenvector. 

## Basic Algorithm

Suppose $$A \in \mathbb{C}^{n \times n}$$ is diagonalizable with eigenvalues $$\lambda_1, ..., \lambda_n$$ in a decreasing absolute order (if A is the sample covariance matrix in most case, then all eigenvalues are non-negative). Then, from a random vector $$x^{(0)}$$, our updating rule is:

$$
x^{(k+1)} = \frac{A x^{(k)}}{\|A x^{(k)}\|}
$$

The idea behind this algorithm is simple: if $$\lambda_1$$ is the largest one, then the power iteration will stands out the largest one while other $$\left(\frac{\lambda_i}{\lambda_1}\right)^k$$ will converge to zero.

There is one obvious potential problems with the power method: *What if $$\frac{\lambda_2}{\lambda_1}$$ is near one?* Or the relative gap is very small? We
address this problem now. 

$$
\mathrm{gap} = \frac{|\lambda_1 - \lambda_2|}{|\lambda_1|}
$$

## Shift-and-Invert Method

For a random start vector, the power method converges in $$O\left(\log(d \; / \;\epsilon) \; \frac{1}{\mathrm{gap}} \right)$$ iterations, where

$$
\mathrm{gap} = \frac{|\lambda_1 - \lambda_2|}{|\lambda_1|}
$$

we assume a high-accuracy regime where $$\epsilon < $$ gap. The dependence on this gap ensures that the largest eigenvalue is significantly amplified in comparison to the remaining values.

If the eigenvalue gap is small, one approach is replace A with a preconditioned matrix – i.e. a matrix with the same top eigenvector but a much larger gap. Specifically, let $$B = \lambda I − A^TA$$ for some shift parameter $$\lambda$$. If $$\lambda > \lambda_1$$, we can see that the smallest eigenvector of B (the largest eigenvector of $$B^{−1}$$) is equal to the largest eigenvector of A. 

Additionally, if $$\lambda$$ is close to $$\lambda_1$$, there will be a constant gap between the largest and second largest values of $$B^{−1}$$. For example, if
$$\lambda = (1 + \mathrm{gap})\lambda_1$$, then we will have

$$
\lambda_1(B^{-1}) = \frac{1}{\lambda - \lambda_1} = \frac{1}{\mathrm{gap}\;\lambda_1}
$$

$$
\lambda_2(B^{-1}) = \frac{1}{\lambda - \lambda_2} = \frac{1}{2 \; \mathrm{gap}\;\lambda_1}
$$

This constant factor gap ensures that the power method applied to $$B^{−1}$$ converges to the top eigenvector of A in just $$O\left(\log(d \; / \;\epsilon)\right)$$ iterations.

## Stochastic Variance Reduced Gradient (SVRG)

The shift-and-invert method has a a catch – each iteration of
this shifted-and-inverted power method must solve a linear system in B, whose condition number is proportional $$\frac{1}{\mathrm{gap}}$$. For small gap, solving this system via iterative methods is more expensive.


Fortunately, linear system solvers are incredibly well studied and there are many efficient itera- tive algorithms we can adapt to. when $$A$$ is positive semi-definite (i.e. covariance matrix),we introduce a variant of Stochastic Variance Reduced Gradient method.

Typically, stochastic gradient methods are used to optimize convex functions that are given as the sum of many convex components. To solve a linear system

$$
A x = b
$$

we can minimize the convex function 

$$
f(x) = \frac{1}{2} x^T A x - b^T x
$$

using some common methods like Newton method.