//
//  ContentView.swift
//  data-test
//
//  Created by Federico on 21/02/2022.
//

import SwiftUI
import Foundation

class FoodData: ObservableObject {
    var text: String = "Text" {
        willSet {
            objectWillChange.send()
            print("\(text) is about to change. (willSet)")
        }
        didSet {
            text = text + "!"
            print("\(text) is the new value! (didSet)")
        }
    }
}

struct ContentView: View {
    @StateObject var data = FoodData()
    @State private var text = ""
    
    var body: some View {
        VStack {
            Form {
                Text(data.text)
                TextField("Enter some text here", text: $text)
            }
            .frame(height: 200)
            .cornerRadius(20)
            .padding()

            Button("Submit") {
                data.text = text
                self.text = ""
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
