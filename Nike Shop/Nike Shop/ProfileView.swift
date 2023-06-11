//
//  ProfileView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class ProfileView: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private var top = 132
    static var size = 41.5
    
    private func setUI(){
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        navigationItem.title = "Cart"
        let btnInfProf = btn(text: "", img: "chevron.right")
        LineViewUIView(text: "Account Information", btn: btnInfProf, top: top)
        
        top += 68
        let btnHistory = btn(text: "", img: "chevron.right")
        LineViewUIView(text: "Order History", btn: btnHistory, top: top)
        
        var btnSize = UIButton()
        
        if(ProfileView.size != 0){
            btnSize = btn(text: "\(ProfileView.size)", img: "chevron.right")
        }else{
            btnSize = btn(text: "", img: "chevron.right")
        }
        
        top += 68
        LineViewUIView(text: "Shoe size", btn: btnSize, top: top)
        
        top += 68
        let btnWebS1 = btn(text: "", img: "arrowshape.turn.up.right.circle")
        LineViewUIView(text: "How to know your shoe size?", btn: btnWebS1, top: top)
        
        top += 52
        let btnWebS2 = btn(text: "", img: "arrowshape.turn.up.right.circle")
        LineViewUIView(text: "How to check the authenticity of \nthe shoe?", btn: btnWebS2, top: top)
        
        let btnS = Nike_Shop.btn(text: "Sign out")
        view.addSubview(btnS)
        setBtn(btn: btnS, view: view)
    }

    
    private func LineViewUIView(text: String, btn: UIButton, top: Int){
       
        let v = UIView()
        v.layer.cornerRadius = 12
        v.backgroundColor = .white
        view.addSubview(v)
        
        v.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        
        v.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        v.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
       
    }
    
    private func btn(text: String, img: String) -> UIButton {
        let btn = UIButton()
        
        btn.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1), for: .normal)
        
        btn.setImage(UIImage(systemName: img), for: .normal)
        btn.tintColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        
        var configuration = UIButton.Configuration.plain()
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 10

        btn.configuration = configuration
        return btn
    }
}
