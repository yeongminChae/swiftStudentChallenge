//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/14.
//

import SwiftUI

struct EmotionDefineCheck: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: UserSettings
    @State private var shouldNavigateToDefine = false

    
    var body: some View {
        
        GeometryReader {geometry in
            VStack{
                ZStack(alignment: .topLeading) {
                    
                    Color.white.ignoresSafeArea()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .padding()
                    })
                    .accentColor(.black)
                    Text("Check Your Stamps").padding().frame(maxWidth: .infinity).font(.system(size: 20,weight: .semibold))
                    
                    VStack{
                        Image("red").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[0]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("orange").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[1]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("yellow").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[2]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("green").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[3]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("blue").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[4]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("navy").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[5]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                        Image("purple").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                            .frame(width: 55,height: 55).padding(.bottom,20)
                            .overlay(Text(settings.stampArr[6]).frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,15))
                        
                    }.padding(.leading,10).position(x:geometry.size.width / 2 , y:geometry.size.height / 2.3)
                    
                    NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true),
                       isActive: $shouldNavigateToDefine){
                        EmptyView()
                    }
                    
                    Button(action: {
                        shouldNavigateToDefine = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 20).frame(width:200,height: 70).shadow(radius: 10)
                            .overlay(Text("EDIT").foregroundColor(Color(.white)))
                    })
                    .padding(.leading,5).padding(.top,-45)
                    .offset(x:geometry.size.width/(4.1) , y:geometry.size.height/(1.03))
                }
            }
        }
    }
}

struct EmotionDefineCheck_Previews: PreviewProvider {
    static var previews: some View {
        EmotionDefineCheck()

    }
}
