//
//  CheckoutView.swift
//  iDine
//
//  Created by Gontse on 2023/06/20.
//

import SwiftUI

struct CheckoutView: View {
  
  @EnvironmentObject var order: Order
  @State private var paymentType = "Cash"
  
  @State private var addLoyaltyDetails = false
  @State private var loyaltyNumber = ""
  
  let tipAmounts = [0, 10, 15, 20, 25]
  @State private var tipAmount = 0
  
  let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
  
  var totalPrice: String {
    let total = Double(order.total)
    let tip = total/100 * Double(tipAmount)
    return (total + tip).formatted(.currency(code: "ZAR"))
  }
  
    var body: some View {
      Form {
        Section {
          Picker("How would you like to play?", selection: $paymentType) {
            ForEach(paymentTypes, id: \.self) {
              Text($0)
            }
          }
          Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails)
          
          if addLoyaltyDetails {
            TextField("Please enter your iDine ID", text: $loyaltyNumber)
          }
        }
        
        Section("Add a tip?") {
          Picker("Percentage", selection: $tipAmount) {
            ForEach(tipAmounts, id: \.self) {
              Text("\($0)%")
            }
          }
          .pickerStyle(.segmented)
        }
        
        Section("Total: \(totalPrice)") {
          Button("Confirm Order") {
            // Place Order
          }
        }
        
      }
      .navigationTitle("Payment")
      .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
    .environmentObject(Order())
}
