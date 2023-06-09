//
//  CatalogView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class CatalogView: UIViewController{
    
    static var List: [Post] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        
        tableData()
            
        navigationItem.title = "Hello, Sneakerhead!"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private func tableData(){
        CatalogView.List.append(Post(imgName: "1", title: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251))
        CatalogView.List.append(Post(imgName: "2", title: "Jordan", description: "кроссовки Air Jordan 1 Retro High OG Chicago Lost and Found", price: 1199))
        CatalogView.List.append(Post(imgName: "3", title: "Off-White", description: "Кроссовки Off-Court 3.0", price: 1051))
        CatalogView.List.append(Post(imgName: "4", title: "Jordan", description: "кроссовки Air Jordan 3 Retro OG", price: 999))
        CatalogView.List.append(Post(imgName: "5", title: "New Balance", description: "Кеды с принтом граффити", price: 799))
        CatalogView.List.append(Post(imgName: "6", title: "Jordan", description: "кроссовки Air Jordan 1 Mid", price: 1399))
        CatalogView.List.append(Post(imgName: "7", title: "Nike", description: "Кеды с принтом граффити", price: 1299))
        CatalogView.List.append(Post(imgName: "8", title: "New Balance", description: "кроссовки с нашивкой-логотипом", price: 1251))
    }
}

extension CatalogView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalPosts = CatalogView.List.count
        let numberOfSections = (totalPosts + 1) / 2
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
                return UITableViewCell()
            }
        
            if index < CatalogView.List.count {
                let post = CatalogView.List[index]
                
                let secondPost = CatalogView.List[index + 1]
                cell.configurView(post1: post, post2: secondPost)
                
                index += 2
            }
            
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 282
    }
}

