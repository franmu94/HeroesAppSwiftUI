//
//  DetailCompared.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 10/4/24.
//

import SwiftUI

struct DetailCompared: View {
    let heroe1: Heroe
    let heroe2: Heroe
    
    var colorFondo1: Color {
        UIImage(named: heroe1.imagen)?.AverageColor() ?? .white
    }
    var gradient1: LinearGradient {
        LinearGradient(colors: [colorFondo1.opacity(0.7), .white], startPoint: .top, endPoint: .bottom)
    }
    
    var colorFondo2: Color {
        //calculateAverageColor(of: UIImage(named: heroe1.imagen)!)!.opacity(0.6)
        
        UIImage(named: heroe2.imagen)?.AverageColor() ?? .white
    }
    var gradient2: LinearGradient {
        LinearGradient(colors: [colorFondo2.opacity(0.7), .white], startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0){
                gradient1
                gradient2
            }
            ScrollView {
                VStack{
                    HStack{
                        Spacer()
                        VStack {
                            Image(heroe1.imagen)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 125)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            Text(heroe1.apodo)
                                .multilineTextAlignment(.center)
                                .frame(width: 110)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("V.S")
                            .italic()
                            .padding(8)
                            .background {
                                Circle()
                                    .foregroundStyle(Color(white: 0.7))
                            }
                        Spacer()
                        
                        VStack {
                            Image(heroe2.imagen)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 125)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            Text(heroe2.apodo)
                                .multilineTextAlignment(.center)
                                .frame(width: 110)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    //Spacer()
                    VStack {
                        HStack{
                            Text("Edad")
                                .frame(maxWidth: .greatestFiniteMagnitude)
                                .background {
                                    Color(white: 0.74)
                                }
                            
                        }
                        
                        
                        HStack{
                            Spacer()
                            Text("\(heroe1.edad)")
                            Spacer()
                            Spacer()
                            Text("\(heroe2.edad)")
                            Spacer()
                        }
                        .padding(.bottom)
                        
                    }
                    .padding(.top)
                    
                    VStack {
                        HStack{
                            Text("Poderes")
                                .frame(maxWidth: .greatestFiniteMagnitude)
                                .background {
                                    Color(white: 0.74)
                                }
                            
                        }
                        HStack(alignment: .top){
                            Spacer()
                            VStack{
                                ForEach(heroe1.poderes, id: \.self) { poder in
                                    VStack{
                                        Image(poder.rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 65)
                                        
                                    }
                                }
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                ForEach(heroe2.poderes, id: \.self) { poder in
                                    VStack{
                                        Image(poder.rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 65)
                                        
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DetailCompared(heroe1: .preview, heroe2: .preview2)
}
