//
//  MovieData.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import Foundation

class DishData: ObservableObject {
    @Published var dishes = [Dish](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(dishes) {
                UserDefaults.standard.set(data, forKey: "Dishes")
            }
        }
    }
        
        init() {
            if let data = UserDefaults.standard.data(forKey: "Dishes") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Dish].self,from: data) {
                    dishes = decodedData
                }
            }
         }
}
