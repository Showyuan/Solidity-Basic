// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Ownable {

    /*
    Ownable
      - ownable 的應用在合約中很常見，結合了前面的基本概念，旨在限制特定 function 只能被合約的 owner 使用
    */
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    // 只有合約擁有者可以修改 owner
    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    // 只有合約擁有者使用 onlyOwnerCanCallThisFunc()
    function onlyOwnerCanCallThisFunc() external onlyOwner {}

    // 任何人都可以使用 anyOneCanCall()
    function anyOneCanCall() external {}
}