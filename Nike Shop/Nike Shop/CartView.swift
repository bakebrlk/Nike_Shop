//
//  CartView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class CartView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
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
        
    }
    
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
