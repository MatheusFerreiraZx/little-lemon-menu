//
//  MenuItemDetailView.swift
//  Menu
//
//

import SwiftUI

struct MenuItemDetailView: View {
    
    @Binding var menuItem: MenuItem
    
    var body: some View {
        VStack(spacing: 8) {
            Image("LittleLemon")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Price:")
                    .bold()
                Text(menuItem.displayPrice)
            }
            
            VStack {
                Text("Ordered:")
                    .bold()
                Text("\(menuItem.ordersCount)")
            }
            
            VStack {
                Text("Ingredients:")
                    .bold()
              
                ForEach(menuItem.ingredients, id: \.self) {
                    Text($0.rawValue)
                }
            }
        }
    }
}
