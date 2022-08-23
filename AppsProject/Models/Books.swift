import Foundation
struct Books : Decodable {
    let kind : String
    let totalItems: Int
    let items :[BookRef]
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case totalItems = "totalItems"
        case items = "items"
    }
}
