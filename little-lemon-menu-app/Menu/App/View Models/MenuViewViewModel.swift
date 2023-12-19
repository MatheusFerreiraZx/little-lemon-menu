//
//  MenuViewViewModel.swift
//  Menu
//
//

import SwiftUI

final class MenuViewViewModel: ObservableObject {
    
    @Published var foodMenuItems: [MenuItem] = []
    @Published var drinkMenuItems: [MenuItem] = []
    @Published var dessertMenuItems: [MenuItem] = []
    
    init() {
        foodMenuItems = makeFoodMenuItems()
        drinkMenuItems = makeDrinkMenuItems()
        dessertMenuItems = makeDessertMenuItems()
    }
    
    // MARK: - Helpers
    private func makeFoodMenuItems() -> [MenuItem] {
        (1...12)
            .map {
                MenuItem(
                    title: "Food \($0)",
                    menuCategory: .food,
                    price: Double($0) + 5.99,
                    ordersCount: $0 * 200,
                    ingredients: Ingredient.allCases
                )
            }
    }
    
    private func makeDrinkMenuItems() -> [MenuItem] {
        (1...8)
            .map {
                MenuItem(
                    title: "Drink \($0)",
                    menuCategory: .drink,
                    price: Double($0) + 0.99,
                    ordersCount: $0 * 100,
                    ingredients: Ingredient.allCases
                )
            }
    }
    
    private func makeDessertMenuItems() -> [MenuItem] {
        (1...4)
            .map {
                MenuItem(
                    title: "Dessert \($0)",
                    menuCategory: .dessert,
                    price: Double($0) + 2.99,
                    ordersCount: $0 * 50,
                    ingredients: Ingredient.allCases
                )
            }
    }
}
