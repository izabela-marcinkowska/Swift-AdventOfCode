//
//  ContentView.swift
//  day4
//
//  Created by Izabela Marcinkowska on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    @State private var allLetters: [[String]] = []
    
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
                    print("All the letters are: \(letters)")
                    return letters
                }
            }
        }
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
