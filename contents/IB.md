# Information Bottleneck

Let $$X$$ denote the signal (message) space with a fixed probability measure $$p(x)$$, and let $$\tilde{X}$$ denote its quantized codebook or compressed representation.

For each $$x \in X$$, we seek a possible stochastic mapping to a representative, or codeword in a codebook, $$\tilde{x} \in \tilde{X}$$, characterized by a conditional p.d.f. $$p(\tilde{x} | x)$$. We would like to find a good compression $$\tilde{X}$$.

## Rate distortion theory

We are facing a tradeoff bewteen the quality of representation and the level of compression. In single word, we want to use as fewer bits as possible to compress the original message but in the meantime remain as much information about the origin message as possible.

In rate distortion theory such a constraint is provided through a distortion function,

$$
d: X \times \tilde{X} \rightarrow \mathcal{R}^+
$$

which should be small for good representations. The partitioning of $$X$$ induced by the mapping $$p(\tilde{x} | x)$$, has an expected distortion

$$
\langle d(x, \tilde{x}) \rangle_{p(\tilde{x} | x)} = \sum_{x \in X} \sum_{\tilde{x} \in \tilde{X}} p(x, \tilde{x}) d(x, \tilde{x})
$$

There is a monotonic tradeoff between the rate of quantization and the expected distortion: the larger the rate, the smaller is the achievable distortion.

The celebrated rate distortion theorem of Shannon and Kolmogorov characterizes this tradeoff through the rate distortion function, defined as the minimal achievable rate under a given constraint on the expected distortion:

$$
R(D) \equiv \min\limits_{\{p(\tilde{x} | x): \langle d(x, \tilde{x}) \rangle \leq D\}} I(X; \tilde{X})
$$

where the mutual information $$I(X; \tilde{X})$$ is defined as

$$
I(X; \tilde{X}) = \sum_{x \in X} \sum_{\tilde{x} \in \tilde{X}} p(x, \tilde{x}) \log \left[\frac{p(\tilde{x} | x)}{p(\tilde{x})}\right] \, \mathrm{d} \tilde{x} \, \mathrm{d} x
$$

<span style="color:red">
Notice that mutual information can be seen as the K-L divergence for joint distribution $$p(x, \tilde{x})$$ and marginal distribution $$p(\tilde{x}) p(x)$$, which is non-negative and measures the dependency between these two variables. it reach zero if and only if $$x$$ and $$\tilde{x}$$ are independent.
</span>

Back to the optimization problem, it can be reformalized as a Lagrangian with Lagrangian multiplier $$\beta$$. Here we would like to minimize the functional below:

$$
\mathcal{F}[p(\tilde{x} | x)] = I(X; \tilde{X}) + \beta \langle d(x, \tilde{x}) \rangle_{p(\tilde{x} | x)}
$$

This variational formulation has the following well known consequences:

**Theorem**

The solution of the variational problem,

$$
\frac{\delta \mathcal{F}}{\delta p(\tilde{x} | x)}
$$

for normalized distributions $$p(\tilde{x} | x)$$, is given by the exponential form

$$
p(\tilde{x} | x) = \frac{p(\tilde{x})}{Z(x, \beta)} \exp[- \beta d(x, \tilde{x})]
$$

where $$Z(x,\beta)$$ is a normalization (partition) function. Moreover, the Lagrangian multiplier $$\beta$$ determined by the value of the expected distortion, D, is positive and satisfies

$$
\frac{\delta R(D)}{\delta D} = - \beta
$$

## Information Bottleneck

Since the "right" distortion measure is rarely available, the problem of relevant quantization has to be addressed directly, by preserving the relevant information about another variable. The relevance variable, denoted here by $$Y$$ , must not be independent from the original signal $$X$$, namely they have positive mutual information $$I(X; Y)$$. It is assumed here that we have access to the joint distribution $$p(x,y)$$.

If $$\tilde{X}$$ is given by $$X$$ through a stochastic mapping, $$p(\tilde{x} | x)$$, then

$$
I(\tilde{X}; Y) \leq I(X; Y)
$$

Obviously lossy compression cannot convey more information than the original data. There is also a tradeoff between compressing the representation and preserving meaningful information.

Here we want the compression keeps a fixed amount of meaningful information about the relevant signal $$Y$$ while minimizing the number of bits from the original signal $$X$$. We still consider a constraint optimization problem:

$$
\min\limits_{I(\tilde{X}; Y) \geq D} I(X; \tilde{X})
$$

which can be reformalized as a Lagrangian

$$
\mathcal{L}[p(\tilde{x} | x)] = I(\tilde{X}; X) - \beta I(\tilde{X}; Y)
$$

By varying the parameter $$\beta$$ one can explore the tradeoff between the preserved meaningful information and compression at various resolutions.

**Theorem**

The optimal assignment satisfies the equation:

$$
p(\tilde{x} | x) = \frac{p(\tilde{x})}{Z(x, \beta)} \exp \left[- \beta \sum_y p(y | x) log \frac{p(y | x)}{p(y | \tilde{x})}\right]
$$

where the distribution $$p(y | \tilde{x})$$ in the exponent is given via Bayes’ rule and the Markov chain condition $$\tilde{X} \leftarrow X \leftarrow Y$$, as,

$$
p(y | \tilde{x}) = \frac{1}{p(\tilde{x})} \sum_x p(y | x) p(\tilde{x} | x) p(x)
$$

**we must emphasize that it is a formal solution since $$p(y | \tilde{x})$$ in the exponential is defined implicitly in terms of the assignment mapping $$p(\tilde{x} | x)$$.**

<span style="color:red">
Remark: The Markov condition $$\tilde{X} \leftarrow X \leftarrow Y$$ accutually states that $$\tilde{X}$$ and $$Y$$ are conditionally independent given $$X$$.
</span>