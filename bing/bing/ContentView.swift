//
//  ContentView.swift
//  bing
//
//  Created by Myles Holley on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var gametarget:Int
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        Text(String(gametarget))
                }
       
}


