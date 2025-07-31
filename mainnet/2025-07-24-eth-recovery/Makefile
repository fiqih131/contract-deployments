include ../../Makefile
include ../.env
include .env

ifndef LEDGER_ACCOUNT
override LEDGER_ACCOUNT = 0
endif

.PHONY: deps
deps:
	forge install --no-git github.com/OffchainLabs/nitro-contracts@v3.1.1

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

###################################################################################################
#                                  Execute Recovery Commands
###################################################################################################

BASE = base
OPTIMISM = optimism

.PHONY: sign-arb
sign-arb:
	$(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
		forge script --rpc-url $(L1_RPC_URL) ArbitrumExecuteRecovery --sig "sign(address[])" []

.PHONY: execute-arb
execute-arb:
	forge script --rpc-url $(L1_RPC_URL) ArbitrumExecuteRecovery --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" \
		--sig "run(bytes)" $(SIGNATURES) --broadcast

.PHONY: sign-base
sign-base:
	CHAIN=$(BASE) PORTAL=$(BASE_L1_PORTAL) $(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
		forge script --rpc-url $(L1_RPC_URL) OPStackExecuteRecovery --sig "sign(address[])" []

.PHONY: execute-base
execute-base:
	CHAIN=$(BASE) PORTAL=$(BASE_L1_PORTAL) forge script --rpc-url $(L1_RPC_URL) OPStackExecuteRecovery \
		--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --sig "run(bytes)" $(SIGNATURES) --broadcast

.PHONY: sign-op
sign-op:
	CHAIN=$(OPTIMISM) PORTAL=$(OPTIMISM_L1_PORTAL) $(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
		forge script --rpc-url $(L1_RPC_URL) OPStackExecuteRecovery --sig "sign(address[])" []
	
.PHONY: execute-op
execute-op:
	CHAIN=$(OPTIMISM) PORTAL=$(OPTIMISM_L1_PORTAL) forge script --rpc-url $(L1_RPC_URL) OPStackExecuteRecovery \
		--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --sig "run(bytes)" $(SIGNATURES) --broadcast
