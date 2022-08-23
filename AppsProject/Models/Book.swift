import Foundation

struct Book: Decodable {
    //    let id: String
    let title: String
    //    let authors:[String]
    //    let description: String
    let subtitle: String?
    //   let publishedDate: String
    let imageURL: BookImage
    //   let url: String
    enum CodingKeys: String, CodingKey {
        // case id
        case title = "title"
        //        case publishedDate = "publishedDate"
        //  case description = "description"
        //       case authors
        case subtitle = "subtitle"
        case imageURL = "imageLinks"
        //     case url
    }
}
