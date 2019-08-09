These are notes of things that it would be nice for OPA to enforce as a default on a new cluster.

It would also be useful to have a test-suite of some description for each of these cases to verify that the rego is working as expected.


- no use of 'latest' tag
- no reuse of ingress routes
- no reuse of selectors in different namespaces
- resource limits & requests are configured on every deployment (maybe a default added otherwise)
- define a 'prod' url which is only allowed to be used in certain namespaces (prod namespaces)
- Disallow scaling down to 0 (normally a mistake).
- set of allowed repos to pull from
- [potential] disallow deploying to prod with most accounts
