// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct BolosData: Codable {
    let bolos: [Bolo]
    enum CodingKeys: String, CodingKey {
        case bolos
    }
}

// MARK: - Bolo
struct Bolo: Codable {
    let nome, sabor, preco, descricao: String
    let imagem: String
    enum CodingKeys: String, CodingKey {
        case nome = "nome"
        case sabor = "sabor"
        case preco = "preco"
        case descricao = "descricao"
        case imagem
    }
}
