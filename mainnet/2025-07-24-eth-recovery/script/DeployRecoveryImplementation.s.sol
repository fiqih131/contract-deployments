// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Script, console} from "forge-std/Script.sol";

import {Recovery} from "@base-contracts/src/recovery/Recovery.sol";

contract DeployRecoveryImplementation is Script {
    address internal INCIDENT_MULTISIG;

    function setUp() public {
        INCIDENT_MULTISIG = vm.envAddress("INCIDENT_MULTISIG");
    }

    Recovery recoveryImpl;

    function run() public {
        vm.startBroadcast();
        recoveryImpl = new Recovery(INCIDENT_MULTISIG);
        console.log("Recovery implementation deployed at: ", address(recoveryImpl));
        vm.stopBroadcast();

        _postCheck();
    }

    function _postCheck() internal view {
        require(recoveryImpl.OWNER() == INCIDENT_MULTISIG, "Incorrect OWNER");
    }
}
