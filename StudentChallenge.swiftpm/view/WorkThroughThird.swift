//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/13.
//

import SwiftUI

struct WorkThroughThird: View {
    @State private var shouldNavigate = false
    @StateObject var settings: UserSettings
    var stampArr: [String]?
    
    var body: some View {
        NavigationView(content: {
            GeometryReader {geometry in
                VStack{
                    Text("Did You Define Your Stamps?")
                    Text("Then Let's Retrospect Your Day")
                    Rectangle()
                        .fill(Color(hex: "FFD966")).frame(width: UIScreen.main.bounds.width, height: 150).padding(.top,30).padding(.bottom,30)
                        .overlay(Text("Gif Maybe?"))
                    
                    Text("Let's Find Your Daily Color!")
                    Rectangle()
                        .fill(Color(hex: "FFD966")).frame(width: UIScreen.main.bounds.width, height: 150).padding(.top,30).padding(.bottom,30)
                        .overlay(Text("Gif Maybe?"))
                    Text("Go To Use Various Workshop With Your Daily Color.").multilineTextAlignment(.center)
                }.offset(x:geometry.size.width/(-10) , y:geometry.size.height/(15)).padding(.leading,40).padding(.top,-15)
                
                NavigationLink(destination: Home().navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
                    EmptyView()
                }
                
                Button(action: {
                    shouldNavigate = true
                }, label: {
                    RoundedRectangle(cornerRadius: 20).frame(width:200,height: 70).shadow(radius: 10)
                        .overlay(Text("HOME").foregroundColor(Color(.white)))
                })
                .padding(.leading,5).padding(.top,-40)
                .offset(x:geometry.size.width/4.3 , y:geometry.size.height/1.1)
                
            }
        })
    }
}

struct WorkThroughThird_Previews: PreviewProvider {
    static var previews: some View {
        WorkThroughThird(settings: UserSettings(), stampArr: [])
    }
}
