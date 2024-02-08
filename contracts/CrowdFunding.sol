// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 desadlin;
        uint256 amounCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    mapping(uint 256 => Campaign ) public campaigns;

    uint256 pubic numberOfCampaigns = 0;

    function createCampaign() {}

    function donaToCampaign() {}

    function getDonators() {}

    function getCampaigns() {}
}