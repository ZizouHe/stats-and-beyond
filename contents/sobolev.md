# Sobolev Space

See more in

- [Sobolev space - Wikipedia](https://en.wikipedia.org/wiki/Sobolev_space)
- [PDE notes page 38-39](https://github.com/ZizouHe/PDE/blob/master/Notes/PDE%20Notes.pdf)
- [Sobolev embedding theorem - Wikipedia](https://en.wikipedia.org/wiki/Sobolev_inequality)

## Weak Partial Derivative

We first note that $$\alpha = \left(\alpha_1, \ldots, \alpha_n\right)$$ is called *multi-index* of order $|\alpha| = \sum_{i=1}^{n} \alpha_i$ and we use the notition that

$$
D^\alpha f = \frac{\partial^{|\alpha|} f}{\partial x_1^{\alpha_1} \ldots \partial x_n^{\alpha_n}}
$$

for $$f =$$ in $$\mathbb{R}^n$$.

Now we come to the definition of weak partial derivative. Given function $$u, v \in \mathrm{L}^1_{\alpha}(\Omega)$$ on compact set $$\Omega$$, for all infinitely differentiable functions with compact support $$\Omega$$: $$\varphi \in \mathcal{C}_0^\infty(\Omega)$$, if

$$
\int_{\Omega} v \varphi \mathrm{d} x=(-1)^{|\alpha|} \int_{\Omega} u D^{\alpha} \varphi \mathrm{d} x
$$

we call $$v$$ the weak $$|\alpha|$$-th partial derivative of $$u$$, denote as $$v = D^\alpha u$$.

## Sobolev Space

The Sobolev spaces $$W^{k, p}(\Omega)$$ combine the concepts of weak differentiability and Lebesgue norms. In the one-dimensional case the Sobolev space $$W^{k, p}(\mathbb{R}) \text { for } 1 \leqslant p \leqslant \infty$$ is defined as the subset of functions $$f \text { in } L^{p}(\mathbb{R})$$ such that $$f$$ and its weak derivatives up to order $$k$$ have a finite $$L^p$$ norm.

With this definition, the Sobolev spaces admit a natural norm,

$$
\|f\|_{k, p}=\left(\sum_{i=0}^{k}\left\|f^{(i)}\right\|_{p}^{p}\right)^{\frac{1}{p}}=\left(\sum_{i=0}^{k} \int\left|f^{(i)}(t)\right|^{p} d t\right)^{\frac{1}{p}}
$$

Equipped with the norm $$\|\cdot\|_{k,p},W^{k,p}$$ becomes a Banach space. It turns out that it is enough to take only the first and last in the sequence, i.e., the norm defined by

$$
\left\|f^{(k)}\right\|_{p}+\|f\|_{p}
$$

is equivalent to the norm above (i.e. the *induced topologies* of the norms are the same).

## Sobolev Embeddings

It is a natural question to ask if a Sobolev function is continuous or even continuously differentiable. Roughly speaking, sufficiently many weak derivatives or large p result in a classical derivative. This idea is generalized and made precise in the Sobolev embedding theorem.

Let $$W^{k,p}\left(\mathbf{R}^{n}\right)$$ denote the Sobolev space consisting of all real-valued functions on $$\mathbf{R}^{n}$$ whose first $$k$$ weak derivatives are functions in $$L^{p} .$$ Here $$k$$ is a non-negative integer and $$1 \leq p<\infty .$$ The first part of the Sobolem states that if $$k>\ell$$ and $$1 \leq p<q<\infty$$ are two real numbers such that $$(k-\ell) p<n$$ and:

$$
\frac{1}{p}-\frac{k}{n}=\frac{1}{q}-\frac{\ell}{n}
$$

then

$$
W^{k, p}\left(\mathbf{R}^{n}\right) \subseteq W^{\ell, q}\left(\mathbf{R}^{n}\right)
$$

## Sobolev Embeddings Applications

In the special case of $$k=1$$ and $$\ell=0,$$ Sobolev embedding gives

$$
W^{1, p}\left(\mathbf{R}^{n}\right) \subseteq L^{p^{*}}\left(\mathbf{R}^{n}\right)
$$

where $$p^{*}$$ is the Sobolev conjugate of $$p,$$ given by

$$
\frac{1}{p^{*}}=\frac{1}{p}-\frac{1}{n}
$$

This special case of the Sobolev embedding is a direct consequence of the Gagliardo–Nirenberg–Sobolev inequality.

The second part of the Sobolev embedding theorem applies to embeddings in Hölder spaces $$C^{r, a}\left(\mathbf{R}^{n}\right)$$. If $$n<p$$ and

$$
\frac{1}{p}-\frac{k}{n}=-\frac{r+\alpha}{n}
$$

with $$\alpha \in(0,1]$$ then one has the embedding

$$
W^{k, p}\left(\mathbf{R}^{n}\right) \subset C^{r, \alpha}\left(\mathbf{R}^{n}\right)
$$

This part of the Sobolev embedding is a direct consequence of Morrey's inequality. **Intuitively, this inclusion expresses the fact that the existence of sufficiently many weak derivatives implies some continuity of the classical derivatives.**
