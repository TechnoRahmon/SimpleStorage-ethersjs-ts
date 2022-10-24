// const ethers = require("ethers");
// const fs = require("fs-extra");
// require("dotenv").config();

import {ethers} from 'ethers'
import dotenv from 'dotenv'
dotenv.config();
import * as fs from 'fs-extra';

async function main() {
  // create a new wallet with the raw private key in the .env
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY!);
  // to encrypt pass > Private key and password
  const encryptedJsonKey = await wallet.encrypt(
    process.env.PRIVATE_KEY_PASSWORD!,
    process.env.PRIVATE_KEY!
    
  );
  console.log(encryptedJsonKey);
  // save the encrypted json key in a josn file
  fs.writeFileSync("./.encryptedKey.json", encryptedJsonKey);
}

main()
  .then(() => {
    console.log("deployment Done!");
    process.exit(0);
  })
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
