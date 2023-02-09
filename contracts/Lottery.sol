// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Lottery {
    address public manager;
    address payable[] public participants;
    address payable public winner;

    constructor() {
        manager = msg.sender;
    }

    function sendEth() public payable {
        require(msg.value == 1 ether);
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint256) {
        require(msg.sender == manager, "Only manager can view it");
        return address(this).balance;
    }

    function WinnerRandom() internal view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        participants.length
                    )
                )
            );
    }

    function getWinner() public {
        require(msg.sender == manager, "Only the manager can view it");
        require(participants.length >= 3);
        uint256 index = WinnerRandom() % participants.length;
        winner = participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    }

    function allPlayers() public view returns (address payable[] memory) {
        return participants;
    }
}
