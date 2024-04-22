    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.3;
    // 1️⃣ Create a Twitter Contract 
    contract twitterContract{
   
   // define tweet struct
    struct tweet{
        address author;
        string content;
        uint timestamp;
        uint likes;
    }

    // 2️⃣ Create a mapping between user and tweet 
        mapping (address => tweet[]) public tweets;

    // 3️⃣ Add function to create a tweet and save it in mapping
    function CreateTweet(string memory _tweet) public {
        tweet memory newTweet= tweet({
            author : msg.sender,
            content : _tweet,
            timestamp : block.timestamp,
            likes :  0
        });
        tweets[msg.sender].push(newTweet);
    }

    // 4️⃣ Create a function to get a Tweet 
    function GetTweets(address _owner, uint i) public view returns(tweet memory){
        return tweets[_owner][i];
    }

    // get all tweets
    function GetAllTweets(address _owner) public view returns (tweet[] memory){
        return tweets[_owner];
    }





        
    }