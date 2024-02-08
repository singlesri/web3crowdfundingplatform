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

    function createCampaign(address _owner, string memory _title, string memory _description, uint256 _target, uint256 _deadline, string memory _image) public returns (uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];

        require(campaign.deadline < block.timestamp, "The deadline should be a date in the future.")

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.targe = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaing.image = _image;

        numberOfCampaigns++;

        return numberOcCampaigns -1;
    }

    function donaToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;

        Campaign stoage campaign = campaigns[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent,) = payable(campaign.owner).call{value: amount}("");

        if(sent) {
            campaing.amountCollected = campaign.amountCollected + amount;
        }
    }

    function getDonators(uint256 _id) view public returns (address[] memory, uint256[] memory)  {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() pubic view return (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns); 

        for(uint i =; i < numberOfCampaigns; i++) {
            Campaign storage item = Campaigns[i];

            allCampaigns[i] = item;
        }

        return allCampaigns;
    }
}