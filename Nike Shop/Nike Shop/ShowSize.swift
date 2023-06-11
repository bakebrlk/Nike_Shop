//
//  ShowSize.swift
//  Nike Shop
//
//  Created by bakebrlk on 11.06.2023.
//

import UIKit
import SnapKit

class ShowSize: UIViewController, UITextFieldDelegate{
    
    var tf = TextFieldWithPadding()
    weak var delegate: sizeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = .white
        
        navigationItem.title = "Shoe Size"
        tf = sizeTF
        tf.placeholder = "Shoe Size"
        tf.keyboardType = .numberPad
        tf.delegate = self
        
        view.addSubview(tf)
        
        tf.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(tf.snp.top).offset(48)
        }
        
        let btn = btn(text: "Save changes")
        btn.addTarget(self, action: #selector(newSize), for: .touchUpInside)
        view.addSubview(btn)
        
        setBtn(btn: btn, view: view)
    }
    
    private var sizeTF: TextFieldWithPadding = {
        let tf = TextFieldWithPadding()
        tf.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        return tf
    }()
    
    @objc private func newSize(){
        let ss: String = tf.text ?? "0"
        ProfileView.size = Double(ss) ?? 0
        delegate?.sizeCheck()
        navigationController?.popViewController(animated: true)
    }
}


protocol sizeDelegate: AnyObject {
    func sizeCheck()
}
