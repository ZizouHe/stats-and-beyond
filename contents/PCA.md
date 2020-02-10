# Principle Component Analysis

## Formulations

We can write the principal components as the columns of a $$d×k$$ matrix B that maximizes the Frobenious norm of the data matrix $$X \in \mathbb{R}^{n \times d}$$ projected onto $$B$$:

$$
B_{p c a}=\arg \max _{B: B^\top B = I_k}\|X B\|_{F}^{2}
$$

Notice that the above optimization problem is equivalent to,

$$
\begin{aligned}
\arg \max _{B: B^\top B = I_k}\|X B\|_{F}^{2} 
&= \arg \max _{B: B^\top B = I_k} \mathrm{Tr} \left(B^\top X^\top X B\right) \\
&= \arg \max _{B: B^\top B = I_k} \mathrm{Tr} \left(B^\top \Sigma B\right) \\
&= \arg \max _{B: B^\top B = I_k} \mathrm{Tr} \left(B^\top U^\top \Lambda U B\right) \\
&= \arg \max _{B: B^\top B = I_k} \mathrm{Tr} \left(V^\top \Lambda V\right), \; \; U B = V
\end{aligned} 
$$

Therefore, the solution should be $$V = [\boldsymbol{e}_1; \boldsymbol{e}_2; \ldots; \boldsymbol{e}_k]$$ and $$B_{pca}$$ is exactly the top-$$k$$ eigenvectors of $$\Sigma$$.

An equivalent definition is

$$
B_{p c a}=\arg \min _{B}\left\|X-X B B^{\top}\right\|_{F}^{2}
$$

$$
\begin{aligned}
\arg \min _{B: B^\top B = I_k}\left\|X-X B B^{\top}\right\|_{F}^{2} 
&= \arg \min _{B: B^\top B = I_k} \mathrm{Tr} \left(X^\top X - B^\top X^\top X B - B^\top X^\top X B + X^\top X\right) \\
&= \arg \min _{B: B^\top B = I_k} 2 \mathrm{Tr} \left(X^\top X\right) - 2 \mathrm{Tr} \left(B^\top X^\top X B\right) \\
&= \arg \min _{B: B^\top B = I_k} \mathrm{const} - 2 \; \| X B \|_F^2 \\
&= \arg \max _{B: B^\top B = I_k}\|X B\|_{F}^{2} 
\end{aligned} 
$$

This objective function says that the principal components define an orthonormal basis such that the distance between the original data and the data projected onto that subspace is minimal. ($$X B$$ calculates the inner product and $$B^\top$$ is the basis, just like $$\sum_{i=1}^k \langle \boldsymbol{v}, \boldsymbol{u}_i \rangle \boldsymbol{v}$$).