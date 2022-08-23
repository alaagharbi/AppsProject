
import UIKit
import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage


class TableViewController: UIView {
    @IBOutlet weak var listedesArticlesTV: UITableView!
  
    let disposeBag = DisposeBag()
    let tems = BooksAPI.shared.dic
    override func awakeFromNib() {
        super.awakeFromNib()
        self.listedesArticlesTV.register(UINib(nibName: "SingleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
 
        let _ = tems.asObservable().bind(to: listedesArticlesTV.rx.items(cellIdentifier: "cell",cellType: SingleTableViewCell.self)){
            (tv,tableViewItem,cell) in
       if let bookObserver = tableViewItem.value as? Dictionary<String,String> {
       let downloadURL = URL(string: bookObserver["image"]!)!
        
        //
     
     //   cell.productImage.af.setImage(withURLRequest: NSURL(fileURLWithPath: ttq["image"]!) as! URLRequestConvertible)
      //  let url = URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/12/11/naturo-monkey-selfie.jpg?w968h681")
      //  let imageView = UIImageView(frame: frame)
        let  stringUrl:String = bookObserver["image"]!
        print("*********-----------*")
        print(bookObserver["image"])
        print("---------------------")
        let url = URL(string: bookObserver["image"]!)
        print(url)
        cell.productImage.af.setImage(withURL: url!)
        let imageUrl = String(bookObserver["image"]!)
        print(imageUrl)
      //  let stringURL = URL(string: imageUrl)
    //    cell.productImage.downloadImage(from: stringURL!)
        cell.productTitle.textColor = UIColor.blue
        cell.productTitle.text = bookObserver["title"]
        cell.Description.text = bookObserver["subtitle"]

          }
        }
        print("-------")
        BooksAPI.shared.getBooks()
        print("*******")
        listedesArticlesTV.rx.itemSelected
                 .subscribe(onNext: {
                 book in
               //     print(foodObject.item)
              //    print("*******-------")
                    let bookitem = BooksAPI.shared.getBook(val: String(book.item))
//                    print(a)
       //             Taks.init(datetime: a["datetime"]!, temperature: a["temperature"]!, icon: ss)

                    let firt = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?.first as! DetailView

                    self.addSubview(firt)
                 })
                .disposed(by: disposeBag)
    }}
extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }

}
