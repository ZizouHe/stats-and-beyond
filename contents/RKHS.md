# Reproducing Kernel Hilbert Space

- [Wiki on Positive-definite kernel](https://en.wikipedia.org/wiki/Positive-definite_kernel)
- [Wiki on Mercer's theorem](https://en.wikipedia.org/wiki/Mercer%27s_theorem)
- [Liu, Qiang, Jason Lee, and Michael Jordan. "A kernelized Stein discrepancy for goodness-of-fit tests." International Conference on Machine Learning. 2016.](http://proceedings.mlr.press/v48/liub16.pdf)

## Positive-definite Kernel

### Definition

Let $$\mathcal{X}$$ be a nonempty set, sometimes referred to as the index set. A symmetric function $$K : \mathcal{X} \times \mathcal{X} \rightarrow \mathbb{R}$$ is called a positive definite (p.d.) kernel on $$\mathcal{X}$$ if

$$
\sum_{i=1}^{n} \sum_{j=1}^{n} c_{i} c_{j} K\left(x_{i}, x_{j}\right) \geq 0
$$

holds for any $$n \in \mathbb{N}, x_{1}, \ldots, x_{n} \in \mathcal{X}, c_{1}, \ldots, c_{n} \in \mathbb{R}$$.

### Properties

There are some properties of positive-definite kernel, For a family of p.d. kernels $$\left(K_{i}\right)_{i \in \mathbb{N}}, K_{i} : \mathcal{X} \times \mathcal{X} \rightarrow R$$

- The sum $$\sum_{i=1}^{n} \lambda_{i} K_{i}$$ is p.d. given $$\lambda_{1}, \ldots, \lambda_{n} \geq 0$$
- The product $$K_{1}^{a_{1}} \ldots K_{n}^{a_{n}}$$ is p.d. given $$a_{1}, \ldots, a_{n} \in \mathbb{N}$$
- The limit $$K=\lim _{n \rightarrow \infty} K_{n}$$ is p.d. if the limit exists.

### Examples of p.d. Kernel

- Common examples of p.d. kernels defined on Euclidean space $\mathbb{R}^{d}$ include:
    - Linear kernel: $$K(x, y)=x^{T} y, \quad x, y \in \mathbb{R}^{d}$$
    - Polynomial kernel: $$K(x, y)=\left(x^{T} y+r\right)^{n}, \quad x, y \in \mathbb{R}^{d}, r>=0$$
    - Gaussian kernel (RBF Kernel): $$K(x, y)=e^{-\frac{\|x-y\|^{2}}{2 \sigma^{2}}}, \quad x, y \in \mathbb{R}^{d}, \sigma>0$$
    - Laplacian kernel: $$K(x, y)=e^{-\alpha\|x-y\|}, \quad x, y \in \mathbb{R}^{d}, \alpha>0$$
    - Abel kernel: $$K(x, y)=e^{-\alpha|x-y|}, x, y \quad \in \mathbb{R}, \alpha>0$$
    - kernel generating Sobolev spaces $$W_{2}^{k}\left(\mathbb{R}^{d}\right) : K(x, y)=\|x-y\|_{2}^{k-\frac{d}{2}} B_{k-\frac{d}{2}}\left(\|x-y\|_{2}\right)$$, where $$B_{\nu}$$ is the Bessel function of third kind.
    - kernel generating Paley-Wiener space: $$K(x, y)=\operatorname{sinc}(\alpha(x-y)), x, y \in \mathbb{R}, \alpha>0$$

- If $$\mathcal{H}$$ is a Hibert space, **then its corresponding inner product $$ \langle \cdot, \cdot \rangle_{\mathcal{H}} : \mathcal{H} \times \mathcal{H} \rightarrow \mathbb{R}$$ is a p.d. kernel.**

## Reproducing Kernel Hilbert Space

### Definition

Let $$\mathcal{X}$$ be a set, $$\mathcal{H}$$ a Hilbert space of functions $$f : \mathcal{X} \rightarrow \mathbb{R}$$ , and $$ \langle \cdot, \cdot \rangle_{\mathcal{H}} : \mathcal{H} \times \mathcal{H} \rightarrow \mathbb{R}$$ the corresponding inner product on $$H$$. For any $$x \in X$$ the evaluation functional $$e_{x} : \mathcal{H} \rightarrow \mathbb{R}$$ is defined by $$f \mapsto e_{x}(f)=f(x)$$.

**Definition.** Space $$\mathcal{H}$$ is called a *reproducing kernel Hilbert space* if the evaluation functionals are continuous.

### Reproducing Kernel

**Definition.** Reproducing kernel is a function $$K : \mathcal{H} \times \mathcal{H} \rightarrow \mathbb{R}$$ such that

1. $$K_{x}(\cdot) \in \mathcal{H}, \forall x \in \mathcal{X},$$ and
2. $$\left \langle f, K_{x}\right \rangle=f(x),$$ for all $$f \in \mathcal{H}$$ and $$x \in \mathcal{X}$$

The latter property is called the reproducing property.

**Theorem.** Every reproducing kernel $$K$$ induces a unique RKHS, and every RKHS has a unique reproducing kernel.

### Reproducing Kernel and p.d. Kernel

Now the connection between p.d. kernels and RKHS is given by the following theorem.

**Theorem.** Every reproducing kernel is positive definite, and every p.d. kernel defines a unique RKHS, of which it is the unique reproducing kernel.

Thus given a positive definite kernel $$K$$, it is possible to build an associated RKHS with $$K$$ as a reproducing kernel.

### p.d. Kernel Revisit

As stated earlier, p.d. kernels can be constructed from inner products. This fact can be used to connect p.d. kernels with another interesting object that arises in machine learning applications, namely the feature map. Let $$\mathcal{F}$$ be a Hilbert space, and $$(\cdot ,\cdot )_{\mathcal{F}}$$the corresponding inner product. Any map $$\Phi :\mathcal{X} \to \mathcal{F}$$ is called a feature map. In this case we call $$\mathcal{F}$$ the feature space. It is easy to see that every feature map defines a unique p.d. kernel by

$$
K(x,y)= \langle \Phi (x),\Phi (y) \rangle_{\mathcal{F}}
$$

Indeed, positive definiteness of $$K$$ follows from the p.d. property of the inner product. On the other hand, every p.d. kernel, and its corresponding RKHS, have many associated feature maps. For example: Let $$\mathcal{F}=\mathcal{H}$$, and $$\Phi (x)=K_{x}$$ for all $$x\in \mathcal{X}$$. Then $$\langle \Phi (x),\Phi (y) \rangle_{\mathcal{F}}= \langle K_{x},K_{y} \rangle_{\mathcal{H}}=K(x,y)$$, by the reproducing property. This suggests a new look at p.d. kernels as inner products in appropriate Hilbert spaces, or in other words p.d. kernels can be viewed as similarity maps which quantify effectively how similar two points $$x$$ and $$y$$ are through the value $$K(x,y)$$. Moreover, through the equivalence of p.d. kernels and its corresponding RKHS, every feature map can be used to construct a RKHS.

## Mercer's Theorem

**Theorem.** Suppose $$K$$ is a continuous symmetric non-negative definite kernel. Then there is an orthonormal basis $$\{e_i\}_i$$ of $$\mathcal{L}^2[a, b]$$ consisting of eigenfunctions such that the corresponding sequence of eigenvalues $$\{\lambda_i\}_i$$ is nonnegative. The eigenfunctions corresponding to non-zero eigenvalues are continuous on $$[a, b]$$ and $$K$$ has the representation

$$
K(s, t)=\sum_{j=1}^{\infty} \lambda_{j} e_{j}(s) e_{j}(t)
$$

where

$$
\int e_i(x) e_j(x) \, \mathrm{d} x = \mathbf{1}_{i = j}
$$

For a positive definite kernel $$k\left(x, x^{\prime}\right),$$ its related RKHS $$\mathcal{H}$$
comprises of linear combinations of its eigenfunctions, i.e.,
$$f(x)=\sum_{j} f_{j} e_{j}(x)$$ with $$\sum_{j} f_{j}^{2} / \lambda_{j}<\infty,$$ endowed with an inner product $$\langle f, g\rangle_{\mathcal{H}}=\sum_{j} f_{j} g_{j} / \lambda_{j}$$ between $$f(x)$$ and
$$g(x)=\sum_{j} g_{j} e_{j}(x).$$ Thus this Hilbert space is equipped
with a norm $$\|f\|_{\mathcal{H}}$$ where $$\|f\|_{\mathcal{H}}^{2}=\langle f, f\rangle_{\mathcal{H}}=\sum_{j} f_{j}^{2} / \lambda_{j}$$. One can verify that $$k(x, \cdot)$$ is in $$\mathcal{H}$$ and is the reproducing kernel of $$\mathcal{H}$$.

