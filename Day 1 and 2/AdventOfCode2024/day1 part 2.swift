//
//  day1 part 2.swift
//  AdventOfCode2024
//
//  Created by Izabela Marcinkowska on 2024-12-03.
//

import SwiftUI

struct day1_part_2: View {
//    @State private var allNumbers: [[Int]] = []
//    @State private var result: Int = 0
//    
//    func getTheNumbers() {
//        if let numbersURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
//            if let numbers = try? String(contentsOf: numbersURL, encoding: .utf8) {
//                let lines = numbers.components(separatedBy: .newlines)
//                    .filter { !$0.isEmpty }
//                
//                allNumbers = lines.compactMap { line in
//                    let nums = line.components(separatedBy: .whitespaces)
//                        .filter { !$0.isEmpty }
//                        .compactMap { Int($0) }
//                    return nums.count == 2 ? nums : nil
//                }
//                
//                calculateSimilarityScore()
//            }
//        }
//    }
//    
//    func calculateDifferences() {
//        // Separate left and right numbers
//        let leftNumbers = allNumbers.map { $0[0] }.sorted()
//        let rightNumbers = allNumbers.map { $0[1] }.sorted()
//        
//        // Calculate differences between sorted pairs
//        var totalDifference = 0
//        for i in 0..<leftNumbers.count {
//            let difference = abs(rightNumbers[i] - leftNumbers[i])
//            totalDifference += difference
//            print("Comparing \(leftNumbers[i]) with \(rightNumbers[i]), difference: \(difference)")
//        }
//        
//        result = totalDifference
//        print("Total difference: \(result)")
//    }
//    
//    func calculateSimilarityScore() {
//        // Separate left and right numbers
//        let leftNumbers = allNumbers.map { $0[0] }
//        let rightNumbers = allNumbers.map { $0[1] }
//        
//        //array.filter{$0 == element}.count
//        var similarityScore = 0
//        
//        for i in 0..<leftNumbers.count {
//            let countInRight = rightNumbers.filter{$0 == leftNumbers[i]}.count
//            let multipicatedNumber = countInRight * leftNumbers[i]
//            similarityScore += multipicatedNumber
//        }
//        print("Result is \(similarityScore)")
//    }
    
    var body: some View {
        VStack {
//            Button("Get the numbers") {
//                getTheNumbers()
//            }
//            
//            Text("Result: \(result)")
//                .font(.headline)
//                .padding()
//            
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
    day1_part_2()
}
