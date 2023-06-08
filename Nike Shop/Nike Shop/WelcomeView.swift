//
//  WelcomeView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class WelcomeView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        view.addSubview(img1)
        view.addSubview(img2)
        view.addSubview(img3)
        
        
        img1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        img2.snp.makeConstraints { make in
            make.centerY.equalTo(img1.snp.centerY).offset(-47)
            make.trailing.equalToSuperview()
        }
        view.addSubview(mainText)
        
        mainText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(img2.snp.centerY).offset(200)
        }
        
        view.addSubview(btn1)
        
        btn1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-120)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
        
        view.addSubview(btn2)
        
        btn2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(btn1.snp.bottom).offset(24)
        }
    }
    
    var img1: UIImageView = {
        let img = UIImageView(image: UIImage(named: "17"))
        return img
    }()
    
    var img2: UIImageView = {
        let img = UIImageView(image: UIImage(named: "18"))
        return img
    }()
    
    var img3: UIImageView = {
        let img = UIImageView(image: UIImage(named: "v5"))
        return img
    }()
    
    private var btn1: UIButton = {
        let btn = btn(text: "Sign Up")
        btn.layer.cornerRadius = 28
        return btn
    }()
    
    private var mainText: UILabel = {
        let main = UILabel()
        main.text = "Welcome to the biggest sneakers store app"
        main.numberOfLines = 0
        main.font = .boldSystemFont(ofSize: 28)
        main.textAlignment = .center
        
        return main
    }()
    
    private var btn2 : UIButton = {
        let btn = UIButton()
        btn.setTitle("I already have an account", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        return btn
    }()
}
