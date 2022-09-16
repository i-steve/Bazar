//
//  CartViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

class CartViewController: UIViewController {
    
    
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
        
        cell.cartNameLabel.text = "iPhone 14"
        cell.cartPriceLabel.text = "$"+"899"

        return cell
    }

}
    
