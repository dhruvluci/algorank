// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.5.15;

// We import this library to be able to use console.log
// import "@nomiclabs/buidler/console.sol";
import "./ERC900BasicStakeContract.sol";
import "./ERC900a.sol";
import "./erc20a.sol";

// This is the main building block for smart contracts.
contract Token {
    // Some string type variables to identify the token.
    string public name = "Dolphin Points";
    string public symbol = "DP";

    // The fixed amount of tokens stored in an unsigned integer type variable.
    uint256 public totalSupply = 1000000;

    // An address type variable is used to store ethereum accounts.
    address public owner;
    address payable admin;
    // A mapping is a key/value map. Here we store each account balance.
    mapping(address => uint256) balances;

    /**
     * Contract initialization.
     *
     * The `constructor` is executed only once when the contract is created.
     * The `public` modifier makes a function callable from outside the contract.
     */
    constructor() public {
        // The totalSupply is assigned to transaction sender, which is the account
        // that is deploying the contract.
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    /**
     * A function to transfer tokens.
     *
     * The `external` modifier makes a function *only* callable from outside
     * the contract.
     */
    function sqrt(uint x) public returns (uint y)  {
    uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
        y = z;
        z = (x / z + z) / 2;
    }
    }
    
    function mint(address payable algo_address) internal {
        uint256 ocean_staked = ERC900.totalStakedFor(algo_address);
        uint256 num_stakeholders = ERC900.getPersonalStakeActualAmounts(algo_address).legnth;
        uint256 Dolphin_Score = sqrt(ocean_staked)*num_stakeholders;
        balances[algo_address] = Dolphin_Score;
    }
    
    
    function transfer(address payable to, uint256 amount) external {
        // Check if the transaction sender has enough tokens.
        // If `require`'s first argument evaluates to `false` then the
        // transaction will revert.
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // We can print messages and values using console.log
        
        // Transfer the amount.
        uint256 a2 = amount;
        uint256 a3 = sqrt(amount);
        // balances[msg.sender] -= a2;
        balances[to] += a3;
        totalSupply += a3;
        // balances[to] += a3;


    }

    /**
     * Read only function to retrieve the token balance of a given account.
     *
     * The `view` modifier indicates that it doesn't modify the contract's
     * state, which allows us to call it without executing a transaction.
     */
    function balanceOf(address payable account) external view returns (uint256) {
        return balances[account];
        
    }
        
    function mint(address to, uint256 amount) external {
        // Check if the transaction sender has enough tokens.
        // If `require`'s first argument evaluates to `false` then the
        // transaction will revert.
        // require(balances[msg.sender] >= amount, "Not enough tokens");

        // We can print messages and values using console.log
        

        // Transfer the amount.
        uint256 a2 = amount;
        uint256 a3 = sqrt(amount);
        // balances[msg.sender] -= a2;
        balances[to] += a3;
        totalSupply += a3;
        // balances[to] += a3;
    }
}



