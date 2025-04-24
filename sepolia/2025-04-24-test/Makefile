include ../../Makefile
include ../.env
include .env

L1_RPC_URL = $(L2_RPC_URL)

ifndef LEDGER_ACCOUNT
override LEDGER_ACCOUNT = 2
endif

.PHONY: sign-cb
sign-cb:
	$(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "sign(address[])" [$(CB_SIGNER_SAFE),$(COORDINATOR_SAFE_ADDR)]

.PHONY: sign-sc
sign-sc:
	$(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "sign(address[])" [$(SC_SIGNER_SAFE),$(COORDINATOR_SAFE_ADDR)]

.PHONY: sign-op
sign-op:
	$(GOPATH)/bin/eip712sign --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" -- \
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "sign(address[])" [$(OP_SIGNER_SAFE)]

.PHONY: approve-cb
approve-cb:
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "approve(address[],bytes)" [$(CB_SIGNER_SAFE),$(COORDINATOR_SAFE_ADDR)] $(SIGNATURES) \
	--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --broadcast -vvvv

.PHONY: approve-sc
approve-sc:
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "approve(address[],bytes)" [$(SC_SIGNER_SAFE),$(COORDINATOR_SAFE_ADDR)] $(SIGNATURES) \
	--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --broadcast -vvvv

.PHONY: approve-op
approve-op:
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "approve(address[],bytes)" [$(OP_SIGNER_SAFE)] $(SIGNATURES) \
	--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --broadcast

.PHONY: approve-coordinator
approve-coordinator:
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "approve(address[],bytes)" [$(COORDINATOR_SAFE_ADDR)] 0x \
	--ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --broadcast -vvvv

.PHONY: execute
execute:
	forge script --rpc-url $(L1_RPC_URL) UpgradeDGF \
	--sig "run(bytes)" 0x --ledger --hd-paths "m/44'/60'/$(LEDGER_ACCOUNT)'/0/0" --broadcast
