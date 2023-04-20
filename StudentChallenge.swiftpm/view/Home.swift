//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/10.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var settings: UserSettings
//    var stampArr: [String]
    @State private var shouldNavigateToDefine = false
    @State private var shouldNavigateToCheck = false
    @State private var shouldNavigateToEvaluate = false
    @State private var selectedBox1: Int?
    @State private var selectedBox2: Int?
    @State private var isChanging = false
    @StateObject var cardViewModel = CardViewModel()
    
    var body: some View {
        
        NavigationView(content: {
            GeometryReader {geometry in
                VStack {
                    HStack {
                        Text("SNO").frame(maxWidth: .infinity, alignment: .center).font(.system(size: 25,weight: .semibold)).padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    if !settings.isSaved {
                        VStack{
                            NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true)) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 300)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        VStack {
                                            VStack{
                                                Text("Set Emotions").font(.system(size: 25,weight: .semibold)).padding().padding(.leading, -60)
                                                Text("Define Your Personal Emotions \nAcording to Colors.").font(.system(size: 15)).multilineTextAlignment(.leading)
                                            }.frame(width:.infinity ,alignment: .leading).padding(.leading, -50).accentColor(.black)
                                            Image("colorEmotion")
                                                .resizable()
                                                .frame(width: 300, height: 75).padding(.horizontal,30)
                                        }
                                    )
                            }
                            
                        }.padding(.top,30).padding(.bottom,30)

                        VStack{
                            NavigationLink(destination: cardViewModel.cardData[0].view().navigationBarBackButtonHidden(false)) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 200)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        ZStack {
                                            Image("photoV2_3")
                                                .resizable()
                                                .frame(width: 120, height: 190)
                                                .padding(.leading,170)
                                            VStack{
                                                Text("Evaluate Days").font(.system(size: 25,weight: .semibold)).padding().padding(.leading, -25)
                                                Text("Evaluate Your Main Feelings \nEvery Day.").font(.system(size: 15)).multilineTextAlignment(.leading)
                                                    .padding(.leading, 10)
                                            }.frame(width:.infinity ,alignment: .leading).accentColor(.black).padding(.leading, -80)
                                        }
                                    )
                            }
                        }
                    }else {
                        VStack{
                            NavigationLink(destination: cardViewModel.cardData[0].view().navigationBarBackButtonHidden(false)) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 300)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        ZStack {
                                            Image("photoV2_3")
                                                .resizable()
                                                .frame(width: 120, height: 190)
                                                .padding(.leading,170)
                                            VStack{
                                                Text("Evaluate Days").font(.system(size: 25,weight: .semibold)).padding().padding(.leading, -35)
                                                Text("Evaluate Your Main Feelings \nEvery Day.").font(.system(size: 15)).multilineTextAlignment(.leading)
                                            }.frame(width:.infinity ,alignment: .leading).accentColor(.black).padding(.leading, -70).padding(.top,-30)
                                        }
                                    )
                            }
                            
                        }.padding(.top,30).padding(.bottom,30)

                        VStack{
                            NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true)) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 200)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        ZStack {
                                            Image("colorStack")
                                                .resizable()
                                                .frame(width: 120, height: 190)
                                                .padding(.leading,170)
                                            VStack{
                                                Text("Set Emotions").font(.system(size: 25,weight: .semibold)).padding().padding(.leading, -35)
                                                Text("Define Your Personal Emotions \nAcording to Colors.").font(.system(size: 15)).multilineTextAlignment(.leading)
                                                    .padding(.leading, 30)
                                            }.frame(width:.infinity ,alignment: .leading).accentColor(.black).padding(.leading, -80)
                                        }
                                    )
                            }
                        }
                    }
                    
                }
            }
        }
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CardModel {
    let imageName: String
    let title: String
    var isClicked: Bool = false
    let settings: UserSettings
//    @StateObject var settings: UserSettings
    
    @ViewBuilder
    func view() -> some View {
        if self.title == "Emotion Evaluate" {
            EmotionEvaluation()
        } else {
            // Add code for other views here
        }
    }
}

class CardViewModel: ObservableObject {
    let settings = UserSettings()

    @Published var cardData: [CardModel] = [
        CardModel(imageName: "red", title: "Emotion Evaluate", settings: UserSettings()),
        CardModel(imageName: "blue", title: "dsfa", settings: UserSettings()),
        CardModel(imageName: "yellow", title: "fadfakl", settings: UserSettings()),
        CardModel(imageName: "green", title: "fadfakl", settings: UserSettings())
    ]

}
