
// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.5.15 ;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/IERC20.sol";
import "tokenx.sol";
// import "@openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
// import "atokeninter.sol";
 // import "ILendingPool.sol";
 // import "ILendingPoolAddressesProvider.sol";
import "https://github.com/dhruvluci/aave-protocol/blob/master/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/dhruvluci/aave-protocol/blob/master/contracts/lendingpool/LendingPool.sol";

// This is the main building block for smart contracts.
contract Token2 {
    // Some string type variables to identify the token.
    string public name = "Reputation - DAI";
    string public symbol = "rpDAI";
    address payable admin;


    // The fixed amount of tokens stored in an unsigned integer type variable.
    uint256 public totalSupply = 100000000;

    // An address type variable is used to store ethereum accounts.
    address public owner;
    /// Retrieve LendingPool address
    LendingPoolAddressesProvider provider = LendingPoolAddressesProvider(address(0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5)); // Kovan address, for other addresses: https://docs.aave.com/developers/developing-on-aave/deployed-contract-instances
    LendingPool lendingPool = LendingPool(provider.getLendingPool());
    
    /// Input variables
    address daiAddress = address(0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD); //kovan dai reserves
    address ethAddress = address(0x5c94e75316CAD5f5e0eF2E8A460Bd4aBAd6222Ee); // kovan eth
    uint256 amount2 = 1000 * 1e18;
    
    /// 1 is stable rate, 2 is variable rate
    uint256 variableRate = 2;
    uint16 referral = 0;
    
    /// Borrow method call
    
    address public addFR;
    function setAddressB(address _addB) external {
        addFR = _addB;
        
    }
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
    function release_interest(address payable to, uint256 amount) external {
        // Check if the transaction sender has enough tokens.
        // If `require`'s first argument evaluates to `false` then the
        // transaction will revert.
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // We can print messages and values using console.log
        
        // Callee c = Token('bzz-raw://b58847e3491e4a25b6aa6084503ba8d3fdf584c217796b974f0b9d2b6238759c.');
        // bal = c.getValue(1000000);
        // Transfer the amount.
        uint256 a2 = amount;
        uint256 a3 = sqrt(amount);
        address addB = 0x50b7460F8666CaA050ee8B2c6C1Bc49174ba5065;
        uint256 ttlinterest = this.balanceOf2(address(this));
        uint256 releasedinterest = amount;
        uint256 frpBal = this.FRPbalance(to);
        //uint256 ttlfrp = this.f(to);
        uint256 ttlfrp = 100;
        uint256 interestshare = (frpBal*releasedinterest)/ttlfrp;
        
        balances[msg.sender] -= interestshare;
        balances[to] += frpBal;
        // totalSupply -= interestshare;
        // balances[to] += a3;
    }

    /**
     * Read only function to retrieve the token balance of a given account.
     *
     * The `view` modifier indicates that it doesn't modify the contract's
     * state, which allows us to call it without executing a transaction.
     */
    function FRPbalance(address payable account) external view returns (uint256) {
        address addB = 0x6f7d741C1A5763342ce60deb29CF27Dbc4450847;
        Token c = Token(addB);
        uint256 frpBal = c.balanceOf(account);
        // uint256 frpBal = 10;
        return frpBal;
        
    }
    
    function depositDAI(address payable account, uint16 amount) external returns (uint256) {
        // address payable lPool = 0x5c94e75316CAD5f5e0eF2E8A460Bd4aBAd6222Ee;
        // LendingPool c = LendingPool(lPool);
        uint256 amount3 = 1000;
        IERC20(account).approve(provider.getLendingPoolCore(), amount);
        // Deposit 1000 DAI
        lendingPool.deposit(account, amount, referral);
        // lendingPool.borrow(ethAddress, amount, variableRate);
        // c.deposit(lPool, 20);
        //uint256 l = c.getReserveData(lPool)[0];
        return amount;
    }
    
    // Token c = new Token();
    // function f(address payable _add) external view returns (uint) {
        //return c.totalSupply();}
    
    function balanceOf2(address account) external view returns (uint256) {
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


