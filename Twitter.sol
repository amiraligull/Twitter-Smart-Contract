// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;



//  Create a Twitter Contract 
contract twitterContract{

//  Create a mapping between user and tweet 
    mapping (address => string[]) public tweet;

//  Add function to create a tweet and save it in mapping
function CreateTweet(string memory _tweet) public {
    tweet[msg.sender].push(_tweet);
}

//  Create a function to get a Tweet 
function GetTweets(address _owner, uint i) public view returns(string memory){
    return tweet[_owner][i];
}

// get all tweets
function GetAllTweets(address _owner) public view returns (string[] memory){
    return tweet[_owner];
}





    
}