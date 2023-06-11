//
//  RegistrationView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegistrationView: UIViewController{
    
    var name = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    var rePassword = TextFieldWithPadding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        name.becomeFirstResponder()
    }
    
    private func setUI(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "New User"
        
        name = TF(text: "Username")
        
        setTF(view: view, tf: name)
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.bottom.equalTo(name.snp.top).offset(48)
        }
        
        password = TF(text: "Password")
        setTF(view: view, tf: password)
        password.isSecureTextEntry = true
        password.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(16)
            make.bottom.equalTo(password.snp.top).offset(48)

        }
        
        rePassword = TF(text: "Repeat password")
        setTF(view: view, tf: rePassword)
        rePassword.isSecureTextEntry = true
        rePassword.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(16)
        }
        
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        
        btn.addTarget(self, action: #selector(reg), for: .touchUpInside)
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
    
    private let btn: UIButton = {
        let btn = btn(text: "Sign Up")
        return btn
    }()
    
    @objc private func reg(){
        print("Reg")
        
        guard let email = name.text, !email.isEmpty,
              let pass = password.text, !pass.isEmpty,
              let repass = rePassword.text, !repass.isEmpty,
              pass == repass else{
                    print("Missing reg")
                    return
                }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: pass) {[weak self] result, error in
            
            guard error == nil else {
                print("Account creation failed")
                return
            }
            
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
