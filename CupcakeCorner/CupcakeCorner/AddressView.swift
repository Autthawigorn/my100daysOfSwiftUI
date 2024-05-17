//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Autthawigorn Yortpiboot on 15/5/2567 BE.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Checkout") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasvalidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}



/*
1. ContentView:
 

 Both @Bindable and @State are property wrappers used in SwiftUI to manage data within your views. However, there's a key difference in their purpose:

 
 @State

 Used to declare a piece of data that lives within the view itself. Any changes to this data will automatically trigger a refresh of the UI.
 Ideal for local state management within a single view.
 Automatically creates bindings to the property, allowing you to connect it to UI elements.
 
 
 @Bindable

 Used to create a binding to an existing observable object's property. This means the data doesn't necessarily belong to the view itself but to a separate observable object.
 Useful when you need to modify data from a parent view or another view in your SwiftUI hierarchy.
 Doesn't create its own binding, it just allows you to create a connection to an already existing one.
 
 
 Here's an analogy:
 @State is like having a box of cupcakes in your kitchen (the view). You can directly take cupcakes out and modify them (change the data).
 @Bindable is like having a cupcake box in the living room (another view) but you can still access it from the kitchen (your current view) and take cupcakes out (modify the data).
 
 
 In short:
 Use @State for local data within a view.
 Use @Bindable to connect to data from an existing observable object.
 */
