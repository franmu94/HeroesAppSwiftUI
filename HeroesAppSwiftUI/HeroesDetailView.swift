//
//  HeroesDetailView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import SwiftUI



struct HeroesDetailView: View {
    @ObservedObject var vm = HeroesViewModel()
    @State var showHeroesList = false
    @State var showHeroesComp = false
    
    @State var prueba = 1
    let heroe1: Heroe
    @State var heroe2: Heroe?
    
    var colorFondo: Color {
        //calculateAverageColor(of: UIImage(named: heroe1.imagen)!)!.opacity(0.6)
        
        UIImage(named: heroe1.imagen)?.AverageColor() ?? .white
    }
    var gradient: LinearGradient {
        LinearGradient(colors: [colorFondo, .white], startPoint: .top, endPoint: .bottom)
    }
    
    var gradientReversed: LinearGradient {
        LinearGradient(colors: [.white, colorFondo], startPoint: .top, endPoint: .bottom)
    }
    
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                
                
                VStack {
                    Image(heroe1.imagen)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250,height: 250)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                        .padding(.top)
                    Text("- Poderes -")
                    HStack{
                        AvatarListaPoderes(heroe: heroe1)
                    }
                    HStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        LabeledContent("Nombre:", value: heroe1.nombreReal).padding()
                            .font(.headline)
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }
                    HStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        LabeledContent("Año de nacimiento:", value: "\(heroe1.añoNacimiento)").padding()
                            .font(.headline)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .center) {
                            Text("Historia")
                                .font(.headline)
                            Text(heroe1.Historia)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                    Spacer()
                    
                    Button {
                        showHeroesList = true
                    } label: {
                        VStack {
                            Text("Comparar")
                            HStack{
                                Image(systemName: "figure.arms.open")
                                Image(systemName: "v.circle")
                                Image(systemName: "figure")
                            }
                        }
                    }
                    Spacer()
                }
                
                
                
            }
            .scrollBounceBehavior(.basedOnSize)
            .safeAreaInset(edge: .top, spacing: 0) {
                Rectangle()
                    .fill(.background)
                    .opacity(0.8)
                    .frame(height: 0)
                
            }
            .ignoresSafeArea()
            .sheet(isPresented: $showHeroesList, content: {
                List {
                    ForEach(vm.heroes) { heroe in
                        HeroesRow(heroe: heroe)
                            .onTapGesture {
                                heroe2 = heroe
                                showHeroesList = false
                                showHeroesComp = true
                            }
                        
                    }
                }
            })
            .navigationDestination(isPresented: $showHeroesComp, destination: {
                DetailCompared(heroe1: heroe1, heroe2: heroe2 ?? heroe1)
            })
            
            .navigationTitle(heroe1.apodo)
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button {
                    showHeroesList = true
                } label: {
                    Text("Comparar")
                }
            }
        }
        .background {
            gradient
        }

    }
}

#Preview {
    NavigationStack {
        HeroesDetailView(heroe1: .preview)
    }
}


