//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/14.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var stampArr:[String] = Array(repeating: "", count: 7)
    @Environment(\.presentationMode) var presentationMode
    @State private var shouldNavigate = false
//    @State private var isSaved = false
    @Published var isSaved: Bool = false
}


struct EmotionDefine: View {
    @EnvironmentObject var settings: UserSettings
    @State private var shouldNavigateToEvaluate = false
    @State private var shouldNavigateToHome = false
    @Environment(\.presentationMode) var presentationMode
    @State var shouldNavigateToDefine = false
    
    var body: some View {
        NavigationView(content:{
            
            GeometryReader {geometry in
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
                    Text("Define Stamps").padding().frame(maxWidth: .infinity).font(.system(size: 20,weight: .semibold))
                }
                
                VStack{
                    HStack{
                        Text("Define Your Unique Emotion Stamps!")
                    }.padding(.top,70).padding(.bottom,-40).padding(.leading,-65)
                    
                    Image("red").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Red Stamps",text:$settings.stampArr[0])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[0]) {
                                print($0)
                                if settings.isSaved {
                                    settings.isSaved.toggle()
                                }
                            }
                        )
                    
                    Image("orange").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Orange Stamps",text:$settings.stampArr[1])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[1]) {
                                print($0)
                            }
                        )
                    
                    Image("yellow").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Yellow Stamps",text:$settings.stampArr[2])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[2]) {
                                print($0)
                            }
                        )
                    
                    Image("green").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Green Stamps",text:$settings.stampArr[3])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[3]) {
                                print($0)
                            }
                        )
                    Image("blue").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Blue Stamps",text:$settings.stampArr[4])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[4]) {
                                print($0)
                            }
                        )
                    Image("navy").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Navy Stamps",text:$settings.stampArr[5])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[5]) {
                                print($0)
                            }
                        )
                    Image("purple").resizable().position(x:geometry.size.width/(-3.3) , y:geometry.size.height/10)
                        .frame(width: 55,height: 55).padding(.bottom,20)
                        .overlay(TextField("Define your Purple Stamps",text:$settings.stampArr[6])
                            .frame(width: UIScreen.main.bounds.width).padding(.top,70).padding(.leading,230)
                            .onChange(of: settings.stampArr[6]) {
                                print($0)
                            }
                        )
                }.padding(.leading,10).position(x:geometry.size.width / 2 , y:geometry.size.height / 2.3)
                    .onChange(of: presentationMode.wrappedValue.isPresented, perform: { value in
                    if !value {
                        shouldNavigateToDefine = false
                    }
                })
                
                NavigationLink(destination: Home().navigationBarBackButtonHidden(true),
                   isActive: $shouldNavigateToHome){
                    EmptyView()
                }.isDetailLink(false)
                
                Button(action: {
                    shouldNavigateToHome = true
                    for i in settings.stampArr{
                        if i != "" {
                            settings.isSaved = true
                            continue
                        }else{
                            settings.isSaved = false
                            break
                        }
                    }
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 20).frame(width:200,height: 70).shadow(radius: 10)
                        .overlay(Text("SUBMIT").foregroundColor(Color(.white)))
                })
                .padding(.leading,5).padding(.top,-45)
                .offset(x:geometry.size.width/(4.5) , y:geometry.size.height/(1.03))
            }
        })
    }
}

struct EmotionDefine_Previews: PreviewProvider {
    static var previews: some View {
        EmotionDefine()
    }
}

