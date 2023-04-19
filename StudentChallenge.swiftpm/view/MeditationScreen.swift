//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/09.
//

import SwiftUI

struct MeditationScreen: View {
    let blueColorArr: [String] = ["97DEFF","19A7CE","2F58CD","62CDFF","19376D","009FBD"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
//    var colors: [Color]
//    init() {
//        self.colors = [Color(hex: blueColorArr.shuffled()[0]),Color(hex: blueColorArr.shuffled()[1]),Color(hex: blueColorArr.shuffled()[0])]
//    }
    
    @State var colors: [Color] = []
    @State var startPoint = UnitPoint(x: 1, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 1)
    @State private var currentIndex = 0
    @State var isAnimating = false

    
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
                .ignoresSafeArea()
//                .animation(Animation.easeInOut(duration: 3.0))
//                .animation(Animation.easeInOut(duration: 5.0).repeatForever(autoreverses: true))
        }
        .onReceive(timer) { _ in
               withAnimation {
                   colors = [Color(hex: blueColorArr.randomElement()!), Color(hex: blueColorArr.randomElement()!), Color(hex: blueColorArr.randomElement()!)]
                }
            
        }
       .onAppear {
           colors = [Color(hex: blueColorArr.randomElement()!), Color(hex: blueColorArr.randomElement()!), Color(hex: blueColorArr.randomElement()!)]
       }
//        .onAppear {
//            withAnimation {
//                startPoint = UnitPoint(x: 0, y: 0)
//                endPoint = UnitPoint(x: 0.3, y: 0.5)
//            }
//        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct MeditationScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeditationScreen()
    }
}
