    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.3;
    // 1️⃣ Create a Twitter Contract 
    contract twitterContract{
    address owner;
    uint16  MAX_TWEET_LENGTH=280;
   // define tweet struct
    struct tweet{
        uint256 id;
        address author;
        string content;
        uint timestamp;
        uint likes;
    }

    // 2️⃣ Create a mapping between user and tweet 
    mapping (address => tweet[]) public tweets;

    constructor(){
        owner=msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender==owner, "yo bro you are  not owner!");
        _;
    }


    function ChangeTweetLenght(uint16 _Length) public OnlyOwner {
        MAX_TWEET_LENGTH=_Length;
    }

    // 3️⃣ Add function to create a tweet and save it in mapping
    function CreateTweet(string memory _tweet) public {
        
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "tweet is too long bro!");

        tweet memory newTweet= tweet({
            //this will make a unique id by using array lenght simple
            id:tweets[msg.sender].length,
            author : msg.sender,
            content : _tweet,
            timestamp : block.timestamp,
            likes :  0
        });
        tweets[msg.sender].push(newTweet);
    }

    function LikeTweet(uint id, address author)external {
        require(tweets[author][id].id == id, "tweet not found");
        tweets[author][id].likes++;
    }

    function UnLikeTweet(uint id, address author) external {
        require(tweets[author][id].id == id, "tweet not found");
        require(tweets[author][id].likes >0, "can not unlike tweet");
        tweets[author][id].likes--;
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