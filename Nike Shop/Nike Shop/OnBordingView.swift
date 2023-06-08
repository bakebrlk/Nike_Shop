//
//  OnBordingView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//
import UIKit
import SnapKit


class OnBordingView: UIViewController{
    
    private var i = -1
    static var backgColor = UIColor()
    let FV = firstView
    let SV = secondView
    let TV = thirdView
    
    var c1 = circle()
    var c2 = circle()
    var c3 = circle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = UIColor(named: "white")
        
        
        setViews(view: view, ofView: TV)
        setViews(view: view, ofView: SV)
        setViews(view: view, ofView: FV)
        
        FV.isHidden = true
        SV.isHidden = true
        TV.isHidden = true
        
        Hid()
        let btm = BottomSheet
        view.addSubview(btm)
        let h: Double = Double(view.bounds.height)
        
        btm.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(Int(h * 0.63))
            make.bottom.equalToSuperview()
        }
        
        
        let btn =  btn(text: "Next")
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        btn.addTarget(self, action: #selector(nextAction), for: .touchUpInside)

        
        view.addSubview(c2)
        c2.snp.makeConstraints { make in
            make.top.equalTo(btm.snp.top).offset(32)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(btm.snp.top).offset(40)
            make.width.height.equalTo(8)
        }
        
        view.addSubview(c1)
        
        c1.snp.makeConstraints { make in
            make.top.equalTo(btm.snp.top).offset(32)
            make.bottom.equalTo(btm.snp.top).offset(40)
            make.centerX.equalTo(c2.snp.centerX).offset(-24)
            make.width.height.equalTo(8)
        }

        view.addSubview(c3)
        
        c3.snp.makeConstraints { make in
            make.width.height.equalTo(8)
            make.top.equalTo(btm.snp.top).offset(32)
            make.bottom.equalTo(btm.snp.top).offset(40)
            make.centerX.equalTo(c2.snp.centerX).offset(24)
        }
    }
    
    
    private let BottomSheet: UIView = {
        let sheet = UIView()
        sheet.layer.cornerRadius = 12
        sheet.backgroundColor = OnBordingView.backgColor
      
       
        let mainLabel = UILabel()
        mainLabel.text = "Fast shipping"
        mainLabel.textColor = .white
        mainLabel.font = .boldSystemFont(ofSize: 28)
        
        sheet.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        let text = UILabel()
        text.text = "Get all of your desired sneakers in one place."
        text.textColor = .white
        
        sheet.addSubview(text)
        text.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
        }
        
        return sheet
    }()
    
    @objc private func nextAction(){
       Hid()
    }
    
    private func Hid(){
        
        if(i == -1){
            FV.isHidden = false
            c1.backgroundColor = .white
        }
        if(i == 0){
            FV.isHidden = true
            SV.isHidden = false
            
            c1.backgroundColor = UIColor(named: "grayLight")
            c2.backgroundColor = .white
        }
        if(i == 1){
            SV.isHidden = true
            TV.isHidden = false
            
            c2.backgroundColor = UIColor(named: "grayLight")
            c3.backgroundColor = .white
        }
        
        if(i == 2){
            TV.isHidden = true
            FV.isHidden = false
            i = -1
            
//            c3.backgroundColor = UIColor(named: "grayLight")
//            c1.backgroundColor = .white
            
            navigationController?.pushViewController(WelcomeView(), animated: true)
        }
        
        i += 1
    }
}


private func circle() -> UIView {
    let view = UIView()
    view.layer.cornerRadius = 4
    view.backgroundColor = UIColor(named: "grayLight")
    view.frame = CGRect(x: 200, y: 700, width: 8, height: 8)
    
    return view
}

private func views(i1: String, i2: String, i3: String) -> UIView{
    let view = UIView()
    
    let img1 = UIImageView(image: UIImage(named: i1))
    let img2 = UIImageView(image: UIImage(named: i3))
    let img3 = UIImageView(image: UIImage(named: i2))
    
   
    view.addSubview(img3)
    view.addSubview(img1)
    view.addSubview(img2)
    
    img1.snp.makeConstraints { make in
        make.bottom.equalToSuperview().offset(-16)
    }

    img2.snp.makeConstraints { make in
        make.trailing.equalToSuperview()
        make.top.equalToSuperview().offset(59)
    }

    return view
}
private func setViews(view: UIView, ofView: UIView){
    view.addSubview(ofView)
    
    ofView.snp.makeConstraints { make in
        make.center.equalToSuperview()
        make.leading.equalToSuperview()
        make.trailing.equalToSuperview()
        make.top.equalToSuperview()
        make.bottom.equalToSuperview()
    }
}

private let firstView : UIView = {
    OnBordingView.backgColor = UIColor(red: 0.596, green: 0.612, blue: 0.580, alpha: 0.98)
    return views(i1: "v1", i2: "10", i3: "9")
}()

private let secondView : UIView = {
    OnBordingView.backgColor = UIColor(red: 0.659, green: 0.612, blue: 0.675, alpha: 0.98)
    return views(i1: "v2", i2: "12", i3: "11")
}()

private let thirdView : UIView = {
    OnBordingView.backgColor = UIColor(red: 0.658, green: 0.580, blue: 0.580, alpha: 0.98)
    return views(i1: "v3", i2: "14", i3: "13")
}()

