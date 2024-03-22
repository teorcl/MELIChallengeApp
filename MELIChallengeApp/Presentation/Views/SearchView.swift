//
//  SearchView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            VStack {
                                TextField("Buscar productos", text: $searchText)
                                    .padding(.leading, 20)
                                    .padding(.vertical, 10)
                                    .padding(.trailing, 20)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 15)
                                
                                Button(action: {
                                    // Aquí podrías ejecutar la búsqueda según el texto ingresado
                                    // Por ahora, simplemente navegamos a la lista de productos
                                    self.isSearching = true
                                }) {
                                    Text("Buscar")
                                        .padding(.trailing, 20)
                                }
                            }
                            .padding(.bottom, 10)
            
        }
    }
}

#Preview {
    SearchView()
}
