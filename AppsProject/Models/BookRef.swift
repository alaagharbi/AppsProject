import Foundation

struct BookRef : Decodable{
    let selfLink: String
    let volumeInfo : Book
    enum CodingKeys: String, CodingKey {
        case selfLink = "selfLink"
        case volumeInfo = "volumeInfo"
    }
}

      
