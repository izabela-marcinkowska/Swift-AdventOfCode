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
            }
        }
    }
    
    func wordInLine(arrayToCheck: [[String]], sequence: [String]) -> Int {
        var total = 0
        for (lineIndex, line) in allLetters.enumerated() {
            print("Checking line \(lineIndex), length: \(line.count)")
            for i in 0...(line.count - sequence.count) {
                
                if line[i] == sequence[0] {
                    var matches = true
                    for j in 0..<sequence.count {
                        if line[i + j] != sequence[j] {
                            matches = false
                            break
                        }
                    }
                    if matches {
                        print("Found XMAS at line \(lineIndex), position \(i)")
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
