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


func counter() -> UIView {
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
}

struct Post: Decodable, Encodable{
    let imgName: String
    let title: String
    let description: String
    let price: Int
}

class PostCell : UITableViewCell {
    private var view1 = UIView()
    private var view2 = UIView()
    
    private var img1 = UIImageView()
    private var img2 = UIImageView()
    
    private var name1 = UILabel()
    private var name2 = UILabel()
    
    private var description1 = UILabel()
    private var description2 = UILabel()
    
    private var price1 = UILabel()
    private var price2 = UILabel()
    
    private var btn1 = UIButton()
    private var btn2 = UIButton()
    
    private var checkClick1 = false
    private var checkClick2 = false
    
    private var img1Name = ""
    private var img2Name = ""
    
    private var pr1 = 0
    private var pr2 = 0
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    func configurView(post1: Post, post2: Post){
        setUI()
        
        
        img1.image = UIImage(named: post1.imgName)
        name1.text = post1.title
        description1.text = post1.description
        price1.text = "$\(post1.price)"
        
        img2.image = UIImage(named: post2.imgName)
        name2.text = post2.title
        description2.text = post2.description
        price2.text = "$\(post2.price)"
        
        img1Name = post1.imgName
        img2Name = post2.imgName
        
        pr1 = post1.price
        pr2 = post2.price
    }
    
    private func setUI(){
        
        selectionStyle = .none
        contentView.isUserInteractionEnabled = false
               
        
        view1 = view()
        view2 = view()
        
        img1 = img()
        img2 = img()
        
        name1 = title()
        name2 = title()
        
        description1 = descriptionForPost()
        description2 = descriptionForPost()
        
        price1 = price()
        price2 = price()
        
        btn1 = bttn()
        btn2 = bttn()
        
        
        self.addSubview(view1)
  
        setView(view: view1, img: img1, title: name1, descriptionForPost: description1, price: price1, btn: btn1)
        
        view1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        self.addSubview(view2)
        
        
        setView(view: view2, img: img2, title: name2, descriptionForPost: description2, price: price2, btn: btn2)
        
        view2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
        }
        
        btn1.addTarget(self, action: #selector(click), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(click2), for: .touchUpInside)
    }
    
    private func setView(view: UIView, img: UIImageView, title: UILabel, descriptionForPost: UILabel, price: UILabel, btn : UIButton){
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(174)
            make.height.equalTo(282)
        }
        view.addSubview(img)
        
        img.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
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
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(btn.snp.top).offset(40)
        }
    }
    
    @objc private func click(){
        
        if(checkClick1){
            btn1.setTitle("Add to cart", for: .normal)
            btn1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            
            CartView.Cart.append(Post(imgName: img1Name, title: name1.text ?? "", description: description1.text ?? "", price: pr1))
            
        }else{
            btn1.setTitle("Remove", for: .normal)
            btn1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        }
        
        checkClick1 = !checkClick1
    }
    
    @objc private func click2(){
        
        if(checkClick2){
            btn2.setTitle("Add to cart", for: .normal)
            btn2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            
            CartView.Cart.append(Post(imgName: img2Name, title: name2.text ?? "", description: description2.text ?? "", price: pr2))
        }else{
            
            btn2.setTitle("Remove", for: .normal)
            btn2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        }
        
        checkClick2 = !checkClick2
    }
    
    private func view() -> UIView  {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    private func img() -> UIImageView  {
        let img = UIImageView(image: UIImage(named: "1"))
        return img
    }
    
    private func title() -> UILabel  {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        return title
        
    }
    
    private func descriptionForPost() -> UILabel {
        let des = UILabel()
        des.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        des.font = .systemFont(ofSize: 12)
        return des
    }
    
    private func price() -> UILabel  {
        let price = UILabel()
        price.font = .boldSystemFont(ofSize: 12)
        return price
    }
    
    private func bttn() -> UIButton  {
        let btn = btn(text: "Add to cart")
        btn.layer.cornerRadius = 20
        return btn
    }
}

protocol PostCellDelegate: AnyObject {
    func deleteButtonTapped(cell: CartCell)
}

class CartCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: PostCellDelegate?
    
    func configureView(post: Post){
        img.image = UIImage(named: post.imgName)
        title.text = post.title
        descriptionForPost.text = post.description
        price.text = "$\(post.price)"
        countLabel.text = "\(count)"
        setUI()
    }
    
    var count = 1
    
    private func setUI(){
        self.addSubview(view)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = false
          
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(156)
        }
        
        view.addSubview(img)
        
        img.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview()
        }
        
        self.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(view.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        container.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-18)
            make.leading.equalToSuperview()
            make.bottom.equalTo(title.snp.top).offset(18)
        }
        
        container.addSubview(descriptionForPost)
        
        descriptionForPost.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
        }
        
        container.addSubview(price)
        
        price.snp.makeConstraints { make in
            make.top.equalTo(descriptionForPost.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-52)
            make.bottom.equalTo(price.snp.top).offset(16)
        }
        
        container.addSubview(btnLable)
        
        btnLable.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(10)
            make.width.equalTo(166)
            make.height.equalTo(36)
        }
        
        btnLable.addSubview(mns)
        
        mns.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(44)
            make.centerY.equalToSuperview()
        }
        
        mns.addTarget(self, action: #selector(mnsCount), for: .touchUpInside)
        
        countLabel.text = "\(count)"
        btnLable.addSubview(countLabel)
        
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        btnLable.addSubview(pls)
        
        pls.addTarget(self, action: #selector(plsCount), for: .touchUpInside)
        
        pls.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-44)
            make.centerY.equalToSuperview()
        }
        
        
    }
    
    private var container: UIView = {
        let view = UIView()
        return view
    }()
    
    private var view: UIView = {
        let view = UIView()
        return view
    }()
    
    private var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "1"))
        return img
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    private var descriptionForPost: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private var price: UILabel = {
        let price = UILabel()
        price.font = .boldSystemFont(ofSize: 12)
        return price
    }()
    
    private var pls: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return btn
    }()

    @objc private func plsCount(){
        count += 1
        countLabel.text = "\(count)"
    }
    
    private var mns: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return btn
    }()
    
    
    @objc private func mnsCount(){
        count -= 1
        
        if(count <= 0){
            delegate?.deleteButtonTapped(cell: self)
        }
        countLabel.text = "\(count)"
    }
    private var btnLable: UIView = {
        let label = UIView()
        label.backgroundColor = .black
        label.layer.cornerRadius = 18
        label.layer.masksToBounds = true
        return label
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "10"
        label.textColor = .white
        return label
    }()
}
