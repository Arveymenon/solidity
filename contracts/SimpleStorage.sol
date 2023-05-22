// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SimpleStorage {
    
    struct User{
        string name;
        uint age;
        bool isMastAadmi;
    }
    User[] public arr;
    mapping (string => User) users;

    function pushUser (string memory _name, uint _age, bool _isMastAadmi) public {
        User memory user = User(_name, _age, _isMastAadmi);
        arr.push(user);
        users[_name] = user;
    }

    function clearUsers() public {
        for(uint i = 0; i < arr.length; i++){
            delete users[arr[i].name];
        }
        delete arr;
    }

    function getMastAadmis() public view returns (User[] memory) {
        uint count = 0;
        for(uint i = 0; i < arr.length; i++)
            if(arr[i].isMastAadmi)
                count++;

        User[] memory mastAadmis = new User[](count);
        count = 0;

        for(uint i = 0; i < arr.length; i++)
            if (arr[i].isMastAadmi) {
                mastAadmis[count] = arr[i];
                count++;
            }

        return mastAadmis;
    }

    function getUser(string memory name) public view returns (User memory){
        return users[name];
    }

    function getUserArray() external view returns (User[] memory){
        return arr;
    }
}
// 0xCe82f2c99b41A00E7a48cfE92aC428EDAEaE4DB5
// 0x79ed43dA7a2b54a5648dA702A4b2ac859d9deFd7
// 0xeFab99E138554ba90005c6C1fE994C5C6A968427
// 0xeDc9eD42ea5706FD5F980033FE18826Ead446418

// Arvey, 26, false
// Subhojit, 26, false
// Reema, 26, false
// Arvey, 26, false