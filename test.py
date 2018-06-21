# coding: utf-8

import binascii
from web3 import Web3,IPCProvider

def getPrice(address):
        return web3.fromWei(web3.eth.getBalance(address),"ether")

web3 = Web3(IPCProvider('../geth.ipc'))
coinbase_address = web3.eth.accounts[0]

price = getPrice(coinbase_address)
block = web3.eth.getBlock('latest')
print("hashrate: " + str(web3.eth.hashrate))
print("coinbase account wallet: " + str(price))
print("block number: " +  str(web3.eth.blockNumber))
for key in block:
        value = str(block[key])
        #print(type(value))
        #value = binascii.unhexlify(value)
        print(str(key) + ": " + str(value))

