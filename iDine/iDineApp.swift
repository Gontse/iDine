//
//  iDineApp.swift
//  iDine
//
//  Created by Gontse on 2023/06/18.
//

import SwiftUI

@main
struct iDineApp: App {
  
  @StateObject var order = Order()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(order)
        }
    }
}
