# Other Topics in Matrix Analysis

## Courant Mini-max Principle

Let $$A$$ be a n × n Hermitian matrix with eigen values $$\lambda_1 \leq \lambda_2 \leq \cdots \leq \lambda_n$$. Define 

$$
R_A(x) = \frac{\langle Ax, x\rangle}{\langle x, x\rangle}
$$

The Mini-max principle states that

$$
\lambda_k = \min_{U} \left\{\max_x \left\{ R_A(x) | x \in U \; \text{and} \; x \neq 0 \right\} | \text{dim}(U) = k\right\}
$$

also,

$$
\lambda_k = \max_{U} \left\{\min_x \left\{ R_A(x) | x \in U \; \text{and} \; x \neq 0 \right\} | \text{dim}(U) = n - k + 1\right\}
$$

Therefore, one quick conclusion can be made:

$$
\lambda_1 \leq R_A(x) \leq \lambda_n, \quad \forall x \in \mathbb{C}^n \backslash\{0\}
$$

## $$\sin \Theta$$ Distance between Subspaces

To define a notion of distance between subspaces spanned by two sets of vectors. This can be done through the idea of principal angles: if $$V,\hat{V} \in \mathbb{R}^{p \times d}$$ both have orthonormal columns, then the vector of $$d$$ principal angles between their column spaces is $$(\cos^{−1} \sigma_1 , \cdots , \cos^{-1} \sigma_d )^T$$ , where $$\sigma_1 \geq \cdots \geq \sigma_d$$ are the singular values of $$\hat{V}^TV$$. Thus, principal angles between subspaces can be considered as a natural generalization of the acute angle between two vectors. 

We let $$\Theta(\hat{V},V)$$ denote the $$d \times d$$ diagonal matrix whose $$j$$ th diagonal entry is the $$j$$ th principal angle, and let $$\sin\Theta(\hat{V},V)$$ be defined entrywise. 

Therefore, we can use Frobenius norm to represent the distance between the two subspaces. 

$$
\| \sin \Theta(\hat{V}, V)\|_F
$$

## Golden-Thompson inequality

Let A, B be two Hermitian matrices, when A and B commute, we have:

$$
e^{A+B} = e^A e^B
$$

However, when A and B do not commute, the situation is much more complicated; we have the *Baker-Campell-Hausdoff* fomula:

$$
e^{A+B} = e^A e^B e^{-\frac{1}{2}[A,B]} \dots
$$

the detailed form can be found [here](https://en.wikipedia.org/wiki/Baker%E2%80%93Campbell%E2%80%93Hausdorff_formula).

On the other hand, taking determinants we still have the identity:

$$
\mathrm{det}\left(e^{A+B}\right) = \mathrm{det}\left(e^{A}e^B\right)
$$

However, there is another very nice relationship, which is called *Golden-Thompson inequality*:

$$
\mathrm{tr}\left(e^{A+B}\right) \leq \mathrm{tr}\left(e^{A}e^B\right)
$$