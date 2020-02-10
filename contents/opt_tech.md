# Optimization Techniques

## Lipschitz continuous gradient

The gradient of $$f$$ is Lipschitz continuous with parameter $$L > 0$$ if

$$
\|\nabla f(x)-\nabla f(y)\|_{*} \leq L\|x-y\| \quad \text { for all } x, y \in \operatorname{dom} f
$$

where $$\| \cdot \|$$ and $$\| \cdot\|_*$$ are a pair of dual norms:

$$
\|u\|_{*}=\sup _{v \neq 0} \frac{u^{T} v}{\|v\|}=\sup _{\|v\|=1} u^{T} v
$$

and $$\| \cdot \|_2$$ is itself's dual norm. Dual norm implies a generalized Cauchy–Schwarz inequality

$$
\left|u^{T} v\right| \leq\|u\|_{*}\|v\| \quad \text { for all } u, v
$$

We now have from generalized Cauchy–Schwarz inequality,

$$
(\nabla f(x)-\nabla f(y))^{T}(x-y) \leq L\|x-y\|^{2} \quad \text { for all } x, y \in \operatorname{dom} f
$$

if dom $$f$$ is convex, we define $$g(t)=f(x+t(y-x))$$,

$$
g^{\prime}(t)-g^{\prime}(0)=(\nabla f(x+t(y-x))-\nabla f(x))^{T}(y-x) \leq t L\|x-y\|^{2}
$$

and

$$
\begin{aligned}
f(y)=g(1)=g(0)+\int_{0}^{1} g^{\prime}(t) d t & \leq g(0)+g^{\prime}(0)+\frac{L}{2}\|x-y\|^{2} \\
&=f(x)+\nabla f(x)^{T}(y-x)+\frac{L}{2}\|x-y\|^{2}
\end{aligned}
$$

Therefore, Lipschitz continuous gradient implies

$$
f(y) \leq f(x)+\nabla f(x)^{T}(y-x)+\frac{L}{2}\|y-x\|^{2} \text { for all } x, y \in \operatorname{dom} f
$$

