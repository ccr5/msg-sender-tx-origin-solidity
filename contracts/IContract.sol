// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface IContract {

    function getMsgSender() external view returns (address);

    function getTxOrigin() external view returns (address);   
}