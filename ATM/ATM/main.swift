//
//  main.swift
//  ATM
//
//  Created by Marcelino Matias on 10/11/19.
//  Copyright © 2019 matias. All rights reserved.
//

import Foundation

print("ATM SIMULATOR\n")
print("What is your name?")

let name = readLine()

print("Wellcome \(name!)\n")
print("Notes available for withdrawal:")
print("2, 5, 10, 20, 50, 100\n")

print("Please enter the withdrawal amount and press enter:")

var amount = Int(readLine()!)!;

if( amount < 2  || (amount % 2 > 0 && amount % 5 > 0)){
    print("Invalid value for withdrawal at this ATM, please select another amount.")
    exit(0)
}

func withdrawal(amount: Int, note: Int) -> (Int, Int) {
    if(note > amount){
        return (0, amount)
    }
    let notes = Int(amount / note)
    return (notes, amount - (notes * note))
}

var notes = [2: 0, 5: 0, 10: 0, 20: 0, 50: 0, 100: 0]


for note in notes.keys.sorted(by: { $0 > $1 }) {
    (notes[note], amount) = withdrawal(amount: amount, note: note)
}

for note in notes.sorted(by: { $0 > $1 }) {
    if(note.value > 0){
        print("\(note.value) x  [_\(note.key)_]")
    }
}
