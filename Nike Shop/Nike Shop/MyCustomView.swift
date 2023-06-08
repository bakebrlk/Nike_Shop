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
    btn.layer.cornerRadius = 16
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

