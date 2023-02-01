//
//  ContentView.swift
//  bing
//
//  Created by Myles Holley on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    let students = ["harry","herminje","ron"]
    @State private var selectedstudent = "harry"
    @State private var checkamount = 0.0
    @State private var numberofpeople = 2
    @State private var tippercentage = 20
    var body: some View {
        Form{
            TextField("enter your name",text:$name)
            Picker("select your student", selection: $selectedstudent){
                ForEach(students,id: \.self){
                    Text($0)
                }}
                TextField("amount",value: $checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))            }
            Section {
                Text(checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
        
    func VStack() {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
