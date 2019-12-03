//
//  MovieRow.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct DishRow: View {
    var dish: Dish
    var body: some View {
        HStack{
            Text(dish.name)
            Spacer()
            Text("\(dish.type)")
            Text("\(dish.rank)星")
            Image(systemName: dish.trueHeart ? "star.fill" :"heart")
        }
    }
}

struct DishRow_Previews: PreviewProvider {
    static var previews: some View {
        DishRow(dish: Dish(name:"白醬蛤蜊義大利麵", type: "麵食", rank: "４", trueHeart: true))
    }
}
