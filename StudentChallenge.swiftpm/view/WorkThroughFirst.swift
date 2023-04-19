//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/13.
//

import SwiftUI
import LottieUI

struct WorkThroughFirst: View {
    var text = "Emotional Awareness"
    @ObservedObject var settings: UserSettings
    @State private var isShowingText1 = false
    @State private var isShowingText2 = false
    @State private var isShowingText3 = false
    @State private var circle1 = true
    @State private var circle2 = false
    @State private var circle3 = false
    @State private var isAnimating = false
    @State private var shouldNavigate = false
    let state2 = LUStateData(type: .loadedFrom(URL(string: "https://assets9.lottiefiles.com/packages/lf20_mniampqn.json")!), speed: 1.0, loopMode: .loop)
    
    
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader {geometry in
                    VStack {
                        if circle1 {
                            HStack() {
                                GeometryReader {geometry in
                                    HStack(alignment: .center) {
                                        Text("     Why Do We Need \n '\(text)' ")
                                            .opacity(1)
                                            .animation(.easeOut(duration: 1))
                                            .opacity(isShowingText1 ? 1.0 : 0.0)
                                            .transition(.opacity)
                                            .frame(width: 400,height: 100)
                                            .font(.system(size: 25,weight: .bold))
                                            .offset(x:geometry.size.width/(-80) , y:geometry.size.height/2.4)
                                    }
                                }
                                .onAppear {
                                    withAnimation {
                                        isShowingText1 = true
                                    }
                                }
                            }
                            
                        }else if circle2 {
                            HStack() {
                                GeometryReader {geometry in
                                    HStack(alignment: .center) {
                                        Text("     Why Do We Need \n '\(text)' ")
                                            .opacity(isShowingText2 ? 1 : 0)
                                            .animation(.easeInOut(duration: 0.5).delay(0.5))
                                            .transition(.opacity)
                                            .frame(width: 400,height: 100)
                                            .font(.system(size: 25,weight: .bold))
                                            .padding(.top,40)
                                            .offset(x:geometry.size.width/(-80) , y:geometry.size.height/10)
                                    }
                                }
                                .onAppear {
                                    withAnimation {
                                        if circle2 {
                                            isShowingText2 = true
                                        }else {
                                            isShowingText2 = false
                                        }
                                    }
                                }
                            }
                            VStack{
                                ZStack{
                                    CustomStateView(state: state2)
                                        Image("photoV2_1").resizable().frame(width: 200, height: 250).padding(.top,50)
                                        .opacity(isShowingText2 ? 1 : 0)
                                        .animation(.easeInOut(duration: 0.5).delay(0.5))
                                        .transition(.opacity)
                                }
                                Text("Emotions play a crucial role in our lives and can have a significant impact on us.")
                                    .opacity(isShowingText2 ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.5).delay(0.5))
                                    .transition(.opacity)
                                    .frame(width: 305, height: 150).padding(.top,-20).font(.system(size: 20,weight: .semibold))
                                    .multilineTextAlignment(.leading)
                            }.position(x:geometry.size.width/2, y:geometry.size.height/30).padding(.top,0)

                        }else {
                            HStack() {
                                GeometryReader {geometry in
                                    HStack(alignment: .center) {
                                        Text("     Why Do We Need \n '\(text)' ")
                                            .opacity(isShowingText3 ? 1 : 0)
                                            .animation(.easeInOut(duration: 0.5).delay(0.5))
                                            .transition(.opacity)
                                            .frame(width: 400,height: 100)
                                            .font(.system(size: 25,weight: .bold))
                                            .padding(.top,40)
                                            .offset(x:geometry.size.width/(-80) , y:geometry.size.height/10)
                                    }
                                }
                                .onAppear {
                                    withAnimation {
                                        if circle3 {
                                            isShowingText3 = true
                                        }else {
                                            isShowingText3 = false
                                        }
                                    }
                                }
                            }
                            VStack{
                                ZStack{
                                    CustomStateView(state: state2)
                                        Image("photoV2_2").resizable().frame(width: 250, height: 250).padding(.top,50)
                                        .opacity(isShowingText3 ? 1 : 0)
                                        .animation(.easeInOut(duration: 0.5).delay(0.5))
                                        .transition(.opacity)
                                }
                                
                                Text("Understanding and defining our emotions can lead to fulfilling emotional well-being, improved communication skill.")
                                    .opacity(isShowingText3 ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.5).delay(0.5))
                                    .transition(.opacity)
                                    .frame(width: 360,height: 150).padding(.top,0).font(.system(size: 20,weight: .semibold))
                                    .multilineTextAlignment(.leading)
                            }.position(x:geometry.size.width/2, y:geometry.size.height/30).padding(.top,0)
                        }
                    
                        HStack{
                            HStack {
                                Circle().fill(circle1 ? Color(hex: "1b1b1c") : Color(hex: "D8D8D8")).frame(width: 10,height: 10).id(1).animation(.easeInOut)
                                    .onTapGesture {
                                        if circle2 {
                                            circle2.toggle()
                                            circle1.toggle()
                                        }else{
                                            circle1.toggle()
                                            circle3.toggle()
                                        }
                                    }
                                Circle().fill(circle2 ? Color(hex: "1b1b1c") : Color(hex: "D8D8D8")).frame(width: 10,height: 10).id(2).animation(.easeInOut)
                                    .onTapGesture {
                                        if circle1 {
                                            circle1.toggle()
                                            circle2.toggle()
                                        }else{
                                            circle2.toggle()
                                            circle3.toggle()
                                        }
                                    }     
                                Circle().fill(circle3 ? Color(hex: "1b1b1c") : Color(hex: "D8D8D8")).frame(width: 10,height: 10).id(3).animation(.easeInOut)
                                    .onTapGesture {
                                        if circle1 {
                                            circle3.toggle()
                                            circle1.toggle()
                                        }else{
                                            circle3.toggle()
                                            circle2.toggle()
                                        }
                                    }
                            }.padding(.leading,120).padding(.top,-30).frame(width: 200, height: 10)
                            
                            NavigationLink(destination: WorkThroughSecond(settings: settings).navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
                               EmptyView()
                            }
                            
                            Button(action: {
                                if circle1 {
                                    circle1.toggle()
                                    circle2.toggle()
                                }else if circle2 {
                                    circle3.toggle()
                                    circle2.toggle()
                                }else {
                                  shouldNavigate = true
                                }
                            }, label: {
                                Text("Next")
                            })
                            .font(.system(size: 20,weight: .semibold))
                            .padding(.leading,80)
                            .padding(.top,-40)
                            .accentColor(.black)
                        }.offset(x:geometry.size.width/(-350) , y:geometry.size.height/(-250))
                    }
                }
                
            }
        }
        }
}

fileprivate
struct CustomStateView: View {
    
    @State private var value: CGFloat = 0
    let state: LUStateData
    @State private var completedText: String = ""
    @State private var downloadedText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Spacer()
                Divider().frame(height: 16)
            }
            .frame(height: 26)
            LottieView(state: state, value: value, onCompleted: { success in
                completedText = ""
            }, onDownloaded: { success in
                downloadedText = ""
            })
        }
    }
}

struct WorkThroughFirst_Previews: PreviewProvider {
    static var previews: some View {
        WorkThroughFirst(settings: UserSettings())
    }
}
