//
//  SettingsViewController.swift
//  Animations-Lab
//
//  Created by Oscar Victoria Gonzalez  on 2/6/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol AnimationDelegate: AnyObject {
   
    
}

class SettingsViewController: UIViewController {
    
    weak var delegate: AnimationDelegate?
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .systemBackground
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        pickerView.delegate = self
        pickerView.dataSource = self
        configureConstraints()
        
        
    }
    
    private func configureConstraints() {
     configurePickerView()
    }
    
    let animations = ["repeat", "autoreverse", "curvEaseInOut", "curveLinear", "curveEaseIn"]
    
    
    private func configurePickerView() {
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            pickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let animation = animations[row]
        
        return animation
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
    }
}
