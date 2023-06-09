//
//  CartView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class CartView: UIViewController{
    
    static var Cart: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        CartView.Cart.append(Post(imgName: "1", title: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251))
        
        CartIsEmpty()
        
        navigationItem.title = "Cart"
        view.backgroundColor = .white
        view.addSubview(img)
        
        view.addSubview(mainLable)
        
        mainLable.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(36)
        }
        
        view.addSubview(btn)
        
        setBtn(btn: btn, view: view)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartCell.self, forCellReuseIdentifier: "CartCell")
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
    func CartIsEmpty(){
        if CartView.Cart.isEmpty {
            tableView.isHidden = true
            btn.isHidden = true
            mainLable.isHidden = false
            label.isHidden = false
            
        }else{
            mainLable.isHidden = true
            label.isHidden = true
            tableView.isHidden = false
            btn.isHidden = false
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let btn: UIButton = {
        let btn = btn(text: "Confirm Order")
        return btn
    }()
    
    private let img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "v5"))
        return img
    }()
    
    private let mainLable: UILabel = {
        let main = UILabel()
        main.text = "Cart is empty"
        main.font = .boldSystemFont(ofSize: 28)
        return main
    }()
    
    private let label: UILabel = {
        let main = UILabel()
        main.text = "Find interesting models in the Catalog."
        return main
    }()
}

extension CartView: UITableViewDelegate, UITableViewDataSource, PostCellDelegate {
    
    
    func deleteButtonTapped(cell: CartCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        CartView.Cart.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
        
        CartIsEmpty()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartView.Cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell else { return UITableViewCell() }
        cell.delegate =  self
        cell.configureView(post: CartView.Cart[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func delete(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {

        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, _) in
            guard let self = self else { return }
            CartView.Cart.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
        return action
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = self.delete(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}
