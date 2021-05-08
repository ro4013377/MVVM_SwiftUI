//
//  ContentView.swift
//  MVVM_SwiftUI
//
//  Created by Rohit Agrawal on 07/05/21.
//

import SwiftUI

// Models
struct Person {
    
    var name: String
    var birthday: Date
    
}

// ViewModels

// ViewModel needs to Conform to Observable Object Protocol  - View Model has to somehow notify View that model has changed.

class ContentViewModel: ObservableObject {
    
    // how does the ViewModel notify the View that model changed  - Mark the model with @published Property Wrapper.

    @Published private var  rohit = Person(name: "Rohit ", birthday: Date())
    
    var name: String {
        return rohit.name
    }
    
    var age: String {
        // Date magic - > return age
        return "27"
    }

    func changeName(_ name: String)  {
        rohit.name = name  // this changed , so @published will notify , who are observing.
    }
    
}

// Views
struct ContentView: View {
    
    // can use @observedObject also here , if doing like : , when = , it will initiate always.
    // When to use which one - see that image flow diagram - Created , so @StateObject
    // parameter - > @ObservedObject.
    
    @StateObject var viewModel =  ContentViewModel()  // Observing change here

    var body: some View {
        
        VStack {
            Text(viewModel.name)
                .padding()
            
            Text(viewModel.age)

            Button("Change Name") {
                // Change name to Rahul
          
                viewModel.changeName("Rahul")
            }
            
        }.font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
  
