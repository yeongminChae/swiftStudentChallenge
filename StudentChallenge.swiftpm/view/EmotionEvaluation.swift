//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/10.
//

import SwiftUI

struct EmotionEvaluation: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: UserSettings
    @State private var isClicked = false
    @State private var isSentence = false
    @State private var selectedImage: String?
    @State var rectangleStatus = Array(repeating: false, count: 7)
    @State var newArray = Array(repeating: "", count: 7)
    @State var textArray = Array(repeating: "", count: 7)
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let colors = ["red", "orange", "yellow", "green", "blue", "navy", "purple"]
    
    
    func imageWithBorder(imageName: String, color: Color?,strokeColor:Color?, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) -> some View {
        let size = CGSize(width: width, height: height)
        
        return Image(imageName)
            .resizable()
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
            .onTapGesture {
                selectedImage = imageName
                isClicked = true
            }
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor ?? Color.clear, lineWidth: selectedImage == imageName ? 5 : 0)
            )
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader {geometry in
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
                Text("Emotion Evaluation").padding().padding(.leading,-10).frame(maxWidth: .infinity).font(.system(size: 20,weight: .semibold))
                
                VStack{
                    ZStack {
                        LazyHStack(alignment: .center, spacing: 30) {
                            ForEach(0..<7, id: \.self) { i in
                                VStack{
                                    HStack{
                                        Text(daysOfWeek[i]).font(.system(size: 25,weight: .semibold))
                                    }.padding(.top, 25)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white)
                                        .frame(width: 250, height: 400, alignment: .center)
                                        .shadow(radius: 10)
                                        .padding(.top,20)
                                        .overlay(
                                            VStack{
                                                Toggle(isOn: $rectangleStatus[i]){}
                                                    .toggleStyle(SwitchToggleStyle()).tint(Color.orange).padding(.horizontal,100).padding(.leading,-15)
                                                    .onChange(of: rectangleStatus[i]) { value in
                                                        isSentence = value
                                                    }
                                                if rectangleStatus[i]{
                                                    if let imageName = selectedImage {
                                                        imageWithBorder(imageName: isClicked ? imageName : newArray[i], color: nil, strokeColor: nil, width: 150, height:150, cornerRadius: 10)
                                                    }else {
                                                        Image("people1").resizable().frame(width: 150, height:150)
                                                    }
                                                }
                                                else {
                                                    Image("people1").resizable().frame(width: 150, height:150)
                                                }
                                                
                                                if isSentence {
                                                    if let stamp = newArray[i] {
                                                        Text(stamp).padding(.top , 10)
                                                    } else {
                                                        Text("Not Defined Yet!").padding(.top , 10)
                                                    }
                                                }else {
                                                    Text("Not Defined Yet!").padding(.top , 10)
                                                }
                                                Button(action: {
                                                    newArray.insert(selectedImage ?? "" , at:i)
                                                    textArray[i] = settings.stampArr[i]
                                                    isClicked = false
                                                },label: {
                                                    RoundedRectangle(cornerRadius: 20).frame(width:100,height: 60).shadow(radius: 10)
                                                        .overlay(Text("SAVE").foregroundColor(Color(.white)))
                                                }
                                                ).offset(x:geometry.size.width/(205) , y:geometry.size.height/(29))
                                                    .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0))
                                            }
                                        )
                                }
                            }
                        }.modifier(ScrollingHStackModifier(items: 7, itemWidth: 250, itemSpacing: 30)).padding(.leading,-765).animation(Animation.spring())
                    }.padding(.top, 220)
                    
                    VStack{
                        HStack{
                            imageWithBorder(imageName: colors[0], color: .blue, strokeColor: .red, width: 55, height: 55, cornerRadius: 10)
                            
                            imageWithBorder(imageName: colors[1], color: .blue, strokeColor: .orange, width: 55, height: 55, cornerRadius: 10)
                            
                            imageWithBorder(imageName: colors[2], color: .blue, strokeColor: .yellow, width: 55, height: 55, cornerRadius: 10)
                            
                            imageWithBorder(imageName: colors[3], color: .blue, strokeColor: .green, width: 55, height: 55, cornerRadius: 10)
                            
                        }
                        HStack{
                            imageWithBorder(imageName: colors[4], color: .blue, strokeColor: .blue, width: 55, height: 55, cornerRadius: 10)
                            
                            imageWithBorder(imageName: colors[5], color: .blue, strokeColor: .indigo, width: 55, height: 55, cornerRadius: 10)
                            
                            imageWithBorder(imageName: colors[6], color: .blue, strokeColor: .purple, width: 55, height: 55, cornerRadius: 10)
                            
                            
                        }
                    }
                    .position(x:geometry.size.width / -2.1, y:geometry.size.height / 2.8).padding(.top, 0)
                }
            }
        }
    }
}
