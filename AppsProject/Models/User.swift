
import Foundation
struct User: Decodable {
    let name: String
    let lastName: String
    let phone: String
    let email: String
    let birthday: String
    let adress: String

    enum CodingKeys: String, CodingKey {
        case name
        case lastName = ""
        case phone
        case email
        case birthday
        case adress

    }
}
