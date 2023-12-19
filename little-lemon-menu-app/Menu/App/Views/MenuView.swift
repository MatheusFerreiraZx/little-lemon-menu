//
//  ContentView.swift
//  Menu
//
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject private var viewModel = MenuViewViewModel()
    @State private var isPresentingOptionsView = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var foodMenuItemsView: some View {
        Section {
            ForEach($viewModel.foodMenuItems) { menuItem in
                NavigationLink {
                    MenuItemDetailView(menuItem: menuItem)
                        .navigationTitle(menuItem.title)
                } label: {
                    MenuItemView(menuItem: menuItem)
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 120
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        } header: {
            HStack(alignment: .top) {
                Text("Food")
                    .font(.title)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
        }
    }

    var drinkMenuItemsView: some View {
        Section {
            ForEach($viewModel.drinkMenuItems) { menuItem in
                MenuItemView(menuItem: menuItem)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 120
                    )
            }
        } header: {
            HStack(alignment: .top) {
                Text("Drinks")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    var desertMenuItemsView: some View {
        Section {
            ForEach($viewModel.dessertMenuItems) { menuItem in
                MenuItemView(menuItem: menuItem)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 120
                    )
            }
        } header: {
            HStack(alignment: .top) {
                Text("Dessert")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    var scrollView: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                foodMenuItemsView
                drinkMenuItemsView
                desertMenuItemsView
            }
            .padding(.horizontal)
        }
    }

    var body: some View {
        NavigationView {
            scrollView
                .navigationTitle("Menu")
                .toolbar {
                    ToolbarItem {
                        Button {
                            isPresentingOptionsView.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                }
                .sheet(isPresented: $isPresentingOptionsView) {
                    MenuOptionsView()
                }
        }
    }
}
