# Validation

This document can be used to validate the inputs and result of the execution of `sign-mock-op-nested-coordinator` command.

> [!NOTE]
>
> This document provides names for each contract address to add clarity to what you are seeing. These names will not be visible in the Tenderly UI. All that matters is that addresses and storage slot hex values match exactly what is presented in this document.

The steps are:

1. [Validate the Domain and Message Hashes](#expected-domain-and-message-hashes)
2. [Verifying the state changes](#state-changes)

## Expected Domain and Message Hashes

First, we need to validate the domain and message hashes. These values should match both the values on your ledger and the values printed to the terminal when you run the task.

> [!CAUTION]
>
> Before signing, ensure the below hashes match what is on your ledger.
>
> ### Signer Safe B - Sepolia: `0x6AF0674791925f767060Dd52f7fB20984E8639d8`
>
> - Domain Hash: `0x6f25427e79742a1eb82c103e2bf43c85fc59509274ec258ad6ed841c4a0048aa`
> - Message Hash: `0x045d0b9218de12ebac06b5e3d9525e5874502e7fb8112fc89e8fe31ccddbfcdc`

# State Validations

For each contract listed in the state diff, please verify that no contracts or state changes shown in the Tenderly diff are missing from this document. Additionally, please verify that for each contract:

- The following state changes (and none others) are made to that contract. This validates that no unexpected state changes occur.
- All key values match the semantic meaning provided, which can be validated using the terminal commands provided.

## State Overrides

### System Config Owner - Sepolia (`0x0fe884546476dDd290eC46318785046ef68a0BA9`)

- **Key**: `0x0000000000000000000000000000000000000000000000000000000000000004` <br/>
  **Override**: `0x0000000000000000000000000000000000000000000000000000000000000001` <br/>
  **Meaning**: Override the threshold to 1 so the transaction simulation can occur.

### CB Coordinator - Sepolia (`0x646132A1667ca7aD00d36616AFBA1A28116C770A`)

- **Key**: `0x0000000000000000000000000000000000000000000000000000000000000004` <br/>
  **Override**: `0x0000000000000000000000000000000000000000000000000000000000000001` <br/>
  **Meaning**: Override the threshold to 1 so the transaction simulation can occur.

### Mock OP Nested - Sepolia (`0x6AF0674791925f767060Dd52f7fB20984E8639d8`)

- **Key**: `0xb618f98879564a13109bb900c8525ca0a429e7cf7aa57a30cfa8d3f5ac855c57` <br/>
  **Override**: `0x0000000000000000000000000000000000000000000000000000000000000001` <br/>
  **Meaning**: Simulates an approval from msg.sender in order for the task simulation to succeed. Note: The `Key` might be different as it corresponds to the slot associated [with your signer address](https://github.com/safe-global/safe-smart-account/blob/main/contracts/Safe.sol#L69).
  
## Task State Changes

### System Config Owner - Sepolia (`0x0fe884546476dDd290eC46318785046ef68a0BA9`)

0. **Key**: `0x0000000000000000000000000000000000000000000000000000000000000005` <br/>
   **Before**: `0x0000000000000000000000000000000000000000000000000000000000000018` <br/>
   **After**: `0x0000000000000000000000000000000000000000000000000000000000000019` <br/>
   **Value Type**: uint256 <br/>
   **Decoded Old Value**: `24` <br/>
   **Decoded New Value**: `25` <br/>
   **Meaning**: Increments the nonce <br/>

1. **Key**: `0x0ab04dcd93b34d974e4a895b9972e3c9b938914bd6ddf57b279a2c1c0522ebd6` <br/>
   **Before**: `0x0000000000000000000000000000000000000000000000000000000000000000` <br/>
   **After**: `0x0000000000000000000000000000000000000000000000000000000000000001` <br/>
   **Value Type**: uint256 <br/>
   **Decoded Old Value**: `0` <br/>
   **Decoded New Value**: `1` <br/>
   **Meaning**: Sets `approvedHashes[0x646132a1667ca7ad00d36616afba1a28116c770a][0xf9305e8c9fa5c8950e42f31f4d6a857734a7093d161a4d925d4de6fd4927126b]` to `1`. <br/>

### CB Coordinator - Sepolia (`0x646132A1667ca7aD00d36616AFBA1A28116C770A`)

2. **Key**: `0x0000000000000000000000000000000000000000000000000000000000000005` <br/>
   **Before**: `0x0000000000000000000000000000000000000000000000000000000000000007` <br/>
   **After**: `0x0000000000000000000000000000000000000000000000000000000000000008` <br/>
   **Value Type**: uint256 <br/>
   **Decoded Old Value**: `7` <br/>
   **Decoded New Value**: `8` <br/>
   **Meaning**: Increments the nonce <br/>

3. **Key**: `0xa5e0c8f651d5911ca966851eba701059c20483916806d16d6f7fafe6efee8617` <br/>
   **Before**: `0x0000000000000000000000000000000000000000000000000000000000000000` <br/>
   **After**: `0x0000000000000000000000000000000000000000000000000000000000000001` <br/>
   **Value Type**: uint256 <br/>
   **Decoded Old Value**: `0` <br/>
   **Decoded New Value**: `1` <br/>
   **Meaning**: Sets `approvedHashes[0x6af0674791925f767060dd52f7fb20984e8639d8][0x44a463f3e5253d8d2eb81f2d833cb99de9f8836f015c8f28a6cbf4063cb82b2c]` to `1`. <br/>

### Mock OP Nested - Sepolia (`0x6AF0674791925f767060Dd52f7fB20984E8639d8`)

4. **Key**: `0x0000000000000000000000000000000000000000000000000000000000000005` <br/>
   **Before**: `0x000000000000000000000000000000000000000000000000000000000000000a` <br/>
   **After**: `0x000000000000000000000000000000000000000000000000000000000000000b` <br/>
   **Value Type**: uint256 <br/>
   **Decoded Old Value**: `10` <br/>
   **Decoded New Value**: `11` <br/>
   **Meaning**: Increments the nonce <br/>

### System Config - Sepolia (`0xf272670eb55e895584501d564AfEB048bEd26194`)

5. **Key**: `0x000000000000000000000000000000000000000000000000000000000000006a` <br/>
   **Before**: `0x0000000000000000000000000000000000000000000000000000000400000032` <br/>
   **After**: `0x0000000000000000000000000000000000000000000000000000000300000032` <br/>
   **Value Type**: (uint32,uint32,uint32,uint32) <br/>
   **Decoded Old Value**: operatorFeeConstant: `0`, operatorFeeScalar: `0`, eip1559Elasticity: `4`, eip1559Denominator: `50` <br/>
   **Decoded New Value**: operatorFeeConstant: `0`, operatorFeeScalar: `0`, eip1559Elasticity: `3`, eip1559Denominator: `50` <br/>
   **Meaning**: Sets the eip1559Denominator to 50 <br/>

### Your Signer Address

- Nonce increment

You can now navigate back to the [README](../README.md#43-extract-the-domain-hash-and-the-message-hash-to-approve) to continue the signing process.
