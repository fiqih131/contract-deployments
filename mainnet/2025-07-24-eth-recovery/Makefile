include ../../Makefile
include ../.env
include .env

ifndef LEDGER_ACCOUNT
override LEDGER_ACCOUNT = 0
endif

.PHONY: deploy-implementation
deploy-implementation:
	$(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
	forge script --rpc-url $(L1_RPC_URL) DeployETHRecoveryImplementation \
	--sig "run()"

.PHONY: dry-run-deployments
dry-run-deployments:
	forge script --rpc-url $(L1_RPC_URL) DeployETHRecovery --sig "run()"
