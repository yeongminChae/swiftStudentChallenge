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
                        
//                        Rectangle()
//                            .fill(Color(.white))
//                            .overlay(
//                            Text("Choose What You Want").background(Color(.white)).font(.system(size: 20,weight: .semibold)).padding(.top,-180).padding(.leading,20))
//                            .onTapGesture {
//                                isClicked1 = false
//                                isClicked2 = false
//                            }
                        
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
                        
//                        LazyHStack {
//                            ForEach(0..<3, id: \.self)  { i in
//
//                            }.animation(Animation.spring())
//                        }
//                        .modifier(ScrollingHStackModifier(items: 3 , itemWidth: 250, itemSpacing: 30)).padding(.top,-40)
//                            .offset(x:geometry.size.width/(-10) , y:geometry.size.height/(500))
                    }.onTapGesture {
                        isClicked1 = false
                        isClicked2 = false
                    }
                    
                    ZStack{
                        
                        // 버튼 밖으로 빼기.
                        
                        Rectangle()
                            .overlay(Image("people2").resizable().frame(height:300)).frame(width: UIScreen.main.bounds.width, height: 300)
                            .padding(.bottom,20)
                        
                        if settings.stampArr.count == 6 {
//                            NavigationLink(destination: EmotionDefineCheck().navigationBarBackButtonHidden(true),
//                            isActive: $shouldNavigateToCheck) {
//                                EmptyView()
//                            }
//
//                            Button(action: {
//                                shouldNavigateToCheck = true
//                                shouldNavigateToDefine = false
//                            }, label: {
//                                RoundedRectangle(cornerRadius: 20).frame(width:100,height: 60).shadow(radius: 10)
//                                    .overlay(Text("TO CHECK").foregroundColor(Color(.white)))
//                            }
//                            ).offset(x:geometry.size.width/(3.5) , y:geometry.size.height/(9))
                            NavigationLink(destination: EmotionDefine().navigationBarBackButtonHidden(true),
                                isActive: $shouldNavigateToDefine) {
                                EmptyView()
                            }
                            
                            Button(action: {
                                shouldNavigateToCheck = false
                                shouldNavigateToDefine = true
                            }, label: {
                                RoundedRectangle(cornerRadius: 20).frame(width:100,height: 60).shadow(radius: 10)
                                    .overlay(Text("CUSTOM").foregroundColor(Color(.white)))
                            }
                            ).offset(x:geometry.size.width/(3.5) , y:geometry.size.height/(9))
                        }
//                        else {
//
//                        }
                        
                    }
//                    .padding(.leading,160)
                    
                }
//                .offset(x:geometry.size.width/(-1.526) , y:geometry.size.height/(500))
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
