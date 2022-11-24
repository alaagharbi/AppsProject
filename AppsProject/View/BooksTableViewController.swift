
import UIKit
import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage

class BooksTableViewController: UITableViewController {
    let disposeBag = DisposeBag()
    let tems = BooksAPI.shared.dic
    var collapseDetailViewController: Bool = true

 
    var bookitem : Dictionary<String,String> = [:]
    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var describeLB: UILabel!
    @IBOutlet weak var imageViewLB: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewList.delegate = nil
        self.tableViewList.dataSource = nil
        self.tableViewList.register(UINib(nibName: "SingleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        let _ = tems.asObservable().bind(to: tableViewList.rx.items(cellIdentifier: "cell",cellType: SingleTableViewCell.self)){
            (tv,tableViewItem,cell) in
       if let bookObserver = tableViewItem.value as? Dictionary<String,String> {
       let downloadURL = URL(string: bookObserver["image"]!)!
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
        tableViewList.rx.itemSelected
                 .subscribe(onNext: {
                 book in
                  print(book.item)
                  print("*******-------")
                   let  bookitem = BooksAPI.shared.getBook(val: String(book.item))
                     print(bookitem)
                    //    let detailVC = DetailViewController()
                            
                    self.showDetailViewController(DetailBookViewController(), sender: nil)
             
                     //           Taks.init(datetime: a["datetime"]!, temperature: a["temperature"]!, icon: ss)
              // let firt = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?.first as! DetailView
              //   self.addSubview(firt)
                 })
                .disposed(by: disposeBag)
    }

  

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)
    {
        self.collapseDetailViewController = false
    }
}
