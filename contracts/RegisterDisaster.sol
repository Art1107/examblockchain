// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RegisterDisaster {
    address public owner;
    struct Person {
        string idCard;
        string firstName;
        string lastName;
        string addr;
    }

    Person[] private people;
    mapping(string => uint256) private idToIndex;

    constructor() {
        owner = msg.sender;
    }

    function registerPerson(
        string memory _idCard,
        string memory _firstName,
        string memory _lastName,
        string memory _address
    ) public {
        require(bytes(_idCard).length > 0, "ID card is required");
        require(bytes(_firstName).length > 0, "First name is required");
        require(bytes(_lastName).length > 0, "Last name is required");
        require(bytes(_address).length > 0, "Address is required");
        require(idToIndex[_idCard] == 0, "Person already registered");

        Person memory newPerson = Person({
            idCard: _idCard,
            firstName: _firstName,
            lastName: _lastName,
            addr: _address
        });

        people.push(newPerson);
        idToIndex[_idCard] = people.length - 1;
    }

    function getAll() public view returns (Person[] memory) {
        return people;
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < people.length, "Index out of bounds");
        return people[index];
    }

    function getID(string memory _idCard) public view returns (Person memory) {
        uint256 index = idToIndex[_idCard];
        require(index < people.length, "Person not found");
        return people[index];
    }
}
