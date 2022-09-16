//
//  CartViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

class CartViewController: UIViewController {
    
    var productModel:[ProductModel] = [ProductModel]()
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("cart -> \(cartArrayProductId)")
        
        cartTableView.dataSource = self
        cartTableView.delegate = self

        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}




// MARK: - Delegate,DataSource
extension CartViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArrayProductId.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        
        cell.cartNameLabel.text = productModel[1].title
        cell.cartPriceLabel.text = "$"+String(productModel[1].price)
        cell.cartProductImage.loadFrom(URLAddress: productModel[1].image)

        return cell
    }

}
    
