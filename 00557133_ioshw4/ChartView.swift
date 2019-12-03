//
//  ChartView.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var dishData = DishData()
    var body: some View {
        ZStack{
            Color(red:240/255, green: 240/255, blue: 150/255)
            .edgesIgnoringSafeArea(.all)

        VStack{
            PieChart(dishData: self.dishData).frame(width:300,height: 300)
            CircleChart(dishData: self.dishData).frame(width:300,height: 300)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
