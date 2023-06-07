//
//  OnBordingView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit


class OnBordingView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = UIColor(named: "white")
        let btm = BottomSheet
        view.addSubview(btm)
        let h: Double = Double(view.bounds.height)
        
        btm.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Int(h * 0.35))
            make.bottom.equalToSuperview()
        }
    }
}

private let FirstView: UIView = {
    let view = UIView()
    
    return view
}()

private let BottomSheet: UIView = {
    let sheet = UIView()
    sheet.layer.cornerRadius = 12
    sheet.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    let mainLabel = UILabel()
    mainLabel.text = "Fast shipping"
    mainLabel.font = .boldSystemFont(ofSize: 28)
    
    sheet.addSubview(mainLabel)
    mainLabel.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalToSuperview().offset(80)
    }
    
    let text = UILabel()
    text.text = "Get all of your desired sneakers in one place."
    
    sheet.addSubview(text)
    text.snp.makeConstraints { make in
        make.leading.equalToSuperview().offset(16)
        make.trailing.equalToSuperview().offset(-16)
        make.top.equalTo(mainLabel.snp.bottom).offset(16)
    }
    
    let btn =  btn(text: "next")
    sheet.addSubview(btn)
    setBtn(btn: btn, view: sheet)
    
    return sheet
}()
