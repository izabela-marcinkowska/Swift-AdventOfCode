//
//  ContentView.swift
//  Day3
//
//  Created by Izabela Marcinkowska on 2024-12-04.
//

import SwiftUI

struct ContentView: View {
    @State private var text: [String] = []
    let patternString = "mul\\(\\d+,\\d+\\)"
    

    
    func getTheText() {
        print("This then")
        if let textURL = Bundle.main.url(forResource: "day3", withExtension: "txt") {
            print("is there a file?")
            if let text = try? String(contentsOf: textURL, encoding: .utf8) {
                print("TEST")
                let pattern = /mul\((\d+),(\d+)\)/
                let matches = text.matches(of: pattern)
                
                let sum = matches.reduce(0) { partialSum, match in
                    let num1 = Int(match.1) ?? 0
                    let num2 = Int(match.2) ?? 0
                    let result = num1 * num2
                    return partialSum + result
                }
                print("The sum in \(sum)")
            } else {
                print("Failed")
            }
        }
        
    }
    
    var body: some View {
        VStack {
            Button("Check") {
                getTheText()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
