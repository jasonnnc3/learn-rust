EXIT_ON_ERROR = set -e;

.PHONY: pnpm-install
pnpm-install:
	@$(EXIT_ON_ERROR) pnpm install

.PHONY: dev
dev: dev-client dev-server dev-caddy-reverse-proxy dev-cockroachdb-cluster

.PHONY: dev-client
export VITE_DEV_SERVER_PORT := 3001
dev-client: pnpm-install
	@$(EXIT_ON_ERROR) pnpm dev

.PHONY: dev-server
export ACTIX_SERVER_PORT := 4000
dev-server:
	@$(EXIT_ON_ERROR) cd server && cargo watch -x 'run'

.PHONY: dev-caddy-reverse-proxy
dev-caddy-reverse-proxy:
	@$(EXIT_ON_ERROR) caddy run


.PHONY: dev-cockroachdb-cluster
export COCKROACHDB_LOCALHOST_PORT := 5000
dev-cockroachdb-cluster:
	@$(EXIT_ON_ERROR) cockroach start-single-node \
		--insecure \
		--listen-addr=localhost:26257 \
		--http-addr=localhost:$(COCKROACHDB_LOCALHOST_PORT)

# ----- testing --------

.PHONY: test
test:
	@$(EXIT_ON_ERROR) echo $(stuff)
