//
//  Movie.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import Foundation

struct Dish: Identifiable, Codable {
 var id = UUID()
 var name: String
 var type: String
 var rank: String
 var trueHeart: Bool
}
