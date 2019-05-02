# Semi-supervised Learning

Semi-supervised learning considers the problem (especially in classification) when only a small subset of the empirical data have labels. The question is: can we utilize the information in the unlabeled data to improve the classification. In recent year deep learning literatures, there are typically two ways to do semi-supervised learning: modification on generative models and few shot learning.

## Semi-supervised Learning with Variational Autoencoder

- [Kingma, D. P., Mohamed, S., Rezende, D. J., & Welling, M. (2014). Semi-supervised learning with deep generative models. In Advances in neural information processing systems (pp. 3581-3589).](http://papers.nips.cc/paper/5352-semi-supervised-learning-with-deep-generative-models.pdf)
- [Rasmus, A., Berglund, M., Honkala, M., Valpola, H., & Raiko, T. (2015). Semi-supervised learning with ladder networks. In Advances in neural information processing systems (pp. 3546-3554).](http://papers.nips.cc/paper/5947-semi-supervised-learning-with-ladder-networks.pdf)
- [Maaløe, L., Sønderby, C. K., Sønderby, S. K., & Winther, O. (2016). Auxiliary deep generative models. arXiv preprint arXiv:1602.05473.](https://arxiv.org/pdf/1602.05473.pdf)

Variational autoencoder (VAE) considers the following generative process:

$$
\boldsymbol{z} \sim \mathcal{N}(\boldsymbol{0}, I), \; \; p_{\boldsymbol{\theta}}(\boldsymbol{x} | \boldsymbol{z}) = f(\boldsymbol{x}; \boldsymbol{z}, \boldsymbol{\theta})
$$

where $$f(\cdot)$$ can be modeled using a deep neural network. The inference model on the contrary, has the following form:

$$
q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x}) = \mathcal{N}\left(\boldsymbol{\mu}_{\boldsymbol{\phi}}(\boldsymbol{x}), \boldsymbol{\sigma}^2_{\boldsymbol{\phi}}(\boldsymbol{x})\right)
$$

Therefore, the evidence lower bound (ELBO) for the likelihood function is

$$
\log p_{\boldsymbol{\theta}}(\boldsymbol{x}) \geq \mathbb{E}_{q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x})}\left[\log p_{\boldsymbol{\theta}}(\boldsymbol{x} | \boldsymbol{z})\right]-K L\left[q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x}) \| p_{\boldsymbol{\theta}}(\boldsymbol{z})\right]=-\mathcal{J}(\boldsymbol{x})
$$

Instead of optimize the likelihood function directly, we can optimize the lower bound of likelihood function. Notice that VAE can be seen as a combination of a encoder and a decoder, where $$\mathbb{E}_{q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x})}\left[\log p_{\boldsymbol{\theta}}(\boldsymbol{x} | \boldsymbol{z})\right]$$ is the reconstruction error for decoder and $$K L\left[q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x}) \| p_{\boldsymbol{\theta}}(\boldsymbol{z})\right]$$ the information compression quality for encoder.

In Gaussian case, the KL term can be computed analytically. The log-likelihood term can not be solved analytically, but with re-parameterization trick, we can rewrite it as

$$
\mathbb{E}_{q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x})}\left[\log p_{\boldsymbol{\theta}}(\boldsymbol{x} | \boldsymbol{z})\right]=\mathbb{E}_{\mathcal{N}(\boldsymbol{\epsilon} | \boldsymbol{0}, \boldsymbol{I})}\left[\log p_{\boldsymbol{\theta}}\left(\boldsymbol{x} | \boldsymbol{\mu}_{\boldsymbol{\phi}}(\boldsymbol{x})+\boldsymbol{\sigma}_{\phi}(\boldsymbol{x}) \odot \boldsymbol{\epsilon}\right)\right]
$$

where $$\odot$$ indicates the element-wise product. Therefore, the gradient can be expressed as

$$
\nabla_{\{\boldsymbol{\theta}, \boldsymbol{\phi}\}} \mathbb{E}_{q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x})}\left[\log p_{\boldsymbol{\theta}}(\boldsymbol{x} | \boldsymbol{z})\right]=\mathbb{E}_{\mathcal{N}(\boldsymbol{\epsilon} | \boldsymbol{0}, \boldsymbol{I})}\left[\nabla_{\{\boldsymbol{\theta}, \boldsymbol{\phi}\}} \log p_{\boldsymbol{\theta}}\left(\boldsymbol{x} | \boldsymbol{\mu}_{\boldsymbol{\phi}}(\boldsymbol{x})+\boldsymbol{\sigma}_{\boldsymbol{\phi}}(\boldsymbol{x}) \odot \boldsymbol{\epsilon}\right)\right]
$$

which can be evaluated analytically.

**What can we do with VAE under semi-supervised settings**

- In semi-supervised learning, one way to combine the generative model is training a VAE using all the data (labeled $$\{\boldsymbol{x}_i, y_i\} \triangleq \mathcal{D}_l$$ and unlabeled $$\{\boldsymbol{x}_i, y_i\} \triangleq \mathcal{D}_u$$) and then train a classifier with labels $$y_i$$ from $$\mathcal{D}_l$$ and latent representation of $$\boldsymbol{x_i}$$ from inference model $$q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x})$$.

- One can modify the generative model to include class label $$y$$. We then need to consider two case: for $$\mathcal{D}_l$$, the ELBO is the same with the normal VAE, with $$q_{\boldsymbol{\phi}}(\boldsymbol{z} | \boldsymbol{x}, y)$$; for $$\mathcal{D}_u$$, class label should be integrated out using $$q_{\boldsymbol{\phi}}(y | \boldsymbol{x})$$ in ELBO. We can add a classification loss such that the distribution $$q_{\boldsymbol{\phi}}(y | \boldsymbol{x})$$ also learns from labeled data.

- In Kingma, et al. (2014), the above model has been combined therefore the latter one does not infer from features $$\boldsymbol{x}$$ directly but from its latent representation $$\boldsymbol{z}$$ from the previous VAE instead.

- Other variations include a ladder structure (Rasmus, et al., 2015) where the encoding and decoding is happening on each layer, as well as auxiliary generative model where it adds a auxiliary variable to the model, which make the variational distribution (inference model) more expressive.

## Semi-supervised Learning with GANs

- [Salimans, T., Goodfellow, I., Zaremba, W., Cheung, V., Radford, A., & Chen, X. (2016). Improved techniques for training gans. In Advances in neural information processing systems (pp. 2234-2242).](http://papers.nips.cc/paper/6125-improved-techniques-for-training-gans.pdf)
- [Odena, A. (2016). Semi-supervised learning with generative adversarial networks. arXiv preprint arXiv:1606.01583.](https://arxiv.org/pdf/1606.01583.pdf)
- [Lecouat, B., Foo, C. S., Zenati, H., & Chandrasekhar, V. R. (2018). Semi-supervised learning with gans: Revisiting manifold regularization. arXiv preprint arXiv:1805.08957.](https://arxiv.org/pdf/1805.08957.pdf)

Generative adversarial networks (GANs) are a class of methods for learning generative models based on game theory. The goal of GANs is to train a generator network $$G(z; \boldsymbol{\theta}(G))$$ that produces samples from the data distribution, $$p_{\mathrm{data}}(x)$$, by transforming vectors of noise $$z$$ as $$x = G(z; \boldsymbol{\theta}(G))$$. The training signal for $$G$$ is provided by a discriminator network $$D(x)$$ that is trained to distinguish samples from the generator distribution $$p_{\mathrm{model}}(x)$$ from real data. The generator network $$G$$ in turn is then trained to fool the discriminator into accepting its outputs as being real.

A typical loss function form for GAN is

$$
\mathcal{L} = \mathbb{E}_{\boldsymbol{x} \sim p_{\mathrm{data}}(\boldsymbol{x})} \log D(\boldsymbol{x})+\mathbb{E}_{z \sim \operatorname{noise}} \log (1-D(G(\boldsymbol{z})))
$$

The simple way to combine GAN with semi-supervised learning is to turn the output size of discriminator from scaler to a $$K+1$$-dimension vector, where $$K$$ responses to the class number $$K$$. The idea to do semi-supervised learning here is simply adding samples from the GAN generator $$G$$ to our data set, labeling them with a new “generated” class $$y = K + 1$$. Therefore, we can define a corresponding loss function for this semi-supervised GAN as $$\mathcal{L} = \mathcal{L}_{\mathrm { supervised }}+ \mathcal{L}_{\mathrm{ unsupervised }}$$ where

$$
\begin{aligned}  \mathcal{L}_{\mathrm { supervised }} &=-\mathbb{E}_{\boldsymbol{x}, y \sim p_{\mathrm { data }}(\boldsymbol{x}, y)} \log p_{\mathrm { model }}\left(y \bigg| \boldsymbol{x}, y<K+1\right) \\
 \mathcal{L}_{\mathrm { unsuperrised }} &=-\left\{\mathbb{E}_{\boldsymbol{x} \sim p_{\mathrm { data }}(\boldsymbol{x})} \log \left[1-p_{\mathrm { model }}\left(y=K+1 \bigg| \boldsymbol{x}\right)\right]+\mathbb{E}_{\boldsymbol{x} \sim G} \log \left[p_{\mathrm { model }}(y=K+1 \bigg| \boldsymbol{x})\right]\right\}
\end{aligned}
$$

**Some training techniques is summarized below**

**1. feature matching**: Salimans et al. (2016) finds that feature matching loss for generator $$G$$ works well empirically:

$$
\left\| \mathbb{E}_{x \sim p_{\mathrm {data}} h(x)}-\mathbb{E}_{z \sim p_{z}}(z) h(g(z))\right\|_{1}
$$

where $$h(\cdot)$$ denotes some activations on an intermediate layer of the discriminator.

**2. manifold regularization**: using Laplacian norm $$\|f\|_{L}^{2}=\int_{x \in \mathcal{M}}\left\|\nabla_{\mathcal{M}} f(x)\right\|^{2} \mathrm{d} \mathcal{P}_{X}(x)$$ to encourage local invariance and hence smoothness of a classifier $$f$$ on the data manifold $$\mathcal{M}$$. The Laplacian norm can be approximated and therefore, we introduce a regularization term in $$\mathcal{L}_{\mathrm{ unsupervised }}$$

$$
\begin{aligned}
&-\left\{\mathbb{E}_{\boldsymbol{x} \sim p_{\mathrm { data }}(\boldsymbol{x})} \log \left[1-p_{\mathrm { model }}\left(y=K+1 \bigg| \boldsymbol{x}\right)\right]+\mathbb{E}_{\boldsymbol{x} \sim G} \log \left[p_{\mathrm { model }}(y=K+1 \bigg| \boldsymbol{x})\right]\right\} \\
&+ \lambda \mathbb{E}_{z \sim \operatorname{noise}, \delta \sim \mathcal{N}(\boldsymbol{0},\boldsymbol{I}) )}\|f(G(z))-f(G(z+\epsilon \overline{\delta}))\|_{2}^{2}
\end{aligned}
$$

where $$\overline{\delta} = \frac{\delta}{\| \delta\|}$$.
