//
//  CartViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

class CartViewController: UIViewController {
    
    var cartModel: [ProductModel] = []
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.dataSource = self
        cartTableView.delegate = self

        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        let sumOfPrice = cartArrayProductPrice.reduce(0, +)
        totalPriceLabel.text = "  Total - $\(String(sumOfPrice))  "
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}




// MARK: - Delegate,DataSource
extension CartViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArrayProductTitle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        
        cell.cartNameLabel.text = cartArrayProductTitle[indexPath.row]
        cell.cartPriceLabel.text = String(cartArrayProductPrice[indexPath.row])
        cell.cartProductImage.loadFrom(URLAddress: cartArrayProductImage[indexPath.row])

        return cell
    }

}
    
