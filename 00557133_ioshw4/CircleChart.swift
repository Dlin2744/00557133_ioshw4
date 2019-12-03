//
//  CircleChartView.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct CircleChart: View {
    var dishData : DishData
    var percentages : [Double]
    var degree : [CGFloat]
    var colors : [Color]
    var types = ["飯食","麵食","甜品","飲品","小吃","其他"]
    var totalCount : Int = 0
    
    init(dishData : DishData){
    self.dishData = dishData
    if dishData.dishes.count == 0{
        colors = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
        percentages = [1.0]
        degree = [0.0,0.0,0.0,0.0,0.0,0.0]
    }
    else{
        percentages = [0.0,0.0,0.0,0.0,0.0,0.0]
        colors = [Color.blue,Color.red,Color.yellow,Color.green,Color.orange,Color.purple]
        for data in self.dishData.dishes{
            totalCount += 1;
            for index in 0...5{
                if(types[index] == data.type){
                    percentages[index] += 1
                }
            }
        }
        for index in 0...5{
            percentages[index] /= Double(totalCount)
        }
        degree = [0.0,CGFloat(percentages[0])]
        for index in 2...5{
            degree.append(CGFloat(percentages[index-1]) + degree[index-1])
        }
    }
    }
    var body: some View {
        ZStack{
            ForEach(degree.indices){ (index) in
            circleView(index:index,degree:self.degree,colors: self.colors)
            }
            VStack{
            HStack{
                Text("藍：飯食")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("紅：麵食")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("黃：甜品")
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
            HStack{
                Text("綠：飲品")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("橘：小吃")
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                Text("紫：其他")
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
            }
            }
        }
        .frame(width :250,height: 250)
         
    }
}

struct CircleChart_Previews: PreviewProvider {
    static var previews: some View {
        CircleChart(dishData: DishData())
    }
}

struct circleView: View {
    var index : Int
    var degree : [CGFloat]
    var colors : [Color]
    var body: some View {
        VStack{
            if index == (self.degree.count-1){
                Circle()
                    .trim(from: self.degree[index], to:1)
                    .stroke(self.colors[index],lineWidth: CGFloat(30))
            }
            else{
                Circle()
                    .trim(from: self.degree[index], to:self.degree[index+1])
                    .stroke(self.colors[index],lineWidth: CGFloat(30))
            }
        }
    }
}

