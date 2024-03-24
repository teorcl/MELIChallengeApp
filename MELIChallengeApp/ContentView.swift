//
//  ContentView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI

struct ContentView: View {
    
    let products = Produc.fetchProducts()
    
    var body: some View {
        Home(products: products)
        /*VStack(spacing: 1){
            Carousel(imageUrls: [
                "https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"
            ]).frame(height: 350)
            Text("Hola")
            Text("Hola")
            Text("Hola")
            Text("Hola")
            Text("Hola")
            
        }.padding()*/
    }
}

#Preview {
    ContentView()
}

struct Home: View {
    let products: [Produc] 
    
    var body: some View {
        NavigationView {
            List(products, id: \.title) { product in
//                NavigationLink(destination: ProductDetailView(product: product)){
//                    RowView(product: product)
//                }
            }
            .navigationBarTitle("Productos")
        }
    
    }
}
