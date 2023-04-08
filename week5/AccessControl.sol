// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AccessControll {
    // 當有新的角色被建立時，寫進log中
    event GrantRole(bytes32 indexed role, address indexed account);
    // 當有新的角色被移除時，寫進log中
    event RevokeRole(bytes32 indexed role, address indexed account);

    // 管理role(bytes32)對應的address是否有權限(bool)的map
    mapping(bytes32 => mapping(address => bool)) public roles;

    // 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    // 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    // 確認msg.sender是否有對應的角色權限
    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorized");
        _;
    }

    // 合約建立時，部署合約者即有ADMIN權限
    constructor() {
        _grantRole(ADMIN, msg.sender);
    }

    // 供 constructor 呼叫的grantRole
    function _grantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    // 供外部呼叫的grantRole
    function grantRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        _grantRole(_role, _account);
    }

    // 供外部呼叫的revokeRole
    function revokeRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }
}