//
//  ViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit


var cartArrayProductTitle:[String] = []
var cartArrayProductPrice:[Double] = []
var cartArrayProductImage:[String] = []

let BaseURL = "https://fakestoreapi.com/"


class ViewController: UIViewController {
    
    var productModel:[ProductModel] = []
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        fetchProducts(urlString: BaseURL + "products")
    }

    
    ///cart-btn-pressed
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        
        let cartPage = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController" ) as! CartViewController
        self.present(cartPage, animated: true, completion: nil)
    }
  
    

   func fetchProducts(urlString: String){
        
        let url = URL(string: urlString)
        
        let sessionTask = URLSession.shared.dataTask(with: url!) {  data, responce, error in
            if let data = data {
                
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    self.productModel = Parser.ParseProduct(apiResponse: JSON as AnyObject)
                    
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
        
        ///add target
        cell.addToCart.tag = indexPath.row
        cell.addToCart.addTarget(self, action: #selector(addCartBtnAction(_sender:)), for: UIControl.Event.touchUpInside)

        return cell
    }
    
    ///Detail-View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailPage = self.storyboard?.instantiateViewController(withIdentifier:"DetailViewController" ) as! DetailViewController
        self.present(detailPage, animated: true, completion: nil)
        
        detailPage.detailImage.loadFrom(URLAddress: productModel[indexPath.row].image)
        detailPage.detailProductNameLabel.text = productModel[indexPath.row].title
        detailPage.detailProductPriceLabel.text = "$"+String(productModel[indexPath.row].price)
        detailPage.detailProductDescriptionLabel.text = productModel[indexPath.row].description
        
    }
    
    
    
    
    ///add-to-cart
    @objc func addCartBtnAction(_sender :UIButton) {
        //print(_sender.tag)
        
        cartArrayProductTitle.append(productModel[_sender.tag].title)
        cartArrayProductPrice.append(productModel[_sender.tag].price)
        cartArrayProductImage.append(productModel[_sender.tag].image)
       
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




// MARK: - UIView

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
