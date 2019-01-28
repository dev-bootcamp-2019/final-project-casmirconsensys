# Design Pattern Decisions #
  For my contract design all of the main application logic is in one main contract. I also implemented the Ownable.sol contract from Open Zepplin Solidity for contract ownership. The Existence.sol contract stores media and data for 1 "existence" on IPFS in JSON format. The hash of all this data is then stored on the blockchain along with a timestamp to prove the existence of the data at a given point in time. I used functions avaialble to query data if needed w/Circuit breaker logic was added to the function to store data on the blockchain. 

