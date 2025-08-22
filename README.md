# Foundry Upgrades - Smart Contract Upgradeability Demo

A comprehensive demonstration of smart contract upgradeability patterns using Foundry, featuring UUPS (Universal Upgradeable Proxy Standard) and custom proxy implementations.

## 🚀 Features

### Core Smart Contracts
- **BoxV1**: Initial implementation with basic number storage and retrieval
- **BoxV2**: Upgraded implementation adding number setting functionality
- **SmallProxy**: Custom proxy implementation with storage slot management

### Upgradeability Patterns
- **UUPS (Universal Upgradeable Proxy Standard)**: Modern, gas-efficient upgradeability pattern
- **ERC1967 Proxy**: Standard proxy implementation for upgradeable contracts
- **Storage Layout Preservation**: Maintains state across upgrades
- **Access Control**: Owner-based upgrade authorization

### Development Tools
- **Foundry Framework**: Modern Solidity development environment
- **Automated Testing**: Comprehensive test suite for deployment and upgrades
- **Deployment Scripts**: Automated deployment and upgrade processes
- **DevOps Integration**: Cyfrin DevOps tools for deployment management

## 🏗️ Architecture

### Contract Structure
```
BoxV1 (Implementation) ← ERC1967Proxy (Proxy) ← User Interactions
     ↓
BoxV2 (Upgraded Implementation) ← Same Proxy (State Preserved)
```

### Key Components
1. **Implementation Contracts**: Business logic that can be upgraded
2. **Proxy Contract**: Points to current implementation, preserves storage
3. **Upgrade Logic**: UUPS pattern for controlled upgrades
4. **Storage Management**: EIP-1967 storage slots for implementation addresses

## 📁 Project Structure

```
foundry-upgrades/
├── src/                          # Smart contract source code
│   ├── BoxV1.sol                # Initial implementation
│   ├── BoxV2.sol                # Upgraded implementation
│   └── SmallProxy.sol           # Custom proxy implementation
├── script/                       # Deployment and upgrade scripts
│   ├── DeployBox.s.sol          # Initial deployment script
│   └── UpgradeBox.s.sol         # Upgrade script
├── test/                         # Test files
│   └── DeployAndUpgradeTest.t.sol # Comprehensive test suite
├── broadcast/                    # Deployment artifacts
├── foundry.toml                 # Foundry configuration
└── Makefile                     # Build and deployment commands
```

## 🛠️ Installation & Setup

### Prerequisites
- [Foundry](https://getfoundry.sh/) installed
- Node.js and npm (for additional tooling)

### Setup Commands
```bash
# Clone the repository
git clone <repository-url>
cd foundry-upgrades

# Install dependencies
make install

# Set up environment variables (copy .env.example if available)
cp .env.example .env
# Edit .env with your configuration
```

## 🚀 Usage

### Local Development
```bash
# Start local Anvil node
anvil

# Deploy BoxV1
make deploy

# Upgrade to BoxV2
make upgrade
```

### Testnet Deployment (Sepolia)
```bash
# Deploy to Sepolia
make deploy ARGS="--network sepolia"

# Upgrade on Sepolia
make upgrade ARGS="--network sepolia"
```

### Testing
```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -vvv

# Run specific test
forge test --match-test testUpgrades
```

## 🔧 Smart Contract Details

### BoxV1 (Initial Implementation)
- **Storage**: `uint256 number` - stores a number value
- **Functions**: 
  - `getNumber()` - retrieves stored number
  - `version()` - returns contract version (1)
- **Features**: UUPS upgradeable, Ownable access control

### BoxV2 (Upgraded Implementation)
- **Storage**: Same as BoxV1 (preserved across upgrade)
- **Functions**:
  - `setNumber(uint256)` - sets the number value
  - `getNumber()` - retrieves stored number
  - `version()` - returns contract version (2)
- **Features**: Enhanced functionality while maintaining storage layout

### SmallProxy (Custom Implementation)
- **Features**: 
  - Custom storage slot management
  - Implementation switching capability
  - Helper functions for data encoding
  - Storage reading utilities

## 🔒 Security Features

- **UUPS Pattern**: Gas-efficient upgradeability
- **Access Control**: Only owner can perform upgrades
- **Storage Isolation**: Implementation and proxy storage separation
- **Initialization Protection**: Prevents re-initialization attacks

## 📊 Testing

The project includes comprehensive tests covering:
- Initial deployment verification
- Upgrade functionality validation
- Storage preservation across upgrades
- Function availability before and after upgrades

## 🚀 Deployment Workflow

1. **Initial Deployment**: Deploy BoxV1 implementation and ERC1967Proxy
2. **Contract Interaction**: Users interact with the proxy address
3. **Upgrade Process**: Deploy BoxV2 and update proxy implementation
4. **State Preservation**: All storage and user data maintained
5. **Enhanced Functionality**: New features available immediately

## 🔍 Key Benefits

- **Upgradeability**: Modify contract logic without losing state
- **Gas Efficiency**: UUPS pattern minimizes gas costs
- **Security**: Controlled upgrade process with access controls
- **Flexibility**: Easy to add new features and fix bugs
- **Standards Compliance**: Follows EIP-1967 and UUPS standards

## 📚 Learning Resources

This project demonstrates:
- Smart contract upgradeability patterns
- Proxy contract implementations
- Foundry development workflow
- Testing upgradeable contracts
- Deployment automation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details

## ⚠️ Disclaimer

This is a demonstration project for educational purposes. Always audit smart contracts before deploying to mainnet and follow security best practices.
