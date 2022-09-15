//
//  CartViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var cartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("cart -> \(cartArrayProductId)")
        
        cartTableView.dataSource = self
        cartTableView.delegate = self

        cartTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
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

        let cell = cartTableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        

        return cell
    }

}
    
