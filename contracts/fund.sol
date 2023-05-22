// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Remember to switch environment to 'Sepolia fork' or any chain based on sepolia.
contract fundMe {

    address[] senders;
    
    function getContractVersion() public view returns (uint256){
        // BTC/USD
        // address : 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        AggregatorV3Interface agg = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        return agg.version();
    }

    // Eth price in dollars
    function priceFeed() public view returns (int) {
        AggregatorV3Interface agg = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);

        (,int price,,,) = agg.latestRoundData();
        
        return (price / 1e8);
    }

    function sendSomeFunds() public payable returns (int) {
        int price = this.priceFeed();
        senders.push(msg.sender);
        return int(msg.value / 1e18) * price;
    }

    function getSenders (uint _index) public view returns (address) {
        require(senders.length > _index, "Not a sender");
        return senders[_index];
    }
}