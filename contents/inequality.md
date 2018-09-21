# Inequalities

## Jensen's Inequality

If $$\varphi(\cdot)$$ is convex, then

- For any $$x_1, x_2$$ and $$t \in [0,1]$$

$$
\varphi(t x_1 + (1-t)x_2) \leq t \varphi(x_1) + (1-t)\varphi(x_2)
$$

- If $$X$$ is a random variable

$$
\varphi(\mathbb{E}[X]) \leq \mathbb{E}[\varphi(X)]
$$

## H$$\ddot{\mathrm{o}}$$lder's Inequality

$$p, q \in [1, \infty]$$ with $$\frac{1}{p} + \frac{1}{q} = 1$$, then

$$
\|f g\| \leq \|f\|_p \|g\|_q
$$

Also, for random variables $$X ,Y$$

$$
\mathbb{E}\left[ |XY | \right] \leq \left(\mathbb{E}[|X|^p]\right)^{\frac{1}{p}} \left(\mathbb{E}[|Y|^q]\right)^{\frac{1}{q}}
$$ 

***Note that you can choose $$p = 1$$ and $$q = \infty$$.***

## Young's Inequality

$$p, q > 0$$, $$a, b \geq 0$$ with $$\frac{1}{p} + \frac{1}{q} = 1$$, then

$$
a b \leq \frac{a^p}{p} + \frac{b^q}{q}
$$