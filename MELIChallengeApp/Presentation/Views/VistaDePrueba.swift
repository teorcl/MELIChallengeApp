//
//  VistaDePrueba.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import SwiftUI

struct VistaDePrueba: View {
    
    @ObservedObject  var viewModel: ProductViewModel
    @State private var searchText = ""
    @State private var showingPopup = false
    @State var isPresented: Bool = false
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            TextField("Ingrese una URL", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                isPresented = true
            } label: {
                Label("Buscar", systemImage: "line.diagonal.arrow")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            
            Spacer()
        }.fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: {
            NavigationView {
                List {
                    ForEach(viewModel.productsPresentable, id: \.title) {productRepresentable in
                        
                        NavigationLink(destination: ProductDetailView(product: productRepresentable)){
                            RowView(product: productRepresentable)
                        }
                    }
                }.toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            isPresented = false
                            searchText = ""
                        } label: {
                            Label("Volver", systemImage: "chevron.backward")
                        }
                        
                    }
                }
                .navigationTitle("Productos")
                .navigationBarTitleDisplayMode(.inline)
            }.onAppear{
                viewModel.search(product: searchText)
            }
        })
    }
    
}
