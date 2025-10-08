# Base Bridge Deployment

Deploys the Solana side of [Base Bridge](https://github.com/base/bridge). This is to be run before deploying the Base side.

## Deployment Steps

1. Install dependencies

```bash
cd solana/2025-10-07-base-bridge-deployment
make deps
```

2. Deploy the bridge program

```bash
make deploy-bridge
```

3. Deploy the base relayer program

```bash
make deploy-base-relayer
```
