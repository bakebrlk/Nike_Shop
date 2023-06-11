//
//  OrderHistory.swift
//  Nike Shop
//
//  Created by bakebrlk on 11.06.2023.
//

import UIKit
import SnapKit
import Foundation

class OrderHistory: UIViewController {
    
    static var ListHistory = [Post].self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        navigationItem.title = "Order History"
    }
}



class HistoryCell: UITableViewCell {
    
    private var count = 0
    private var totalPrice = 0
    private var order = 1
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(count: Int, totalPrice: Int){
        self.totalPrice = totalPrice
        self.count = count
        
        title.text = "Order - \(order)"
        order += 1
        finalLabel.text = "\(count) item • $\(totalPrice)"
        
        setUI()
    }
    
    private func setUI(){
        self.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.top).offset(100)
        }
        
        view.addSubview(img)
        
        img.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(img.snp.leading).offset(120)
        }
        
        view.addSubview(secView)
        
        secView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(img.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        secView.addSubview(title)

        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(60)
            make.bottom.equalTo(title.snp.top).offset(22)
        }
        
        secView.addSubview(date)
        date.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(2)
            make.bottom.equalTo(date.snp.top).offset(16)
        }
        
        secView.addSubview(finalLabel)
        
        finalLabel.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(12)
        }
        
        view.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.leading.equalTo(secView.snp.trailing)
            make.centerY.equalToSuperview()
        }
    }
    private var view: UIView = {
        let v = UIView()
        return v
    }()
    
    private var secView: UIView = {
        let v = UIView()
        return v
    }()
    
    private var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "history"))
        return img
    }()
    
    private var title: UILabel = {
        let lb = UILabel()
        lb.font = .boldSystemFont(ofSize: 17)
        lb.text = "Order - "
        return lb
    }()
    
    private var date: UILabel = {
        let dt = UILabel()
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yyyy"
        dt.text = format.string(from: Date())
        dt.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        dt.font = .systemFont(ofSize: 12)
        return dt
    }()
    
    private var finalLabel: UILabel = {
        let lb = UILabel()
        lb.font = .boldSystemFont(ofSize: 12)
        return lb
    }()
    
    private var btn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.tintColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        return btn
    }()
}
