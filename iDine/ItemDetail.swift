//
//  ItemDetail.swift
//  iDine
//
//  Created by Gontse on 2023/06/19.
//

import SwiftUI

struct ItemDetail: View {
  
  @EnvironmentObject var order: Order
  
  let item: MenuItem
  
    var body: some View {
      VStack {
        ZStack(alignment: .bottomTrailing) {
          Image(item.mainImage)
            .resizable()
            .scaledToFit()
          Text("Photo: \(item.photoCredit)")
            .padding(4)
            .background(.black)
            .font(.caption)
            .foregroundStyle(.white)
            .offset(x: -5, y: -5)
        }
        
        Text(item.description)
          .padding()
        Spacer()
       
        Button {
          order.add(item: item)
        } label: {
          Text("Order This")
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding()
        Spacer()
      }
      .navigationTitle(item.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//  ItemDetail(item: MenuItem.example).environmentObject(Order())
//}
