import { expect } from "chai";
import { ethers } from "hardhat";
import { Caller } from "../typechain-types";

describe("Caller&Contract", function () {
  let contract: any
  let caller: Caller


  this.beforeEach(async () => {
    const Contract = await ethers.getContractFactory("Contract")
    contract = await Contract.deploy()

    const Caller = await ethers.getContractFactory("Caller")
    caller = await Caller.deploy(await contract.getAddress())
  })

  it("Should get the contract who called", async function () {
    const [_, add] = await ethers.getSigners()
    expect(await caller.connect(add).callContract("origin")).to.equal(add.address)
  });

  it("Should get the real caller ", async function () {
    const [_, add] = await ethers.getSigners()
    expect(await caller.connect(add).callContract("sender")).to.equal(await caller.getAddress())
  });
});
