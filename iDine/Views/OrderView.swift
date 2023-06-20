//
//  OrderView.swift
//  iDine
//
//  Created by Gontse on 2023/06/19.
//

import SwiftUI

struct OrderView: View {
 
 @EnvironmentObject var order: Order
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          ForEach(order.items) { item in
            HStack {
              Text(item.name)
              Spacer()
              Text("R\(item.price)")
            }
          }
        }
        
        Section {
          NavigationLink("Place Oder") {
            CheckoutView()
          }
        }
      }
      .navigationTitle("Order")
    }
  }
}

//#Preview {
//  OrderView().environmentObject(Order())
//}
