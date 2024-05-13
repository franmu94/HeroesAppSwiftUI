//
//  EnlaceCreacionView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 19/4/24.
//

import SwiftUI

struct EnlaceCreacionView: View {
    var body: some View {
        VStack {
            Image(systemName: "figure")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.9))
                .mask {
                    Circle()
                        .frame(width: 250)
                        .shadow(radius: 100)
                }

                .background {
                    Image(systemName: "hammer.fill")
                        .foregroundColor(.gray.opacity(0.8))
                        .offset(CGSize(width: -20.0, height: -30.0))
                }
                
            Button {
                
            } label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
          }
        
        
    }
}

#Preview {
    EnlaceCreacionView()
}
