//
//  AuthorizationView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class AuthorizationView: UIViewController{
    var name = TextFieldWithPadding()
    var password = TextFieldWithPadding()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Welcome back!"
        
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
        }
        
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        
        btn.addTarget(self, action: #selector(auth), for: .touchUpInside)
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
    
    @objc private func auth(){
        
        guard let email = name.text, !email.isEmpty,
              let pass = password.text, !pass.isEmpty else{
                print("Missing")
                return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pass, completion: {result, error in
            guard error == nil else{
                self.createAcc()
                // Create account
                return
            }
            
            self.navigationController?.pushViewController(ViewController(), animated: true)
        })
    }
    
    private func createAcc(){
        let alert = UIAlertController(title: "Aww sorry you haven't account ", message: "Would you like create account ?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            
            self.navigationController?.pushViewController(RegistrationView(), animated: true)
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            
        }))
        
        
        present(alert, animated: true)
    }
    
}
