
import Foundation
struct User: Decodable {
    let name: String
    let lastName: String
   // let phone: String
    let email: String
  //  let birthday: String
  //  let adress: String

    enum CodingKeys: String, CodingKey {
        case name = "first_name"
        case lastName = "last_name"
    //    case phone
        case email
     //   case birthday
    //    case adress

    }
}
