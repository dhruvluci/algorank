# Fermion Social Rep Protocol

A Fermi is a decentralised, social credit scoring unit. It seeks to be an alternative to centralised credit scores that exzclude a majority of the population from access to fair credit. In times like the covid-19 crisis, it seeks to leverage the blockchain to enable 70% of the world to have access to credit. 

Fermion protocol relies on two fundamental units:
1. The Fermi token - used to express "Trust" for another user, by linking your own reputation score to theirs. Approved Users recieve 100 Fermi a day, which are burnt if not spent in 24hrs.
2. The Fermi score - This is a decentralised credit score comprising: 50% of a weighted sum of all your peers, and 50% of your own deposit and replayment history. All Fermi Users begin with a score of 250.

A person needs to recieve at least 10 Fermi from 2 different addresses to become an "Approved user". Once approved, a user straight away enjoys a borrowing limit of $10 and a savings interest rate of ~8%. These limits increase with an increasing Fermi Score.

Fundamentally, a Fermi is different from money. Sending Fermi has a unique impact: it creates a permanent link between your Fermi Score and the reciever's Fermi Score. This way, people will be incentivised to build up networks of trusted contacts globally, in a decentraalised waay. Credit can then effectively be provided to millions of such people at low risk.

-Send Fermi to trusted connections, and boost your Fermi Score
-Enjoy increased borrowing limits, lower borrowing interest (<15%), and higher savings interest (>9%) as your Fermi Score increases.

Fermi score can be built by recieving more Fermi from other people with high ratings. 

This project is intended to be used with Buidler.

## Quick start

The first things you need to do are cloning this repository and installing its
dependencies:

```sh
cd Fermion-0.12
npm install
```

Once installed, let's run Buidler's testing network:

```sh
npx buidler node
```

Then, on a new terminal, go to the repository's root folder and run this to
deploy your contract:

```sh
npx buidler run scripts/deploy.js --network localhost
```

Finally, we can run the frontend with:

```sh
cd frontend
npm install
npm start
```

Open [http://localhost:3000/](http://localhost:3000/) to see your Dapp. You will
need to have [Metamask](http://metamask.io) installed and listening to
`localhost 8545`.

## User Guide

- [Setting up Metamask](http://buidler.dev/tutorial/8-frontend/#setting-up-metamask)
- [Buidler's full documentation](https://buidler.dev/getting-started/)

For a complete introduction to Buidler, refer to [this guide](https://buidler.dev/getting-started/#overview).


## Feedback, help and news

We'd love to hear feedback on this proposal. Reach us on Twitter @Krredit, and gitcoin @dhruvluci.

