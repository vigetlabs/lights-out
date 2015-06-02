#!/usr/bin/env node

require("babel/polyfill")

const masks = [
  null,
  0b110100000,
  0b111010000,
  0b011001000,
  0b100110100,
  0b010111010,
  0b001011001,
  0b000100110,
  0b000010111,
  0b000001011
]

const board = parseInt(process.argv[2], 2)

let combinations = function(length) {
  if (length == 0) {
    return [[]] 
  } else {
    let collection = []

    for (let combo of combinations(length - 1)) {
      let last = combo.reverse()[0] || 0

      for (let move = last + 1; move < 10; move++) {
        collection.push(combo.concat(move))
      }
    }

    return collection
  }
}

for (let len = 0; len < 10; len++) {
  for (let combo of combinations(len)) {
    if (combo.reduce((result, move) => result ^ masks[move], board) == 0) {
      console.log(combo.join(""))
      process.exit 
    }
  }
}
