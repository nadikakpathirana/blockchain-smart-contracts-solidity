//SPDX-License-Identifier: MIT    //this license make it opensource

// pragma solidity >=0.6.0 <0.9.0 give range of verisons
pragma solidity 0.6.0; // give exact value

contract SimpleStorage {

    // uint256 favouriteNumber = 5;
    // bool favouriteBool = false;
    // string favouriteString = "String";
    // address favouriteAddress = 0xd46B99E6686cE9fd7012De07cb02aC5B606e3c94; // eath address object
    // bytes32 favouriteBytes = "cat";

    uint256 favouriteNumber; //initialized into 0

    // adding new types
    struct People{
        uint256 favouriteNumber;
        string name;
    }

    // People public person = People({favouriteNumber:2, name:"nadika"});

    People[] public people;

    // mapping - a dictionary like data structure with one value per key
    mapping(string => uint256) public nameToFavouriteNumber;


    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    // view and pure are non state changing functions
    // public variables are automatically view functions

    // just return the attrubute values and no state changes
    function retrieveView() public view returns(uint256){
        return favouriteNumber;
    }

    //purely doing mathemetical operations without include saving and no state changes
    //cannot read attribuites
    function retrievePure() public pure returns(uint256){
        return 1 + 1;
    }

    // memory - data will only be stored in execution of the function
    // sorage - keep it forever
    function addPerson(string memory _name, uint256 _favouriteNumber) public{
        people.push(People({name:_name, favouriteNumber:_favouriteNumber})); // or can People({_name, _favouriteNumber}));

        //mapping
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
  
}