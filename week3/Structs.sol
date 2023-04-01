// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {

    /*
    struct
      - struct可定義自己的型別，組織客製化的欄位
      - 可於contract外宣告，或在其他contract中import
    */

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // 三種初始化struct的方法
        Car memory toyota = Car("Toyota", 1990, msg.sender);                           // 直接給值，但有順序性
        Car memory lambo = Car({model: "Lamborghini", year: 1980, owner: msg.sender}); // key-value給值，順序無限制
        Car memory tesla;                                                              // 初始不給值，則所有欄位都是Default Value
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));
        
        Car storage _car = cars[0];
        _car.year = 1999;   // 重新賦值
        delete _car.owner;  // 讓cars[0]的owner欄位恢復初始值
        delete cars[1];     // 讓cars[1]的所有欄位恢復初始值
    }
}