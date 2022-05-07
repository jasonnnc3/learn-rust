# if this throws, run "touch ~/.env.local" in terminal
include ~/.env.local

EXIT_ON_ERROR = set -e;

.PHONY: pnpm-install
pnpm-install:
	@$(EXIT_ON_ERROR) pnpm install

.PHONY: dev
dev: dev-client dev-server dev-caddy-reverse-proxy

.PHONY: dev-client
export VITE_DEV_SERVER_PORT := 3001
dev-client: pnpm-install
	@$(EXIT_ON_ERROR) pnpm dev

.PHONY: dev-server
export ACTIX_SERVER_PORT := 8080
dev-server:
	@$(EXIT_ON_ERROR) cd server && cargo watch -x 'run'

.PHONY: dev-caddy-reverse-proxy
dev-caddy-reverse-proxy:
	@$(EXIT_ON_ERROR) caddy run

# ----- testing --------

.PHONY: test
test:
	@$(EXIT_ON_ERROR) echo $(stuff)
