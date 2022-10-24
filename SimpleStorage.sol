// declare the solidity version
// ^ : or above , >=0.8.7 < 0.9.0
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//EVM >> Ethereum Virtual Machine

// think of a contract like a class in js
contract SimpleStorage {
    // the default viisbility is internal
    uint256 FavoriteNumber;

    // People type
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // create object from type People
    People public person = People({favoriteNumber: 22, name: "Rahmon"});

    // array of people type
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        FavoriteNumber = _favoriteNumber;
    }

    // view,pure functions, when cakked alone don't send gas.
    // you can't update the blockchain in view
    function retrieve() public view returns (uint256) {
        return FavoriteNumber;
    }

    // calldata , memory, storage
    function addPerson(string memory _name, uint256 _number) public {
        // add new person to people array
        people.push(People({name: _name, favoriteNumber: _number}));
        // add new person to mapping
        nameToFavoriteNumber[_name] = _number;
    }

    // mapping like a dictionary in C# (where a key is mapped to a single value)
    mapping(string => uint256) public nameToFavoriteNumber;
}

// current contract address
// 0xd9145CCE52D386f254917e481eB44e9943F39138
