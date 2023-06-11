//
//  AccInf.swift
//  Nike Shop
//
//  Created by bakebrlk on 11.06.2023.
//

import SnapKit
import UIKit

class AccInf: UIViewController{
   
    private var username = TextFieldWithPadding()
    private var password = TextFieldWithPadding()
    private var repassword = TextFieldWithPadding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = .white
        navigationItem.title = "Account Information"
        
        username = textField(hiringText: "username")
        password = textField(hiringText: "password")
        repassword = textField(hiringText: "repassword")
        
        view.addSubview(username)
        
        username.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(username.snp.top).offset(48)
        }
        
        view.addSubview(password)
        
        password.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(password.snp.top).offset(48)
        }
        
        view.addSubview(repassword)
        
        repassword.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(repassword.snp.top).offset(48)
        }
        
        let btn = btn(text: "Save changes")
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        
    }
    
    
    private func textField(hiringText: String) -> TextFieldWithPadding {
        let tf = TextFieldWithPadding()
        tf.placeholder = hiringText
        tf.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        return tf
    }
}
