//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/04/11.
//

import SwiftUI

struct EmotionCleaner: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            
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
            Text("Emotion evaluation").padding().frame(maxWidth: .infinity).font(.system(size: 20,weight: .semibold))
        }
    }
}

struct EmotionCleaner_Previews: PreviewProvider {
    static var previews: some View {
        EmotionCleaner()
    }
}
