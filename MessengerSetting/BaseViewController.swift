//
//  BaseViewController.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/18/24.
//


import UIKit

class BaseViewcontroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpHierarchy()
        setUpLayout()
        setUpView()
        setupNavigationItem()
    }
    
    func setUpHierarchy() {}
    
    func setUpLayout() {}
    
    func setUpView() {}
    func setupNavigationItem() { }
}
