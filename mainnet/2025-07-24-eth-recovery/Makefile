include ../../Makefile
include ../.env
include .env

ifndef LEDGER_ACCOUNT
override LEDGER_ACCOUNT = 0
endif

.PHONY: deploy-implementation
deploy-implementation:
	@if [ -z "$(RPC_URL)" ]; then \
		echo "Error: RPC_URL is required. Usage: make deploy-implementation RPC_URL=<url>"; \
		exit 1; \
	fi
	forge script --rpc-url $(RPC_URL) DeployRecoveryImplementation \
		--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --sig "run()" --broadcast

.PHONY: dry-run-deployments
dry-run-deployments:
	@if [ -z "$(RPC_URL)" ]; then \
		echo "Error: RPC_URL is required. Usage: make dry-run-deployments RPC_URL=<url>"; \
		exit 1; \
	fi
	forge script --rpc-url $(RPC_URL) DeployRecoveryProxies --sig "run()" --sender $(DEPLOYER)
