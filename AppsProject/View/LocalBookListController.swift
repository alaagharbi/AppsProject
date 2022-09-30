import UIKit
import Alamofire

class LocalBookListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tableView: UITableView = {
            let table = UITableView()
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cells")
            return table
            }()
        private var models = [ElecronicBook]()
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "CoreData to do List"
            view.addSubview(tableView)
            showAll()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.frame = view.bounds
          //  navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        }
     @objc private func didTapAdd() {
         
         let alert = UIAlertController(title: "New book ", message: "Entze new Book", preferredStyle: .alert)
         alert.addTextField(configurationHandler: nil)
         alert.addAction(UIAlertAction(title: "submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first,
                  let text = field.text, !text.isEmpty else {
                 return
             }
             self?.createItem(title: text)
         }))
         present(AddBookViewController(), animated: false)
        }
        
        func showAll() {
            do {
                models = try context.fetch(ElecronicBook.fetchRequest())
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch  {
            }
        }
        func createItem(title : String){
            let newItem = ElecronicBook(context: context)
            newItem.title = title
            newItem.author = "ezio"
         //   newItem.starting_date = Date()
            newItem.progess = "0"
            newItem.ebooktype?.typename = "roman"
        
            do {
                try context.save()
                showAll()
            } catch {
                
            }
        }
        func deleteItem(item : ElecronicBook){
            context.delete(item)
            do {
                try context.save()
                showAll()

            } catch  {
                
            }
        }
        func updateItem(item : ElecronicBook ,newTitle : String){
            item.title = newTitle
            do {
                try context.save()
                showAll()
            } catch  {
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let item = models[indexPath.row]
            let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            sheet.addAction(UIAlertAction(title: "edit", style: .default, handler:{ _ in
                                          let alert = UIAlertController(title: "edit Book", message: "enter new title", preferredStyle: .alert)
                                          alert.addTextField(configurationHandler: nil)
                                          alert.textFields?.first?.text = item.title
                                          alert.addAction(UIAlertAction(title: "submit", style: .cancel, handler: {
                                              [weak self] _ in guard let field = alert.textFields?.first, let newTitle = field.text,!newTitle.isEmpty else {
                    return
                }
                                              self?.updateItem(item: item, newTitle: newTitle)
                                          }))
                self.present(alert, animated: true)
            }))
            sheet.addAction(UIAlertAction(title: "delete", style: .destructive, handler: {[weak self] _ in self?.deleteItem(item: item)}))
            present(sheet, animated: true)
        }
}
