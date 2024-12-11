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
            if let text = try? String(contentsOf: textURL, encoding: .utf8) {
                let lines = text.components(separatedBy: .newlines)
                    .filter { !$0.isEmpty }
                
                allLetters = lines.compactMap { line in
                    let letters = line.map { String($0) }
                    return letters
                }
                
                // Horizontal (forward and backward)
                let horizontalForward = findHorizontalPatterns(in: allLetters, sequence: sequence)
                let horizontalBackward = findHorizontalPatterns(in: allLetters, sequence: sequenceBackwards)
                
                // Vertical (forward and backward)
                let verticalForward = findVerticalPatterns(in: allLetters, sequence: sequence)
                let verticalBackward = findVerticalPatterns(in: allLetters, sequence: sequenceBackwards)
                
                // Diagonal (only forward XMAS, no backward SAMX)
                let diagonalPatterns = findDiagonalPatterns(in: allLetters)
                
                let total = horizontalForward + horizontalBackward + verticalForward + verticalBackward + diagonalPatterns
                print("Found patterns - Horizontal forward: \(horizontalForward), backward: \(horizontalBackward)")
                print("Found patterns - Vertical forward: \(verticalForward), backward: \(verticalBackward)")
                print("Found patterns - Diagonal: \(diagonalPatterns)")
                print("Total patterns found: \(total)")
                amount = total
            }
        }
    }
    
    func findHorizontalPatterns(in grid: [[String]], sequence: [String]) -> Int {
        var count = 0
        
        for row in 0..<grid.count {
            for col in 0...(grid[row].count - sequence.count) {
                var matches = true
                for i in 0..<sequence.count {
                    if grid[row][col + i] != sequence[i] {
                        matches = false
                        break
                    }
                }
                if matches {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func findVerticalPatterns(in grid: [[String]], sequence: [String]) -> Int {
        var count = 0
        
        for col in 0..<grid[0].count {
            for row in 0...(grid.count - sequence.count) {
                var matches = true
                for i in 0..<sequence.count {
                    if grid[row + i][col] != sequence[i] {
                        matches = false
                        break
                    }
                }
                if matches {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func findDiagonalPatterns(in grid: [[String]]) -> Int {
        var count = 0
        
        // Check all four diagonal directions for XMAS (not SAMX)
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == "X" {
                    // Down-right
                    if row <= grid.count - 4 && col <= grid[row].count - 4 {
                        if grid[row + 1][col + 1] == "M" &&
                           grid[row + 2][col + 2] == "A" &&
                           grid[row + 3][col + 3] == "S" {
                            count += 1
                        }
                    }
                    
                    // Down-left
                    if row <= grid.count - 4 && col >= 3 {
                        if grid[row + 1][col - 1] == "M" &&
                           grid[row + 2][col - 2] == "A" &&
                           grid[row + 3][col - 3] == "S" {
                            count += 1
                        }
                    }
                    
                    // Up-right
                    if row >= 3 && col <= grid[row].count - 4 {
                        if grid[row - 1][col + 1] == "M" &&
                           grid[row - 2][col + 2] == "A" &&
                           grid[row - 3][col + 3] == "S" {
                            count += 1
                        }
                    }
                    
                    // Up-left
                    if row >= 3 && col >= 3 {
                        if grid[row - 1][col - 1] == "M" &&
                           grid[row - 2][col - 2] == "A" &&
                           grid[row - 3][col - 3] == "S" {
                            count += 1
                        }
                    }
                }
            }
        }
        
        return count
    }
    
    var body: some View {
        VStack {
            Button("Find XMAS Patterns") {
                getLetters()
            }
            Text("Found \(amount) patterns")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
