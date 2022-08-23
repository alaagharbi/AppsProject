import Foundation
struct BookImage : Decodable {
    let smallThumbnail: String
    let thumbnail: String
    enum CodingKeys: String, CodingKey {
        case smallThumbnail = "smallThumbnail"
        case thumbnail = "thumbnail"
    }
}
