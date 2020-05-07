import React from "react";

export function NoTokensMessage({ selectedAddress }) {
  return (
    <>
      <p>You don't have any Fermi Rep!</p>
      <p>
        Please request any Fermion member for a reference token on Twiiter, Github, Discord or Telegram.
        For the Testnet, you can get some Fermi Rep- open a temrinal in the root of the repository and run: 
        <br />
        <br />
        <code>npx buidler --network localhost faucet {selectedAddress}</code>
      </p>
    </>
  );
}
