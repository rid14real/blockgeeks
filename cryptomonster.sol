pragma solidity ^0.4.18;

import './ERC721BasicToken.sol';

contract CryptoMonster is ERC721BasicToken {

    struct Monster {
        string name;
        uint level;
        uint attackPower;
        uint defensePower;
    }

    Monster[] public monsters;
    address public owner;

    function CryptoMonster() public {
        owner = msg.sender;
    }

    function createMonster(string _name, address _to) public {
        require(msg.sender == owner);
        uint id = monsters.length;
        monsters.push(Monster(_name, 1, 100, 100));
        _mint(_to, id);
    }

    function battle(uint _monsterId, uint _targetId) onlyOwnerOf(_monsterId) public {
        Monster storage myMonster = monsters[_monsterId];
        Monster storage enemy = monsters[_targetId];

        if (myMonster.attackPower >= enemy.defensePower) {
            myMonster.level += 1;
            myMonster.attackPower += 10;
        } else {
            enemy.level += 1;
            enemy.defensePower += 10;
        }

    }

}
