//
//  SwiftUIView.swift
//
//
//  Created by 채영민 on 2023/04/10.
//

import SwiftUI

struct MusicTaste: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedBox: Int?
    @State private var isClicked = false
    
    var body: some View {
        NavigationView(content: {
            
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
                
                
                Text("MusicTaste view").padding().frame(maxWidth: .infinity).font(.system(size: 20,weight: .semibold))
                
                VStack{
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(hex: "FFD966")).frame(width: UIScreen.main.bounds.width, height: 450).overlay(Text("music player")).padding(.top,100)
                            
                            
                            LazyHStack {
                                ForEach(0..<10)  { i in
                                    RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 250)
                                    .shadow(radius: 10)
                                    .padding(.leading,9)
                                    .padding(.top,70)
                                    .padding()
                                    .onTapGesture {
                                        isClicked.toggle()
                                        selectedBox = i
                                    }
                                    .scaleEffect(isClicked ? selectedBox == i ? 1.2 : 1.0 : 1.0)
                                    .id(i)
                                    
                                }.animation(Animation.spring())
                            }.modifier(ScrollingHStackModifier(items: 10 , itemWidth: 250, itemSpacing: 30)).padding(.leading,-280)
                    }.frame(width: UIScreen.main.bounds.width, height: 350).padding(.top,60)
                    
                    Rectangle()
                        .fill(Color(.yellow)).frame(width: UIScreen.main.bounds.width, height: 200).overlay(Text("music player")).padding(.top,70)
                    NavigationLink(destination: MeditationScreen().navigationBarBackButtonHidden(false)) {
                        RoundedRectangle(cornerRadius: 60).fill(Color(hex: "002B5B")).frame(width: UIScreen.main.bounds.width / 1.1, height:60).overlay(Text("garbage collector")).padding(.top,15)
                        }
                    }.padding(.bottom,-20)
                }.onTapGesture {
                    isClicked = false
                }
            }
        )
    }
}

struct MusicTaste_Previews: PreviewProvider {
    static var previews: some View {
        MusicTaste()
    }
}
