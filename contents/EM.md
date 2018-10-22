# Expectation-maximization

See [wikipedia](https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm#Proof_of_correctness) as well as [CS229 Andrew Ng's lecture notes](http://cs229.stanford.edu/notes/cs229-notes8.pdf), both very clear.

The E-step takes the lower bound and M-step max this lower bound. It can be shown that this algorithm monotonically increase the observed data likelihood and if this likelihood has a upper bound in the given parameter space, then it must converge to a (local or global) maxima.

Andrew's lecture notes is attached.

{% pdf src="/assets/cs229-EM algo.pdf", width="100%", height="850" %}{% endpdf %}