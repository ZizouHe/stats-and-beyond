# Eigenvalue Inequalities

## Weyl's inequalities

$$A, B \in \mathbb{R}^{m \times n}$$, for all $$1 \leq k \leq \min\{m,n\}$$, we have the following result about eigenvalues:

$$
|\sigma_k(A) - \sigma_k(B) | \leq \| A - B \|
$$

## Variant of Davis–Kahan theorem 

See *[Yu, Y., Wang, T. and Samworth, R. (2015). A useful variant of the Davis–Kahan theorem for statisticians. Biometrika 102 315–323](https://arxiv.org/abs/1405.0680)*

Let $$\Sigma, \hat{\Sigma} \in \mathbb{R}^{p \times p}$$ be symmetric, with eigenvalues $$\lambda_1 \geq ... \geq \lambda_p$$ and $$\hat{\lambda}_1 \geq ... \geq \hat{\lambda}_p$$ respectively. Fix $$1 \leq r \leq s \leq p$$ and assume that $$\min (\lambda_{r-1} - \lambda_r, \lambda_s - \lambda_{s+1}) > 0$$ where we define $$\lambda_0 = \infty, \lambda_{p+1} = - \infty$$. Let $$d = s - r + 1$$ and let $$V= (v_r, ..., v_s), \; \hat{V} = (\hat{v}_r, ..., \hat{v}_s) \; \in \; \mathbb{R}^{p \times d}$$ have orthonormal columns satisfying $$\Sigma v_j = \lambda_j v_j$$ and $$\hat{\Sigma} \hat{v}_j = \hat{\lambda}_j \hat{v}_j$$ for $$j = r, r+1, ..., s$$. Then,

$$
\| \sin \Theta (\hat{V}, V)\|_F \leq \frac{2 \min (\sqrt{d}\|\hat{\Sigma} - \Sigma\|_{op}, \| \hat{\Sigma} - \Sigma\|_F )}{\min(\lambda_{r-1} - \lambda_r, \lambda_s - \lambda_{s+1})}
$$

Moreover, if we are estimating the top-K eigenvectors and set $$r = 1$$, then $$\min(\lambda_{r-1} - \lambda_r, \lambda_s - \lambda_{s+1}) = \lambda_s - \lambda_{s+1}$$ since $$\lambda_0 = \infty$$. Therefore, 

$$
\| \sin \Theta (\hat{V}, V)\|_F \leq \frac{2 \min (\sqrt{d}\|\hat{\Sigma} - \Sigma\|_{op}, \| \hat{\Sigma} - \Sigma\|_F )}{\lambda_s - \lambda_{s+1}} \leq \frac{2 \sqrt{d}\|\hat{\Sigma} - \Sigma\|_{op}}{\lambda_s - \lambda_{s+1}}
$$

$$
\| \sin \Theta (\hat{V}, V)\|_F \leq \frac{2 \| \hat{\Sigma} - \Sigma\|_F }{\lambda_s - \lambda_{s+1}}
$$

## Hoffman-Weilandt Theorem

Let A and B be two $$m \times n$$ matrices with singular values $$\sigma_1(A) \geq \cdots \geq \sigma_{\min\{m,n\}}(A)$$ and $$\sigma_1(B) \geq \cdots \geq \sigma_{\min\{m,n\}}(B)$$respectively. Then,

$$
\sum_k |\lambda_k(A) - \lambda_k(B)|^2 \leq \|A - B \|_F^2
$$

## Eckart-Young-Mirsky Theorem

Let A be a rank-$$r$$ matrix with singular value decomposition

$$
A = \sum_{i=1}^r \lambda_i u_i u_i^T
$$

where $$\lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_r > 0$$. are the ordered singular values of A. For any $$k < r$$, let $$A_k$$ to be the truncated singular value decomposition of A given by

$$
A_k = \sum_{i=1}^k \lambda_i u_i u_i^T
$$

Then for any matrix B such that $$\mathrm{rank}(B) \leq k$$, it holds

$$
\| A - A_k \|_F \leq \|A - B \|_F
$$

and 

$$
\| A - A_k \|^2_F = \sum_{j = k+1}^r \lambda_j^2
$$

***proof.***

$$
\| A - A_k \|^2_F = \left\| \sum_{j = k+1}^r \lambda_j u_j u_j^T \right\|_F^2= \sum_{j = k+1}^r \lambda_j^2
$$

and for any matrix B such that $$\mathrm{rank}(B) \leq k$$, with Hoffman-Weilandt Theorem,

$$
\begin{aligned}
\|A - B \|_F 
&\geq \sum_{j=1}^r \left(\lambda_j(A) - \lambda_j(B)\right)^2 \\
&= \sum_{j=1}^k \left(\lambda_j(A) - \lambda_j(B)\right)^2 + \sum_{j = k+1}^r \lambda_j^2 \\
&\geq  \| A - A_k \|^2_F
\end{aligned}
$$

given the fact that $$\mathrm{rank}(B) \leq k \; \Longrightarrow \;\lambda_j(B) = 0,\; j \geq k+1$$
