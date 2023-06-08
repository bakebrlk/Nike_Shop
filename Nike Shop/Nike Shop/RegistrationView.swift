//
//  RegistrationView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit

class RegistrationView: UIViewController{
    
    var name = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    var rePassword = TextFieldWithPadding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = .white
        name = TF(text: "Username")
        
        setTF(view: view, tf: name)
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.bottom.equalTo(name.snp.top).offset(48)
        }
        
        password = TF(text: "Password")
        setTF(view: view, tf: password)
        
        password.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(16)
            make.bottom.equalTo(password.snp.top).offset(48)

        }
        
        rePassword = TF(text: "Repeat password")
        setTF(view: view, tf: rePassword)
        
        rePassword.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(16)
        }
    }
    
    private func TF(text : String) -> TextFieldWithPadding {
        let tf = TextFieldWithPadding()
        tf.placeholder = text
        tf.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
        return tf
    }
    
    private func setTF(view: UIView, tf: TextFieldWithPadding){
        view.addSubview(tf)
        
        tf.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
    }
}
