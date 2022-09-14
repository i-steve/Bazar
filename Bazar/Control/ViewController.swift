//
//  ViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

var productModel:[ProductModel] = [ProductModel]()

var cartModel:[CartModel] = [CartModel]()

class ViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        fetchProducts(urlString: "https://fakestoreapi.com/products")
 
    }
    
    

    
    ///cart-btn-pressed
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        
        let nextpage = CartViewController()
        navigationController?.pushViewController(nextpage, animated: true)
        
    }
  
    
   ///fetchURL
    func fetchProducts(urlString: String){
        
        let url = URL(string: urlString)
        
        let sessionTask = URLSession.shared.dataTask(with: url!) {  data, responce, error in
            if let data = data {
                
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    productModel = Parser.ParseProduct(apiResponse: JSON as AnyObject)
                    
                    DispatchQueue.main.async {
                        self.productTableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
        sessionTask.resume()
    }
}


// MARK: - DataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        cell.productName.text = productModel[indexPath.row].title
        cell.productPrice.text = "$"+String(productModel[indexPath.row].price)
        cell.productImage.loadFrom(URLAddress: productModel[indexPath.row].image)
        
        cell.addToCart.tag = indexPath.row
        cell.addToCart.addTarget(self, action: #selector(addCartBtnAction(_sender:)), for: UIControl.Event.touchUpInside)

        return cell
    }
    
    
    ///add-to-cart-pressed
    @objc func addCartBtnAction(_sender :UIButton) {
        print(_sender.tag)
        let title = productModel[_sender.tag].title
    }
}


// MARK: - Image from URL
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
