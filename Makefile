EXIT_ON_ERROR = set -e;

.PHONY: pnpm-install
pnpm-install:
	@$(EXIT_ON_ERROR) pnpm install

.PHONY: dev
dev: dev-client dev-server dev-caddy-reverse-proxy dev-postgres

.PHONY: dev-client
export VITE_DEV_SERVER_PORT := 3001
dev-client: pnpm-install
	@$(EXIT_ON_ERROR) pnpm dev

.PHONY: dev-server
export ACTIX_SERVER_PORT := 4000
dev-server:
	@$(EXIT_ON_ERROR) cargo watch -x test -x run

.PHONY: dev-caddy-reverse-proxy
dev-caddy-reverse-proxy:
	@$(EXIT_ON_ERROR) caddy run

.PHONY: dev-postgres
dev-postgres:
	-./scripts/init_pg.sh

# ----- testing --------

.PHONY: test
test:
	@$(EXIT_ON_ERROR) echo $(stuff)
