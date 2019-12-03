//
//  AppView.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            DishList()
                .tabItem{
                    Text("美食欄")
                }
            ChartView(dishData:DishData())
                .tabItem {
                      Text("圖表")
                }
        }.accentColor(.black)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
