//
//  BaseViewController.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/18/24.
//


import UIKit

class BasicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpHierarchy()
        setUpLayout()
        setUpView()
    }
    
    func setUpHierarchy() {}
    
    func setUpLayout() {}
    
    func setUpView() {}
}
