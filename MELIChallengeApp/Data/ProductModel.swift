//
//  ProductModel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import Foundation

struct Produc {
    let title: String
    let imageUrl: String
    let price: Double
    let images: [String]
}

extension Produc {
    static func fetchProducts() -> [Produc] {
        return [
            Produc(title: "Peluche", imageUrl: "https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg", price: 2000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                     "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                     "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"] ),
            Produc(title: "Carro", imageUrl: "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg", price: 10500, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                    "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                    "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),
            Produc(title: "Balon", imageUrl: "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg", price: 80000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                          "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                          "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"] ),
            Produc(title: "Celular", imageUrl: "https://www.grupomansion.com/16204-large_default/celular-samsung-galaxy-a24-4g-128gb-plateado.jpg", price: 1500000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                                             "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                                             "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),
            Produc(title: "Tablet", imageUrl: "https://img.global.news.samsung.com/cl/wp-content/uploads/2019/07/Product-Image-Galaxy-Tab-S6-2.jpg", price: 1000000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                                              "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                                              "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),Produc(title: "Peluche", imageUrl: "https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg", price: 2000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                     "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                     "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"] ),
            Produc(title: "Carro", imageUrl: "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg", price: 10500, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                    "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                    "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),
            Produc(title: "Balon", imageUrl: "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg", price: 80000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                          "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                          "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"] ),
            Produc(title: "Celular", imageUrl: "https://www.grupomansion.com/16204-large_default/celular-samsung-galaxy-a24-4g-128gb-plateado.jpg", price: 1500000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                                             "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                                             "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),
            Produc(title: "Tablet", imageUrl: "https://img.global.news.samsung.com/cl/wp-content/uploads/2019/07/Product-Image-Galaxy-Tab-S6-2.jpg", price: 1000000, images: ["https://toccodeamore.com/wp-content/uploads/2021/05/2-23.jpg",
                                                                                                                                                                              "https://www.las2orillas.co/wp-content/uploads/2023/12/nuevo-carro-xiaomi.jpg",
                                                                                                                                                                              "https://www.coarte.net/5458-large_default/balon-futbol-clasico.jpg"]),
        ]
    }
}
