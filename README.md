# algorank
CLR based algorank for $ocean

This is a deployment of smart contracts for staking $ocean tokens as votes in favour of different alorithims/datasets on https://commons.oceanprotocol.com We've developed a process to calculate inalienable reputation points (RP) for every algorithim and dataset, tied to their DID/Address. RP, unlike tokens, cannot be transferred; they can only be minted and burnt. Specifically, RP is minted everytime somebody stakes $ocean on an algorithim. RP is co-related with CLR, and thus both the magnitude and distribution of stakes are used to compute the final RP score.

For easy testing remix is recommended. 

A number of important functions have been implemented and are functional here:
-ERC900 token class for staking in favour of algorithims
-ERC1391 token class for inalienable reputation tokens
-Custom weights to compute RP based on $ocean stakes

The steps for staking in favour of any algorithim is as follows:

1. Users *Stake* $ocean : by calling Call stakeFor(_addr_) in the Erc900BasicStake where addr is the DID address of the algorithim
2. The reputation points (RP) of an algorithim are updated as follows:
root(Total Staked For algo) * (# Stakeholders for algo)
3. To check the AlgoRank Score (RP) of any Algo/Dataset, simply use the address component of the DID as follows:
address RP_contract = 
address algo_address = DID
RP_contract.balanceOf(algo_address)
4. Stakers can call unstake() to get their $ocean back. This will correspondingly reduct the RP of the algo.




