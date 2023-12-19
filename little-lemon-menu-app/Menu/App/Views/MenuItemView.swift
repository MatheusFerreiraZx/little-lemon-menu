//
//  MenuItemView.swift
//  Menu
//
//

import SwiftUI

struct MenuItemView: View {
    
    @Binding var menuItem: MenuItem
    
    var body: some View {
        VStack {
            Color.black

            Text(menuItem.title)
        }
    }
}
