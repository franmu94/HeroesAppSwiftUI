//
//  CreacionEquipoView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 6/5/24.
//

import SwiftUI

struct CreacionEquipoView: View {
    
    @ObservedObject var vm = HeroesViewModel()
    @ObservedObject var evm: EquiposViewModel

    @State var listaHeroes: [Heroe] = []
    
    @FocusState private var amountIsFocused: Bool
    
    //@ObservedObject var evm: EquiposViewModel
    @State var nombre: String = ""
    @State var alertMessage: String = ""

    @State var showCustom = false
    @State var mensajeAlerta: String = ""

    @Environment(\.dismiss) private var dismiss

    
    var count = 0
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading) {

                        TextField("Nuevo Equipo", text: $nombre)
                            .textInputAutocapitalization(.words)
                            .focused($amountIsFocused)

                    }
                } header: {
                    Text("Nombre")
                        .bold()
                }
                Section{
                    List{
                        ForEach(vm.heroes) { heroe in
                            Button {
                                if !listaHeroes.contains(heroe) && listaHeroes.count <= 5 {
                                    listaHeroes.append(heroe)
                                } else {
                                    showCustom = true
                                }
                                
                            } label: {
                                HeroesRow(heroe: heroe)
                            }
                            .overlay {
                                if let n = listaHeroes.firstIndex(of: heroe) {
                                    if n == 0 {
                                        Text("Capitán")
                                    } else {
                                        Text("\(n+1)º")
                                    }
                                }
                            
                            }
                        }
                    }
                } header: {
                    Text("Capitan e integrantes (6 en total)")
                        .bold()
                }
            }
            .navigationTitle("Nuevo equipo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        if !evm.equipos.map({ $0.name }).contains(nombre) && listaHeroes.count == 6 && nombre != ""{
                            let nuevoEquipo = EquipoModel(name: nombre, members: listaHeroes)
                            evm.equipos.append(nuevoEquipo)
                            print(evm)
                            dismiss()
                            print(evm.equipos.map({  $0.name   }))

                        } else {
                            alertMessage = ""
                            if evm.equipos.map({ $0.name }).contains(nombre) {
                                alertMessage.append("El nombre ya existe. ")
                            }
                            if listaHeroes.count < 6 {
                                alertMessage.append("Selecciona 6 Heroes. ")
                            }
                            if nombre == "" {
                                alertMessage.append("Escribe un nombre. ")
                            }
                            showCustom = true
                        }

                    } label: {
                        Text("Finalizar")
                            .opacity(listaHeroes.count > 5 ? 1 : 0.4)
                            
                    }
                }
                
                ToolbarItem(placement: .keyboard) {
                    VStack(alignment: .trailing, spacing: 0) {
                        Button {
                            amountIsFocused = false
                        } label: {
                            Text("Done")
                                .bold()
                        }
                    }
                }
                
            }
            

        }
        .alert(alertMessage, isPresented: $showCustom) {
                    Button("OK", role: .cancel) { }
                }
        
    }
}

#Preview {
    CreacionEquipoView(evm: EquiposViewModel())
}
