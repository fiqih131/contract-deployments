include ../.env
include .env

BASE_BRIDGE_PATH=bridge
DEPLOYER_KEYPAIR_PATH=keypairs/deployer.json

BRIDGE_PROGRAM_KEYPAIR_PATH=keypairs/bridge.json
BRIDGE_PROGRAM_BINARY_PATH=bin/bridge.so

BASE_RELAYER_PROGRAM_KEYPAIR_PATH=keypairs/bridge.json
BASE_RELAYER_PROGRAM_BINARY_PATH=bin/bridge.so

.PHONY: deps
deps: checkout-base-bridge

.PHONY: checkout-base-bridge
checkout-base-bridge:
	[ -n "$(BASE_BRIDGE_COMMIT)" ] || (echo "BASE_BRIDGE_COMMIT must be set in .env" && exit 1)
	rm -rf $(BASE_BRIDGE_PATH)
	mkdir -p $(BASE_BRIDGE_PATH)
	cd $(BASE_BRIDGE_PATH); \
	git init; \
	git remote add origin https://github.com/base/bridge.git; \
	git fetch --depth=1 origin $(BASE_BRIDGE_COMMIT); \
	git reset --hard FETCH_HEAD

.PHONY: deploy-bridge
deploy-bridge:
	solana program deploy --url $(RPC_URL) --keypair $(DEPLOYER_KEYPAIR_PATH) --program-id $(BRIDGE_PROGRAM_KEYPAIR_PATH) $(BRIDGE_PROGRAM_BINARY_PATH)

.PHONY: deploy-base-relayer
deploy-base-relayer:
	solana program deploy --url $(RPC_URL) --keypair $(DEPLOYER_KEYPAIR_PATH) --program-id $(BASE_RELAYER_PROGRAM_KEYPAIR_PATH) $(BASE_RELAYER_PROGRAM_BINARY_PATH)
