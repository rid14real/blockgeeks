pragma solidity ^0.5.11;

contract Fall {
    // create our enum with fall and winter in it and create a current season varible, will be set to 0 -> fall
    enum Season {FALL, WINTER}
    Season public currentSeason; 
    
    bool public colorfulLeaves;
    // modifier that makes sure current season is the season we pass in 
    modifier inSeason(Season expectedSeason) {
        require(currentSeason == expectedSeason);
        _;
    }
    // If it is fall set colorful leaves to true, fail if it is not Fall
    function leavesChangingColor() external inSeason(Season.FALL) {
        colorfulLeaves = true;
    }
    // set fall to winter, leaves are no longer colorful 
    function fallToWinter() external {
        currentSeason = Season.WINTER;
        colorfulLeaves = false; 
    }
    // change season back to fall
    function winterToFall() external {
        currentSeason = Season.FALL;
    }
}
