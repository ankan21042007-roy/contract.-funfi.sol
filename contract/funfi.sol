// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthOrDare {
    enum ChallengeType { Truth, Dare }

    struct Challenge {
        address challenger;
        address target;
        ChallengeType challengeType;
        string questionOrTask;
        bool completed;
    }

    Challenge[] public challenges;
    mapping(address => bool) public players;

    event PlayerJoined(address player);
    event ChallengeSent(uint indexed challengeId, address from, address to, ChallengeType challengeType, string content);
    event ChallengeCompleted(uint indexed challengeId, address player);

    // 🧩 Join the game
    function joinGame() public {
        require(!players[msg.sender], "You already joined");
        players[msg.sender] = true;
        emit PlayerJoined(msg.sender);
    }

    // 🎯 Send a Truth or Dare
    function sendChallenge(address _target, ChallengeType _type, string calldata _content) public {
        require(players[msg.sender], "Join first");
        require(players[_target], "Target must be a player");
        require(_target != msg.sender, "Cannot challenge yourself");

        challenges.push(Challenge({
            challenger: msg.sender,
            target: _target,
            challengeType: _type,
            questionOrTask: _content,
            completed: false
        }));

        emit ChallengeSent(challenges.length - 1, msg.sender, _target, _type, _content);
    }

    // ✅ Mark a challenge as completed
    function completeChallenge(uint _challengeId) public {
        Challenge storage c = challenges[_challengeId];
        require(msg.sender == c.target, "Only target can complete");
        require(!c.completed, "Already completed");

        c.completed = true;
        emit ChallengeCompleted(_challengeId, msg.sender);
    }

    // 🔍 Get total challenges
    function getChallengeCount() public view returns (uint) {
        return challenges.length;
    }
}
