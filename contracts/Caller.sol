// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "contracts/IContract.sol";

contract Caller {
    address private _contr;
    
    constructor(address contr_) {
        _contr = contr_;
    }

    function callContract(string memory value) public view returns(address) {
        if (keccak256(abi.encodePacked(value)) == keccak256(abi.encodePacked("sender"))) {
            return IContract(_contr).getMsgSender();
        } else {
            return IContract(_contr).getTxOrigin();
        }
    }

}