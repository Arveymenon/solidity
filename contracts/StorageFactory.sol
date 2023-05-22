// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import './SimpleStorage.sol';


contract StorageFactory {
    SimpleStorage[] simpleStorageArray;

    function createContract() public {
        SimpleStorage simpleSContract = new SimpleStorage();
        simpleSContract.pushUser("Arvey",26, false);
        simpleSContract.pushUser("Subhojit", 26, false);
        simpleSContract.pushUser("Reema", 26, false);
        simpleSContract.pushUser("Thomas", 26, false);
        simpleStorageArray.push(simpleSContract);
    }

    function createBulkContract(uint count) public {
        for(uint i; i < count; i++){
            SimpleStorage simpleSContract = new SimpleStorage();
            simpleSContract.pushUser("Arvey",27, false);
            simpleSContract.pushUser("Subhojit", 27, false);
            simpleSContract.pushUser("Reema", 27, false);
            simpleSContract.pushUser("Thomas", 27, false);
            simpleStorageArray.push(new SimpleStorage());
        }
    }

    function getContract(uint _contractIndex) view public returns (SimpleStorage) {
        return simpleStorageArray[_contractIndex];
    }

    function getRandomNumber(uint _max) public view returns (uint) {
        uint random = uint(keccak256(abi.encodePacked(blockhash(block.number - 1))));
        return random % _max;
    }

    // Deployed contract for Sepolia
    // 0x503887CbD0180A3880c8230592621A6Eb282e36e
    // 0xecb24f1a4a418d62816dc65e52200f51816456bcc9967e08f36d32eb5d651522
}