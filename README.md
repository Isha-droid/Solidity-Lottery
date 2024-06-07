# Lottery Smart Contract

This repository contains a smart contract for a simple lottery system written in Solidity. The contract allows participants to enter the lottery by sending 1 ether. Once there are at least three participants, the manager can select a winner who receives the entire balance of the contract.

## Contract Details

### Manager
The manager is the address that deploys the contract. Only the manager has the authority to call certain functions like `getBalance` and `selectWinner`.

### Participants
Participants enter the lottery by sending exactly 1 ether to the contract. Their addresses are stored in an array.

### Functions

- **receive()**: This function allows participants to enter the lottery by sending 1 ether.
- **getBalance()**: Returns the balance of the contract. Only callable by the manager.
- **random()**: Generates a pseudo-random number based on block data and the number of participants.
- **selectWinner()**: Selects a random winner from the participants and transfers the contract balance to the winner. Only callable by the manager and requires at least 3 participants.

## Deployment

To deploy this contract, you can use Remix IDE or any other Ethereum development environment.

### Using Remix IDE

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file named `Lottery.sol` and paste the contract code into the file.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract:
   - Ensure you have selected the right environment (e.g., JavaScript VM, Injected Web3).
   - Click on the "Deploy" button under the "Deploy & Run Transactions" tab.


## Interacting with the Contract

### Entering the Lottery

To enter the lottery, send exactly 1 ether to the contract address. This can be done via a transaction or through a script.

### Checking Balance

The manager can check the contract balance by calling the `getBalance` function.

### Selecting a Winner

Once there are at least three participants, the manager can call the `selectWinner` function to choose a winner and transfer the balance.
