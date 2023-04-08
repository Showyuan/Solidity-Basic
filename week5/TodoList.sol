// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList_V1 {

    /*
    V1: 寫一個 Todo List 合約，並且寫下你的思考過程，以及過程中遇到的問題、如何解決
      - 定義一個 task struct，包含 name 以及 completed
      - 定義一個 create()，可以新增 task
      - 定義一個 update()，可以修改 task completed 狀態
      - 定義一個 get()，可以輸入 index，查詢 task name & completed 狀態
      - 定義一個 kill()，可以砍掉 contract
    消耗 gas : 773340
    */

    struct Task {
        string name;
        bool complete;
    }

    Task[] taskArray;
    address private owner;

    // 合約建立時先儲存owner
    constructor(){
        owner = msg.sender;
    }

    // 新增 task
    function create(string calldata _name) external returns (uint) {
        taskArray.push(Task(_name, false));
        return taskArray.length - 1;
    }

    // 修改 task completed 狀態
    function update(uint _index, bool _completed) external {
        taskArray[_index].complete = _completed;
    }

    // 輸入 index，查詢 task name & completed 狀態
    function get(uint _index) external view returns (Task memory){
        return taskArray[_index];
    }

    // 砍掉 contract
    function kill() external {
        require(owner == msg.sender, "Not authorized!");
        selfdestruct(payable(owner));
    }

}

contract TodoList_V2 {

    /*
    V2: 思考 access control，寫出不同版本
      - 如果只想自己用，可以怎麼預防別人呼叫？
    消耗 gas : 879744
    */

    struct Task {
        string name;
        bool complete;
    }

    Task[] taskArray;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    // 新增 modifier 來驗證是否為合約 owner 呼叫
    modifier isOwner() {
        require(msg.sender == owner, "Not authorized!");
        _;
    }

    function create(string calldata _name) isOwner external returns (uint) {
        taskArray.push(Task(_name, false));
        return taskArray.length - 1;
    }

    function update(uint _index, bool _completed) isOwner external{
        taskArray[_index].complete = _completed;
    }

    function get(uint _index) isOwner external view returns (Task memory){
        return taskArray[_index];
    }

    function kill() isOwner external {
        selfdestruct(payable(owner));
    }

}

contract TodoList_V3 {

    /*
    V3: 思考 access control，寫出不同版本
      - 如果要讓大家使用，每個人記錄自己的 task，可以怎麼設計？
    消耗 gas : 833194
    */

    struct Task {
        string name;
        bool complete;
    }

    // 將 array 改為 map 來記錄每一個地址各自擁有的 Task[]
    mapping(address => Task[]) taskMap;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    //  取消在每一個 function 使用 modifier isOwner()
    modifier isOwner() {
        require(msg.sender == owner, "Not authorized!");
        _;
    }

    function create(string calldata _name) external returns (uint) {
        taskMap[msg.sender].push(Task(_name, false));
        return taskMap[msg.sender].length - 1;
    }

    function update(uint _index, bool _completed) external{
        taskMap[msg.sender][_index].complete = _completed;
    }

    function get(uint _index) external view returns (Task memory){
        return taskMap[msg.sender][_index];
    }

    function kill() isOwner external {
        selfdestruct(payable(owner));
    }

}

contract TodoList_V4 {

    /*
    V4: 思考 access control，寫出不同版本
      - 觀察原本的 gas 消耗狀況，改寫成更省 gas 的版本
    消耗 gas : 639389
    */

    struct Task {
        string name;
        bool complete;
    }
    
    // 更改1: 將 task array 換成 name => Task 的 map，以便後續查詢
    mapping(address => mapping(string => Task)) taskMap;
    // 更改2: 將 owner 改為 immutable
    address private immutable OWNER;

    constructor(){
        OWNER = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == OWNER, "Not authorized!");
        _;
    }

    // 更改3: create task 時不回傳 index，user 直接使用 task name 進行查詢
    function create(string calldata _name) external {
        taskMap[msg.sender][_name] = Task(_name, false);
    }

    function update(string calldata _name, bool _completed) external{
        taskMap[msg.sender][_name].complete = _completed;
    }

    // 更改4: get task 時不回傳 Task，user 輸入 task name 後直接回傳 bool
    function get(string calldata _name) external view returns (bool complete){
        return taskMap[msg.sender][_name].complete;
    }

    function kill() isOwner external {
        selfdestruct(payable(OWNER));
    }

}