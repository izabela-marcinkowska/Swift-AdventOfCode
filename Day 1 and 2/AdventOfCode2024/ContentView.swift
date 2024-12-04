//
//  ContentView.swift
//  AdventOfCode2024
//
//  Created by Izabela Marcinkowska on 2024-12-03.
//
import SwiftUI

struct ContentView: View {
    @State private var allNumbers: [[Int]] = []
    
    func getTheNumbers() {
        if let numbersURL = Bundle.main.url(forResource: "day2", withExtension: "txt") {
            if let numbers = try? String(contentsOf: numbersURL, encoding: .utf8) {
                let lines = numbers.components(separatedBy: .newlines)
                    .filter { !$0.isEmpty }
                
                allNumbers = lines.compactMap { line in
                    let nums = line.components(separatedBy: .whitespaces)
                        .filter { !$0.isEmpty }
                        .compactMap { Int($0) }
                    return nums
                }
                analyzeRaports()
            }
        }
        
    }
    
    func analyzeRaports() {
        var amountRaports = 0
        for i in 0..<allNumbers.count {
            if (isIncreasing(allNumbers[i]) || isDecreasing(allNumbers[i])) {
                amountRaports += 1
            }
        }
        print("Amount reports is \(amountRaports)")
    }
    
    func isIncreasing(_ array: [Int]) -> Bool {
        return zip(array, array.dropFirst()).allSatisfy { $1 - $0 > 0 && $1 - $0 <= 3 }
    }
    
    func isDecreasing(_ array: [Int]) -> Bool {
        return zip(array, array.dropFirst()).allSatisfy { $0 - $1 > 0 && $0 - $1 <= 3 }
    }
    
    
    var body: some View {
        VStack {
            Button("Get the numbers") {
                getTheNumbers()
            }
            
            
//            List {
//                let leftSorted = allNumbers.map { $0[0] }.sorted()
//                let rightSorted = allNumbers.map { $0[1] }.sorted()
//                
//                ForEach(0..<leftSorted.count, id: \.self) { index in
//                    Text("\(leftSorted[index]) and \(rightSorted[index]) -> difference: \(abs(rightSorted[index] - leftSorted[index]))")
//                }
//            }
           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
