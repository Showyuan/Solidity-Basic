// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract ERC20 is IERC20 {

    // 合約持有之代幣的總供給量
    uint public totalSupply;

    // 該地址代幣持有的餘額
    mapping(address => uint) public balanceOf;
    
    // 某一個帳戶授權給另一個帳戶的代幣數量
    mapping(address => mapping(address => uint)) public allowance;

    // 設定名稱、幣種 ＆ 指定代幣會由多少個小數位分割
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    // 指定傳送的地址及轉帳金額
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // 授權對象地址，可以使用多少我的額度
    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // 授權某個人或另一份合約可使用的額度
    // *** transferFrom 中有這點可以改進，allowance[sender][msg.sender] 這邊可以加上 require 來確認 msg.sender 是否有足夠的 allowance 來 transfer
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        require(allowance[sender][msg.sender] >= amount, "Amount Not Enough!");
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    // 製造代幣
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // 銷毀代幣
    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}