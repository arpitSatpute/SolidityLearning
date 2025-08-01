
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ENS {
   
   struct Person {
    string name;
    uint age;
    address addr;
   }

   mapping(address => Person) public persons;


   function setPerson(string memory _name, uint _age) public {
    persons[msg.sender] = Person({
        name: _name,
        age: _age,
        addr: msg.sender
    });
   }

   function getPerson() public view returns(string memory, uint, address) {
        Person memory person = persons[msg.sender];
        return(person.name, person.age, person.addr);
   }

}