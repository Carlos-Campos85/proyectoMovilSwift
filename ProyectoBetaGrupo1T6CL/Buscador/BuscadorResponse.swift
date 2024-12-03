//
//  BuscadorResponse.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/30/23.
//

import Foundation


struct BuscadorResponse: Decodable {
    let total: String
    let page: String
    let book: [LibroResponse]
}

struct LibroResponse: Decodable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}

// Página de conversor de JSON a Struct en Swift https://app.quicktype.io/
struct BookResponse: Decodable {
    let total, page: String
    let books: [Book]
}

struct Book: Decodable {
    let title, subtitle, isbn13, price: String
    let image: String
    let url: String
}
