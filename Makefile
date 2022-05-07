# if this throws, run "touch ~/.env.local" in terminal
include ~/.env.local

EXIT_ON_ERROR = set -e;

.PHONY: dev
dev:
	@$(EXIT_ON_ERROR) pnpm dev

# ----- testing --------

.PHONY: test
test:
	@$(EXIT_ON_ERROR) echo $(stuff)
