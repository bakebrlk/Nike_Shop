//
//  ProfileView.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class ProfileView: UIViewController, sizeDelegate{
    
    let delegate = ShowSize()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.delegate = self
        setUI()
    }
    
    
    private var top = 142
    static var size = 41.5
    private var btnSize = UIButton()
    
    private func setUI(){
        
        view.addSubview(vi)
        vi.translatesAutoresizingMaskIntoConstraints = false
        
        vi.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        vi.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        navigationItem.title = "Cart"
        navigationController?.navigationBar.isHidden = true
        
        let btnInfProf = btn(text: "", img: "chevron.right")
        btnInfProf.addTarget(self, action: #selector(Acc), for: .touchUpInside)
        LineViewUIView(text: "Account Information", btn: btnInfProf, top: top)
        
        top += 68
        let btnHistory = btn(text: "", img: "chevron.right")
        btnHistory.addTarget(self, action: #selector(orHistory), for: .touchUpInside)
        LineViewUIView(text: "Order History", btn: btnHistory, top: top)
        
        
        if(ProfileView.size != 0){
            btnSize = btn(text: "\(ProfileView.size)", img: "chevron.right")
        }else{
            btnSize = btn(text: "", img: "chevron.right")
        }
        btnSize.addTarget(self, action: #selector(shSize), for: .touchUpInside)
        top += 68
        LineViewUIView(text: "Shoe size", btn: btnSize, top: top)
        
        top += 68
        let btnWebS1 = btn(text: "", img: "arrowshape.turn.up.right.circle")
        btnWebS1.addTarget(self, action: #selector(web1), for: .touchUpInside)
        LineViewUIView(text: "How to know your shoe size?", btn: btnWebS1, top: top)
        
        top += 52
        let btnWebS2 = btn(text: "", img: "arrowshape.turn.up.right.circle")
        btnWebS2.addTarget(self, action: #selector(web2), for: .touchUpInside)
        LineViewUIView(text: "How to check the authenticity of \nthe shoe?", btn: btnWebS2, top: top)
        
        let btnS = Nike_Shop.btn(text: "Sign out")
        view.addSubview(btnS)
        setBtn(btn: btnS, view: view)
        
        btnS.addTarget(self, action: #selector(out), for: .touchUpInside)
//        btnS.layer.cornerRadius = 27
//        btnS.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-120)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
//            make.height.equalTo(54)
//        }
    }
    private var vi: UIView = {
        let v = UIView()
        return v
    }()

    func sizeCheck(){
        print("here")
        btnSize.setTitle("\(ProfileView.size)", for: .normal)
        print(ProfileView.size)
    }
    
    private func LineViewUIView(text: String, btn: UIButton, top: Int){
       
        let v = UIView()
        v.layer.cornerRadius = 12
        v.backgroundColor = .white
        vi.addSubview(v)
        
        v.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        
        v.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        v.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
       
    }
    
    private func btn(text: String, img: String) -> UIButton {
        let btn = UIButton()
        
        btn.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1), for: .normal)
        
        btn.setImage(UIImage(systemName: img), for: .normal)
        btn.tintColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        
        var configuration = UIButton.Configuration.plain()
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 10

        btn.configuration = configuration
        return btn
    }
    
    
    @objc private func shSize(){
        navigationController?.pushViewController(ShowSize(), animated: true)
    }
    
    @objc private func orHistory(){
        navigationController?.pushViewController(OrderHistory(), animated: true)
    }
    
    @objc private func Acc(){
        navigationController?.pushViewController(AccInf(), animated: true)
    }
    
    @objc private func web1(){
        if let url = URL(string: "https://www.2bigfeet.com/pages/measure-your-shoe-size#:~:text=To%20find%20your%20size%2C%20measure,inch%2Dto%2Dsize%20table.") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func web2(){
        if let url = URL(string: "https://hypestew.com/blogs/news/legit-check") {
            UIApplication.shared.open(url)
        }
        
    }
    
    @objc private func out(){
        do{
            try FirebaseAuth.Auth.auth().signOut()
            
            navigationController?.pushViewController(WelcomeView(), animated: true)
       
            
        }catch let signOutError as NSError {
            // An error occurred while signing out
            print("Error signing out: \(signOutError.localizedDescription)")
        }
        
    }
}
