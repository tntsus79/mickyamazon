//
//  homeview.swift
//  bing
//
//  Created by Myles Holley on 1/19/23.
//

import SwiftUI

struct homeview: View {
    @State var target = 0
    var body: some View {
       
        
        NavigationStack{
            NavigationLink(destination: ContentView(gametarget: $target)){
                Text("content")
                
            }
            Button("bingbong") {
                target = Int.random(in:1...100)
            }                }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct homeview_Previews: PreviewProvider {
    static var previews: some View {
        homeview()
    }
}

