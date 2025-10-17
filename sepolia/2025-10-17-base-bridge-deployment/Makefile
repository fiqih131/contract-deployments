include ../../Makefile
include ../.env
include .env

.PHONY: deps
deps:
	forge install --no-git github.com/base/bridge@755dfb9f6da7e79582a8ba04a4d64b180ca2eae8

.PHONY: deploy
deploy:
	forge script DeployBridge --rpc-url $(L2_RPC_URL) \
	--sender $(shell cast wallet address --account testnet-admin) \
	--account testnet-admin --broadcast -vvvv
