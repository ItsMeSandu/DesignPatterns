//
//  Builder.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 14.03.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

enum DishCategory {
    case firstCourses, mainCourses, garnishes, drinks
}

struct Dish {
    var name: String
    var price: Float
}

struct OrderItem {
    var dish: Dish
    var count: Int
}

struct Order {
    var firstCourses: [OrderItem] = []
    var mainCourses: [OrderItem] = []
    var garnishes: [OrderItem] = []
    var drinks: [OrderItem] = []
    
    var price: Float {
        let items = firstCourses + mainCourses + garnishes + drinks
        return items.reduce(into: Float(0), { $0 += $1.dish.price * Float($1.count) })
    }
}

class OrderBuilder {
    private var order: Order?
    
    func reset() {
        order = Order()
    }
    
    func setFirstCourse(_ dish: Dish) {
        set(dish, at: order?.firstCourses, withCategory: .firstCourses)
    }
    
    func setMainCourse(_ dish: Dish) {
        set(dish, at: order?.firstCourses, withCategory: .mainCourses)
    }
    
    func setGarnish(_ dish: Dish) {
        set(dish, at: order?.firstCourses, withCategory: .garnishes)
    }
    
    func setDrink(_ dish: Dish) {
        set(dish, at: order?.firstCourses, withCategory: .drinks)
    }
    
    func getResult() -> Order? {
        return order
    }

    private func set(_ dish: Dish, at orderCategory: [OrderItem]?, withCategory dishCategroy: DishCategory) {
        guard let orderCategory = orderCategory else {
            return
        }
        
        var item: OrderItem! = orderCategory.filter { $0.dish.name == dish.name }.first

        guard item == nil else {
            item.count += 1
            return
        }
        
        item = OrderItem(dish: dish, count: 1)
        
        switch dishCategroy {
        case .firstCourses:
            order?.firstCourses.append(item)
            
        case .mainCourses:
            order?.mainCourses.append(item)
            
        case .garnishes:
            order?.garnishes.append(item)
            
        case .drinks:
            order?.drinks.append(item)
        }
        
    }
}

class BuilderExample: UIViewController {
    override func viewDidLoad() {
        doExample()
    }
    
    private func doExample() {
        let steak   = Dish(name: "Steak", price: 2.3)
        let chips   = Dish(name: "Chips", price: 1.2)
        let fanta   = Dish(name: "Fanta", price: 0.8)
        let cola    = Dish(name: "Cola", price: 0.9)

        let builder = OrderBuilder()
        builder.reset()
        builder.setDrink(fanta)
        builder.setGarnish(chips)
        builder.setMainCourse(steak)
        builder.setDrink(cola)
        builder.setDrink(fanta)
        
        let order = builder.getResult()
        print(order?.price)
    }
}
