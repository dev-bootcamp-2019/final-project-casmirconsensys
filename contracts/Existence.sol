pragma solidity ^0.5.0;

import "./Ownable.sol";

contract Existence is Ownable {
    mapping (address =>ExistenceOwner) existenceOwner;
    struct ExistenceOwner {
        uint totalExistences;
        mapping(uint => Existance) existences;
    }
    bool eStop;

    struct Existance{
        uint id;
        string hash;
        uint dateTimestamp;
    }

    event LogCreateExistence(address indexed _from, string _hash);

    constructor()  public{

        eStop = false;
    }

    modifier isStopped() {
        require(eStop != true);
        _;
     }


     function toggleEStop() public onlyOwner{
          eStop = !eStop;
     }


    function addExistence(string memory _existenceHash)  public isStopped{

        bytes memory inputLength = bytes(_existenceHash);
        require(inputLength.length == 46 );


        uint _totalExistences = existenceOwner[msg.sender].totalExistences;


        existenceOwner[msg.sender].existences[_totalExistences].hash = _existenceHash;
        existenceOwner[msg.sender].existences[_totalExistences].dateTimestamp= now;
        existenceOwner[msg.sender].totalExistences = _totalExistences + 1;
        emit LogCreateExistence(msg.sender, _existenceHash);
     }


     function getTotalExistences() public  view returns (uint totalExistences){
        return existenceOwner[msg.sender].totalExistences;
     }


     function getSingleExistanceHash(uint _id) public view returns (string memory _ipfsHash, uint dateTimestamp){
         return(
             existenceOwner[msg.sender].existences[_id].hash,
             existenceOwner[msg.sender].existences[_id].dateTimestamp
             );
     }

   }
