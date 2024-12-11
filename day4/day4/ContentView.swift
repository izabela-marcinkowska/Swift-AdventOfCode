//
//  ContentView.swift
//  day4
//
//  Created by Izabela Marcinkowska on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    @State private var allLetters: [[String]] = []
    @State private var amount: Int = 0
    var sequence = ["X", "M", "A", "S"]
    var sequenceBackwards = ["S", "A", "M", "X"]
    
    func getLetters() {
        print("Get the letters function started")
        if let textURL = Bundle.main.url(forResource: "day4", withExtension: "txt") {
            print("Do we have a file?")
            if let text = try? String(contentsOf: textURL, encoding: .utf8) {
                print("Do we have the text?")
                let lines = text.components(separatedBy: .newlines)
                    .filter {!$0.isEmpty}
                
                allLetters = lines.compactMap { line in
                    let letters = line.map { String($0) }
                    return letters
                }
                var amountInLine = wordInLine(arrayToCheck: allLetters, sequence: sequence)
                var amountInLineBackwards = wordInLine(arrayToCheck: allLetters, sequence: sequenceBackwards)
                var amountVertical = wordVerctical(arrayToCheck: allLetters, sequence: sequence)
                var amountVerticalBackwards = wordVerctical(arrayToCheck: allLetters, sequence: sequenceBackwards)
                print("Amount in line: \(amountInLine), amount in line backwards: \(amountInLineBackwards), amount vertical: \(amountVertical), amount vertical backwards: \(amountVerticalBackwards)")
                
            }
        }
    }
    
    func wordInLine(arrayToCheck: [[String]], sequence: [String]) -> Int {
        var total = 0
        // for every line in all letters
        for (lineIndex, line) in arrayToCheck.enumerated() {
            print("Checking line \(lineIndex), length: \(line.count)")
            // for every letter in the line
            for i in 0...(line.count - sequence.count) {
                // if a letter is equal to first letter in sequence
                if line[i] == sequence[0] {
                    var matches = true
                    // for every letter in the sequence
                    for j in 0..<sequence.count {
                        // if next letter is not the same as the next letter in sequence
                        if line[i + j] != sequence[j] {
                            matches = false
                            break
                        }
                    }
                    // if it is the same, add one
                    if matches {
                        print("Found \(sequence) at line \(lineIndex), position \(i)")
                        total += 1
                    }
                }
            }
        }
        print("total is \(total)")
        return total
    }
    
    func wordVerctical(arrayToCheck: [[String]], sequence: [String]) -> Int {
        var total = 0
        for lineIndex in 0...(arrayToCheck.count - sequence.count) {
            for position in 0..<arrayToCheck[lineIndex].count {
                if arrayToCheck[lineIndex][position] == sequence[0] {
                    var matches = true
                    for j in 0..<sequence.count {
                        if arrayToCheck[lineIndex + j][position] != sequence[j] {
                            matches = false
                            break
                        }
                    }
                    if matches {
                        print("Vertical: Found \(sequence) at line \(lineIndex), position \(position)")
                        total += 1
                    }
                }
            }
        }
        print("total is \(total)")
        return total
    }
        
    var body: some View {
        VStack {
            Button("click") {
                getLetters()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
