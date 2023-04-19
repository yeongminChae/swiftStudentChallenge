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
    @State private var isClicked1 = false
    @State private var isClicked2 = false
    @StateObject var cardViewModel = CardViewModel()
    
    var body: some View {
        NavigationView(content: {
            GeometryReader {geometry in
                VStack {
                    
                    HStack {
                        Text("SNO").frame(maxWidth: .infinity, alignment: .center).font(.system(size: 25,weight: .semibold)).padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                    }
                    ZStack{
                        NavigationLink(destination: cardViewModel.cardData[0].view().navigationBarBackButtonHidden(false)) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 210, height: 170)
                                .shadow(radius: 10)
                                .padding()
                                .overlay(
                                    ZStack {
                                        Image(cardViewModel.cardData[0].imageName)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text(cardViewModel.cardData[0].title)
                                            .padding(.top,130)
                                    }
                                )
                        }
                    
                    }.onTapGesture {
                        isClicked1 = false
                        isClicked2 = false
                    }
                    
//                    ZStack{
                        
                    VStack{
//                        Rectangle()
//                            .overlay(Image("people2").resizable().frame(height:300))
//                            .padding(.bottom,20)
//                        if settings.stampArr.count == 6 {
                        NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true)) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 210, height: 170)
                                .shadow(radius: 10)
                                .padding()
                                .overlay(
                                    ZStack {
                                        Image("people2")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("CUSTOM")
                                            .padding(.top,130)
                                    }
                                )
                        }
                        
//                            NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true),
//                                           isActive: $shouldNavigateToDefine) {
//                                EmptyView()
//                            }
//                            Button(action: {
//                                shouldNavigateToDefine = true
//                            }, label: {
//                                RoundedRectangle(cornerRadius: 20).frame(width:100,height: 60).shadow(radius: 10)
//                                    .overlay(Text("CUSTOM").foregroundColor(Color(.white)))
//                            }
//                            )
//                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 300)
//                    }
                    
                }
            }.onTapGesture {
                isClicked1 = false
                isClicked2 = false
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
