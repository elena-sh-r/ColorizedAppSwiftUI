//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Elena Sharipova on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(red: 221 / 255, green: 160 / 255, blue: 221 / 255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                ColorView(
                    color: Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
                
                ColorSliderView(value: $redSliderValue, title: "Red:", accentColor: .red)
                ColorSliderView(value: $greenSliderValue, title: "Green:", accentColor: .green)
                ColorSliderView(value: $blueSliderValue, title: "Blue:", accentColor: .blue)
                
                Spacer()
            }
            .padding()
        }
    }
}

/// View для отображения цвета, настроенного слайдерами
struct ColorView: View {
    
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 150)
            .foregroundColor(color)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5))
    }
}

/// Слайдер для регулировки интенсивности цвета RGB в пределах значений от 0 до 255
struct ColorSliderView: View {
    
    @Binding var value: Double
    
    var title: String
    var accentColor: Color
    
    var body: some View {
        HStack() {
            Text(title)
                .frame(width: 55, alignment: .leading)
            Text("\(lround(value))")
                .frame(width: 40, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1).accentColor(accentColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
