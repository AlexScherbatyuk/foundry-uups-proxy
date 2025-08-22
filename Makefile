include .env

install:; forge install forge install openzeppelin/openzeppelin-contracts-upgradeable && forge install @openzeppelin/openzeppelin-contracts && forge install foundry-rs/forge-std && forge install cyfrin/foundry-devops

NETWORK_ARGS := --rpc-url http://localhost:8545 --account defaultKey --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL)  --account devKey --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvvv
endif


deploy:; forge script script/DeployBox.s.sol:DeployBox $(NETWORK_ARGS)

upgrade:; forge script script/UpgradeBox.s.sol:UpgradeBox $(NETWORK_ARGS)


#cast call 0x110786d42F6eA4447886bd0d85E53A56f6bdA099 "getNumber()" --rpc-url $SEPOLIA_RPC_URL --account devKey
#cast send 0x110786d42F6eA4447886bd0d85E53A56f6bdA099 "setNumber(uint256)" 7 --rpc-url $SEPOLIA_RPC_URL --account devKey -vvvv
#cast call 0x110786d42F6eA4447886bd0d85E53A56f6bdA099 "getNumber()" --rpc-url $SEPOLIA_RPC_URL --account devKey
#cast --to-base 0x0000000000000000000000000000000000000000000000000000000000000007 dec