# Probabilistic Graphic Models

A brief introduction of probabilistic graphic models, or more precisely, the skeleton of this topic.

In high dimensional case, the full representation of joint distribution may be computationally inefficient for many tasks like marginal distribution and conditional distribution. Specifically, we can assume the variables have some structure and the joint distribution can be written as the product of a set of functions:

$$
p(x_1, ..., x_n) = \prod_{i=1}^m f(x_C)
$$


We are using graph to represent one (or a class of) probability distribution(s). 



## Directed Graph

### Parameterization

Here we are talking about directed acyclic graph (DAG), a.k.a. Bayesian network in probabilistic graphic model. In DAG, we define 

$$
p(x_1, ..., x_n) = \prod_{i=1}^n f(x_i, x_{\pi_i})
$$

here $\pi_i$ represents the parents of $x_i$. We can show that $$f(x_i, x_{\pi_i})$$ is in fact the conditional probability $$p(x_i | x_{\pi_i})$$, and

$$
p(x_1, ..., x_n) = \prod_{i=1}^n p(x_i | x_{\pi_i})
$$

### Conditional Independency

If we can define a way to find the conditional independences associsated with given DAG, then any probability distribution associated with this DAG must satisfy all the conditional independences given in graph. However, we never say anything about the independences of subsets of variables that are not represented in the graph. 

There are three kinds of three-canonical graphs. 

$$
1. \; X \rightarrow Y \rightarrow Z, \; 2. \;X \rightarrow Y \leftarrow Z, \; 3. \; X \leftarrow Y \rightarrow Z
$$

In 1 and 2, $$X \perp Z | Y$$, and in 3, although $$X \perp Z$$ but they are conditional dependent given Y. 

Given three-canonical case, we can extend it to a graph search algorithm answering questions about conditional independence of any two variables given any subset of variables. This is known as [d-seperation algorithm](http://pgm.stanford.edu/Algs/page-75.pdf). The key idea behind this algorithm is that if you can find a path from A to B, then they are dependent, here the path may be blocked by the given variables (1 & 2) or activated by them (3).

### Characterization

For a given undirected graph, we define a family of distributions $$\mathcal{U}_1$$ , by ranging over all possible choices of positive potential functions on the maximal cliques of the graph.

We can also define another family of distributions $$\mathcal{U}_2$$, by gathering all the distributions that satisfies the conditional independence associated with the graph. It can be stated that these two families are equivalent.


## Undirected Graph

### Parameterization

Undirected graph is also known as *Markov Random Field*. We define 

$$
p(x_1, ..., x_n) = \frac{1}{Z} \prod_{i=1}^m \psi_{X_C}(x_C)
$$

where Z is the normalization constant. Note that each clique C consist of nodes that are fully connected, we call $$\psi(\cdot)$$ as potential function. Usually, Cs are taken as the maximal clique.

Since potential function must be nonnegative, we can remove this restriction by using exponential:

$$
p(x) = \frac{1}{Z} \exp \left\{- \sum_{C \in \mathcal{C}} H_C(x_C) \right\}
$$

### Conditional Independency

The conditional independence in undirected case is simply the naive graph-theoretic seperation.

### Characterization

For a given undirected graph, we define a family of distributions $$\mathcal{U}_1$$ , by ranging over all possible choices of positive potential functions on the maximal cliques of the graph.

We can also define another family of distributions $$\mathcal{U}_2$$, by gathering all the distributions that satisfies the conditional independence associated with the graph. 

The [Hammersley-Clifford Theorem](https://en.wikipedia.org/wiki/Hammersley%E2%80%93Clifford_theorem) states that these two families are equivalent.

<span style="color:red">Notice that in general we cannot transfer any directed model to undirected ones, or vice versa. </span>

## Factor Graph

### Parameterization

Consists of factors $$f_s$$ and variables $$x_i$$. Factor nodes only connect to variable nodes and vice versa. The joint probability is defined as

$$
p(x_1, ..., x_n) \propto \prod_{s=1}^S f_s(x_{C_s})
$$

Here $$C_s$$ are all the neighbouring variable nodes of factor node $$f_s$$.

### Relation with BN and MRF

We can convert any BN and MRF to factor graph. Details can be found in [An Introdution to Probabilistic Graphical Models, Chapter 4](https://people.eecs.berkeley.edu/~jordan/prelims/chapter4.pdf).

## Sum-Product Algorithm

We now care about marginalization, i.e.

$$
p(x_1) = \sum_{x_2} \cdots \sum_{x_n} p(x_1, ..., x_n)
$$

Notice that any conditional probabiltity is also closely connected with marginalization

$$
p(x_1 | x_E = \overline{x_E}) \propto \sum_{x_2} \cdots \sum_{x_n} p(x_1, ..., x_n) \delta(x_E, \overline{x_E})
$$

here $$\delta(x_E, \overline{x_E})$$ is the impulse function whose support is a one-point set located at $$\overline{x_E}$$.

### Sum-Product on a Tree

First notice that, we can ignore the directionality in DAG and treated them as undirected ones when doing marginalization. In a tree, the cliques only consist of one-node and two-node cliques. Therefore, 

$$
p(x) = \frac{1}{Z} \left(\prod_{i \in \mathcal{V}} \psi(x_i) \prod_{(i,j) \in \mathcal{E}} \psi(x_i, x_j)\right)
$$

on a tree with nodes $$\mathcal{V}$$ and edges $$\mathcal{E}$$. Therefore, if we are trying to get $$p(x_1)$$, we can set $$x_1$$ as the root, and eliminate from the leave. The idea is gained from the calculation order below:

$$
p(x_1) = \sum_{x_2} \cdots \sum_{x_n} \frac{1}{Z} \left(\prod_{i \in \mathcal{V}} \psi(x_i) \prod_{(i,j) \in \mathcal{E}} \psi(x_i, x_j)\right) \propto \sum_{x_2} \psi(x_2) \psi(x_1, x_2) \sum_{x_3} \cdots \sum_{x_n} \psi(x_n) \psi(x_{n-1}, x_n)
$$

we can add impulse function $$\delta(x_E, \overline{x_E})$$ such that $$\psi(x_E)^E = \psi(x_E) \delta(x_E, \overline{x_E})$$ to obtain conditional probability.

If we set a message pass protocal as: **a node can send message to a neighbouring node when and only when it has received message from all of its other neighbours.** Here the message denoted as the summation intermediate factor from its neightbouring nodes. 

In a tree graph, we simply send message from leaves to root and then send back from root to leaves, then we can get all the marginal distribution (any node can be seen as a root).

The message is defined as

$$
m_{ji}(x_i) = \sum_{x_j} \psi^E(x_j) \psi(x_i, x_j) \prod_{k \in \mathcal{N}_j \backslash i} m_{kj}(x_j)
$$

### Sum-Product in Factor Tree Graph

Just one note: the message send from factor nodes to variable nodes in converted factor tree graph is the same as the the message send from variable node to the corresponding variable node in the pre-converted undirected graph.

### Sum-Product in Tree-like Graph

We can treat some clique as one single high-dimensional variable and use the tree sum-product algorithm.

### Sum-Product in General Case

We can use the same protocal in general case and send mesaage again and again, it can be shown that in general sum-product does not converge to the true margin but:

<span style="color:red">
A set of beliefs gives Sum-Product a fixed point in any graph G if and only if they are stationary points of the Bethe free energy.
</span>

Details and Bethe free energy should be refered to [Joan Bruna's Lecture Notes](https://github.com/joanbruna/ir18).

## Max-Product

What happens if we want to maximize a posteriori (MAP) probability instead of marginalization.

$$
\max p(x_F | x_{E})
$$

In fact, we can use the same algorithm, use max instead of sum. The logic behind this is that 

$$
a \cdot b + b \cdot c = a \cdot (b+c), \; \; \max (a \cdot b, b \cdot c) = a \cdot \max(b,c)
$$

since "sum-product" and "max-product" pair are examples of an algebraic structure known as "commutative semiring".

## Reference

- See Michael I. Jordan [An Introdution to Probabilistic Graphical Models](https://people.eecs.berkeley.edu/~jordan/prelims/), Chapter 2, 3 & 4.

- Joan Bruna's [DS-GA.1005 Inference and Representation Lecture Notes](https://github.com/joanbruna/ir18), Lecture 2 & 3.

- See below Joan Bruna's DS-GA.1005 Inference and Representation Lecture Notes 3, from page 53 to page 77.

{% pdf src="/assets/DS1005-lecture3.pdf", width="100%", height="850" %}{% endpdf %}
