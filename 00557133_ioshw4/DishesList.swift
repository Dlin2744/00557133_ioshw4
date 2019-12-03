//
//  MovieList.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct DishList: View {
    @ObservedObject var dishData = DishData()
    @State private var showEditdish = false
    var body: some View {
        VStack{
        NavigationView {
            
            List {
                ForEach(dishData.dishes) { (dish) in
                    NavigationLink(destination: DishEditor(
                        editDish:dish, dishData:self.dishData)) {
                        DishRow(dish: dish)}
                }
                .onDelete { (indexSet) in
                self.dishData.dishes.remove(atOffsets: indexSet)}
                .onMove { (indexSet, index) in
                    self.dishData.dishes.move(fromOffsets: indexSet, toOffset: index)
                }
            }
          .navigationBarTitle("蒐藏推薦美食")
          
          .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            self.showEditdish = true
          }, label: {
                Image(systemName: "plus.circle.fill")
          }))
          .sheet(isPresented: $showEditdish) {
              NavigationView {
                DishEditor(dishData: self.dishData)}
          }
        }
        }

        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        DishList()
    }
}
