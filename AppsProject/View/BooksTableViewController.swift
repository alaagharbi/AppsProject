//
//  BooksTableViewController.swift
//  AppsProject
//
//  Created by ag mac on 26/8/2022.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage

class BooksTableViewController: UITableViewController {
    let disposeBag = DisposeBag()
    let tems = BooksAPI.shared.dic

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var describeLB: UILabel!
    @IBOutlet weak var imageViewLB: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewList.delegate = nil
        self.tableViewList.dataSource = nil
 //       self.tableViewList = Bundle.main.loadNibNamed("TableViewController", owner: nil, options: nil)?.first as! TableViewController

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
               //     print(foodObject.item)
              //    print("*******-------")
                    let bookitem = BooksAPI.shared.getBook(val: String(book.item))
//                    print(a)
       //             Taks.init(datetime: a["datetime"]!, temperature: a["temperature"]!, icon: ss)

                   // let firt = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?.first as! DetailView

                 //   self.addSubview(firt)
                 })
                .disposed(by: disposeBag)

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
