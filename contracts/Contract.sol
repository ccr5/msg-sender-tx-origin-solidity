// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "contracts/IContract.sol";

contract Contract is IContract {
    
    constructor() { }

    function getMsgSender() public view returns (address) {
        return msg.sender;
    }

    function getTxOrigin() public view returns (address) {
        return tx.origin;
    }

}