// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PersonRegistry {
    
    uint256 public totalPeople;
    bool public isActive = true;
    address public owner;

    struct Person {
        string name;
        uint256 age;
        address wallet;
    }

    Person[] public people;
    mapping(address => uint256) public ageOf;

    constructor() {
        owner = msg.sender;
    }

    function addPerson(string memory _name, uint256 _age) public {
        Person memory newPerson = Person(_name, _age, msg.sender);
        people.push(newPerson);
        ageOf[msg.sender] = _age;
        totalPeople = totalPeople + 1;
    }
}
