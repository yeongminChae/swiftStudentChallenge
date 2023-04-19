//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/13.
//

import SwiftUI

struct WorkThroughSecond: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings: UserSettings
    @State private var shouldNavigate = false
    @State private var circle1 = true
    @State private var circle2 = false
    @State private var circle3 = false
    
    var body: some View {
        NavigationView(content: {
                GeometryReader {geometry in
                    VStack{
                        Text("Customize Your Emotion Stamps !")
                            .multilineTextAlignment(.center).padding(.top,110).padding(.bottom,-70).padding(.leading,-50).font(.system(size: 30,weight: .semibold))
                        VStack {
                            Image("red").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Excitement Experience").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("orange").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Biggest Enjoyment").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("yellow").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Pure Affection").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("green").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Normal Emotion").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("blue").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("I Am ConFused").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("navy").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Pretty Happy Now").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                            Image("purple").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                                .frame(width: 55,height: 55).padding(.bottom,20)
                                .overlay(Text("Embarrassed Moment").frame(width: UIScreen.main.bounds.width,alignment: .leading).padding(.top,70).padding(.leading,250))
                            
                        }.padding(.leading,10).position(x:geometry.size.width / 2.3 , y:geometry.size.height / 2.2)
                    }.padding().position(x:geometry.size.width / 1.8 , y:geometry.size.height / 2.5)
                    
                    NavigationLink(destination: Home().navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
                       EmptyView()
                    }
                    
                    Button(action: {
                          shouldNavigate = true
                    }, label: {
                        Image("xbtn").resizable().frame(width: 20, height:20)
                    })
                    .font(.system(size: 35))
                    .padding(.leading,70)
                    .padding(.top,10)
                    .accentColor(.black)
                    .offset(x:geometry.size.width/1.5 , y:geometry.size.height/(100))
                }
        }
        )
    }
}

struct WorkThroughSecond_Previews: PreviewProvider {
    static var previews: some View {
        WorkThroughSecond(settings: UserSettings())
    }
}
