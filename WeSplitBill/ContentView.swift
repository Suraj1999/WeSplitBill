//
//  ContentView.swift
//  WeSplitBill
//
//  Created by Suraj Gupta on 12/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    @State private var totalPerPerson: Double = 0.0
    
    let finalAmount = TotalPerPerson()
    
    let tipPercentages = [10,15,20,25,0]
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    // 0th row conatins 2 people, 1st row contains 3 people and 2nd row contains 4 people and we have a selection marked as 2 so we by default it is a 2nd row which has 4 people
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to tip")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Button {
                    totalPerPerson = try! finalAmount.calculateFinalAmount(amount: checkAmount, tipPercent: tipPercentage, totalPerson: numberOfPeople+2)
                } label: {
                    Text("calculate")
                }
            }
            .navigationTitle("We Split")
        }
    }
}

#Preview {
    ContentView()
}

