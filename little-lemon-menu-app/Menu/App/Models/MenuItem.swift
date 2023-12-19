//
//  MenuItem.swift
//  Menu
//
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var title: String { get }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    let id = UUID()
    var title: String
    let menuCategory: MenuCategory
    let price: Double
    var ordersCount: Int
    var ingredients: [Ingredient]
    var displayPrice: String {
        String(
            round(price / 0.01) * 0.01
        )
    }
}
