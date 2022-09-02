//
//  BooksAPI.swift
//  AppsProject
//
//  Created by Alaa Gharbi on 8/14/22.
//

// google books api key = https://console.cloud.google.com/apis/dashboard?project=firebesprojtest
import Foundation
import Alamofire
import RxSwift
import RxCocoa

class BooksAPI{
    static let shared = BooksAPI()
       var URL = ""
       var i = -1
       let dic = BehaviorRelay<Dictionary<String,Dictionary<String,String>>>(value: [:])
       
       
      private init() {
         //  URL = "https://www.googleapis.com/books/v1/volumes?q=harry+potter"
           URL = "https://www.googleapis.com/books/v1/volumes?q=flowers&key=AIzaSyDGAJwt_KY9lhuvSk61F9fwPbsJ-I6EdmA"
       }
       func getBooks(){
        var observer = [String : Dictionary<String,Dictionary<String,String>>]()
        var obs = [String : Dictionary<String,String>] ()
        var dys = [String : String] ()
           AF.request(URL)
             .validate()
               .responseDecodable(of: Books.self) { (response) in
               guard let books = response.value else {
                       return
               }

            do{
                for book in books.items{
                    self.i = self.i+1
                    dys["link"] = book.selfLink
                    dys["title"] = book.volumeInfo.title
                   // dys["date"] = book.volumeInfo.publishedDate
                  
                    dys["image"] =   self.addSinString(string: book.volumeInfo.imageURL.thumbnail)
                    dys["subtitle"] = book.volumeInfo.subtitle
                    dys["description"] = book.volumeInfo.description

              //      print(book.volumeInfo.publishedDate)
                    print("-----------")
                    print(dys["image"]!)
                    print("------------------")
                    print(dys["subtitle"])
                    print("///////////////////")
                    print(dys["description"])
                    // dys["authors"] = book.volumeInfo.authors[0]
                   //  dys["description"] = book.volumeInfo.description
                    // obs["author"] = book.temp
                    // obs["image"] = String(day.icon)
                    obs[String(self.i)] = dys
                   // observer[String(self.i)] = obs
                   }
                print(obs)
                print("-------")
               }
                   self.dic.accept(obs)
                   print("1111111")
                   
               }
        
       }
    func  getBook(val : String) -> Dictionary<String,String>
{
        return     self.dic.value[val]!

    }
    func addSinString(string: String) -> String{
       var string1 = string
    ///let size = string.count
        //let string2 = string.suffix(size - 4)
        let ch :Character = "s"
        let i = string.index(string.startIndex, offsetBy: 4)
        string1.insert(ch, at:  i)
    return string1
    }
}
