# Computational Tricks

## 1. The use of Jensen's Inequality

$$
\begin{aligned}
\left[\mathbb{E}[X^2 - \mathbb{E}(X^2)]\right]^k \leq \mathbb{E}\left[X^2 - \mathbb{E}(X^2)\right]^k 
\leq \mathbb{E}\left[X^2 + \mathbb{E}(X^2)\right]^k
\end{aligned}
$$

Notice that for any $$a = 0, 1, \cdots, k$$, and $$x, y > 0$$

$$
x^a y^{k-a} + x^{k-a} y^{a} \leq x^k + y^k 
$$

Therefore, 

$$
(x+y)^k \leq 2^{k-1} (x^k + y^k)
$$

and 

$$
\left[\mathbb{E}[X^2 - \mathbb{E}(X^2)]\right]^k \leq 2^{k-1} \left\{\mathbb{E}[X^{2k}] + \left(\mathbb{E}[X^2]\right)^k \right\}
$$

## 2. Some small results

- for any $$k > 0$$

$$
k^{1/k} \leq e^{1/e} \leq 2
$$

- for random variable $$X \geq 0$$

$$
E(X) = \int_0^\infty \mathbb{P}(X > t) \; \mathrm{d} t
$$

- $$1 + x$$:

Note that

$$
\max_{x \in \mathbb{R}} f(x) = e^x - x - 1 = f(0) = 0
$$

Therefore, for any $$x \in \mathbb{R}$$,

$$
1 + x \leq e^x
$$

- For any $$x > 0$$,

$$
\left(1 + \frac{1}{x}\right)^x \leq e
$$

and the limit

$$
\lim_{x \rightarrow \infty} \left(1 + \frac{1}{x}\right)^x = e
$$

## 3. Union bound

Since 

$$
\left\{\exists x \in \mathcal{X}: x \in \text{some set A}\right\} \subset \bigcup_{x \in \mathcal{X}} \{x \in \text{some set A}\}
$$

we have

$$
\mathbb{P}\left(\max_{x \in \mathcal{X}} f(x) > t\right) \leq \sum_{x \in \mathcal{X}} \mathbb{P}(f(x) > t)
$$

## 4. The use of Pythagoras Theorem

If g is the projection of f onto some function space and h is any function on the same space, then

$$
\|	h - f \|_2^2 = \| g - f \|_2^2 + \|g - h\|_2^2
$$

which is very useful when g is an oracle.
