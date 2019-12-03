//
//  MovieEditor.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct DishEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var rank = ""
    @State private var trueHeart = false
    @State private var showAlert = false
    var editDish: Dish?
    var dishData: DishData
    var body: some View {
        VStack{
            Form {
                TextField("美食名稱", text: $name)
                profileType(selectedType: self.$type)
                TextField("星級建議", text: $rank)
                .keyboardType(.numberPad)
                Toggle("值得再去", isOn: $trueHeart)
            }
            .navigationBarTitle(editDish == nil ? "增加新的推薦美食" : "編輯菜單")
            .navigationBarItems(trailing: Button("儲存") {
            let dish = Dish(name: self.name, type: self.type, rank: self.rank, trueHeart: self.trueHeart)
            if let editDish = self.editDish {
                let index = self.dishData.dishes.firstIndex {
                return $0.id == editDish.id
            }!
            self.dishData.dishes[index] = dish
            } else {
                self.dishData.dishes.insert(dish, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
         })
            .onAppear {
                if let editDish = self.editDish{
                    self.name = editDish.name
                    self.type = editDish.type
                    self.rank = editDish.rank
                    self.trueHeart = editDish.trueHeart
                }
            }
        }
    }
} 

struct DishEditor_Previews: PreviewProvider {
    static var previews: some View {
        DishEditor(dishData: DishData())
    }
}

struct profileType: View
{
    @Binding var selectedType: String
    var types = ["飯食","麵食","甜品","飲品","小吃","其他"]
    var body: some View
    {
        Picker(selection: $selectedType, label: Text("類型"))
        {
            ForEach(types, id: \.self)
            {
                (type) in
                Text(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
