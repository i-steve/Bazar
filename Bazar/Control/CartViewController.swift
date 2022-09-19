//
//  CartViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

var cartProductDic: [String: Int] = [String: Int]()

class CartViewController: UIViewController {
    
    var cartModel: [ProductModel] = []

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.dataSource = self
        cartTableView.delegate = self

        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        ///sum of price in cart
        let sumOfPrice = cartArrayProductPrice.reduce(0, +)
        totalPriceLabel.text = "  Total - $\(String(sumOfPrice))  "
        
        count()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func count(){
        for product in cartArrayProductTitle{
            if cartProductDic[product] == nil{
                cartProductDic[product] = 1
            }else{
                cartProductDic[product]! += 1
            }
        }
    }
}




// MARK: - Delegate,DataSource
extension CartViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArrayProductTitle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        
        let title = cartArrayProductTitle[indexPath.row]
        
        cell.cartNameLabel.text = title
        cell.cartPriceLabel.text = String(cartArrayProductPrice[indexPath.row])
        cell.cartProductImage.loadFrom(URLAddress: cartArrayProductImage[indexPath.row])

        return cell
    }

}
    
