//
//  OnBordingView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//
import UIKit
import SnapKit


class OnBordingView: UIViewController{
    
    var pages = [UIView]()
    private var i = -1
    static var backgColor = UIColor()
    let FV = firstView
    let SV = secondView
    let TV = thirdView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = UIColor(named: "white")
        
        
        setViews(view: view, ofView: TV)
        setViews(view: view, ofView: SV)
        setViews(view: view, ofView: FV)

        pages.append(FV)
        pages.append(SV)
        pages.append(TV)
        
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
            make.height.equalTo(Int(h * 0.37))
            make.bottom.equalToSuperview()
        }
        
        let btn =  btn(text: "Next")
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        btn.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
    
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
        }
        if(i == 0){
            FV.isHidden = true
            SV.isHidden = false
        }
        if(i == 1){
            SV.isHidden = true
            TV.isHidden = false
        }
        
        if(i == 2){
            TV.isHidden = true
            FV.isHidden = false
            i = -1
        }
        
        i += 1
    }
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

