//
//  MyCustomView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

func btn(text: String) -> UIButton{
    let btn = UIButton()
    btn.setTitle(text, for: .normal)
    btn.backgroundColor = UIColor(named: "black")
    btn.setTitleColor(.white, for: .normal)
    return btn
}

func setBtn(btn: UIButton, view: UIView){
    btn.layer.cornerRadius = 28
    btn.snp.makeConstraints { make in
        make.height.equalTo(54)
        make.bottom.equalTo(view.snp.bottom).offset(-58)
        make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}


var counter : UIView =  {
    let counter = UIView()
    counter.backgroundColor = UIColor(named: "black")
    counter.layer.cornerRadius = 16
    
    counter.snp.makeConstraints { make in
        make.leading.equalToSuperview().offset(16)
        make.trailing.equalToSuperview().offset(-52)
        make.bottom.equalToSuperview().offset(-21)
        make.top.equalToSuperview().offset(10)
    }
    
    let plus = UIButton()
    plus.setTitle("+", for: .normal)
    plus.tintColor = UIColor(named: "white")
    
    counter.addSubview(plus)
    
    let minus = UIButton()
    minus.setTitle("-", for: .normal)
    minus.tintColor = UIColor(named: "white")
    
    counter.addSubview(minus)
    
    var cccc = 1
    
    let countLabel = UILabel()
    countLabel.text = "\(cccc)"
    countLabel.textColor = UIColor(named: "white")
    
    counter.addSubview(countLabel)
    
    countLabel.snp.makeConstraints { make in
        make.center.equalToSuperview()
    }
    
    minus.snp.makeConstraints { make in
        make.leading.equalToSuperview().offset(44)
    }
    
    plus.snp.makeConstraints { make in
        make.trailing.equalToSuperview().offset(-44)
    }
    return counter
}()

struct Post: Decodable, Encodable{
    let imgName: String
    let title: String
    let description: String
    let price: Int
}

class PostCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    func configurView(post: Post){
        img.image = UIImage(named: post.imgName)
        title.text = post.title
        descriptionForPost.text = post.description
        price.text = "$\(post.price)"
    }
    
    private func setUI(){
        self.addSubview(view)
        
        view.addSubview(img)
        
        img.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(img.snp.top).offset(166)
        }
        
        view.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(img.snp.bottom).offset(2)
            make.bottom.equalTo(title.snp.top).offset(18)
        }
        
        view.addSubview(descriptionForPost)
        
        descriptionForPost.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.bottom.equalTo(descriptionForPost.snp.top).offset(16)
        }
        
        view.addSubview(price)
        
        price.snp.makeConstraints { make in
            make.top.equalTo(descriptionForPost.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.bottom.equalTo(price.snp.top).offset(16)
        }
        
        view.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(btn.snp.top).offset(40)
        }
        
    }
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "1"))
        return img
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        return title
        
    }()
    
    private let descriptionForPost: UILabel = {
        let des = UILabel()
        des.font = UIFont(name: "SFProText-Regular", size: 12)
        return des
    }()
    
    private let price: UILabel = {
        let price = UILabel()
        price.font = .boldSystemFont(ofSize: 12)
        return price
    }()
    
    private let btn: UIButton = {
        let btn = btn(text: "Add to cart")
        btn.layer.cornerRadius = 28        
        return btn
    }()
}
