//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var animation: UIView.AnimationOptions = UIView.AnimationOptions.autoreverse

    lazy var stepperDistanceLabel: UILabel = {
        let label = UILabel()
        label.text = "The distance of the animation is 0.0"
        return label
    }()
    
    lazy var stepperDistance: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(changeStepperDistance(sender:)), for: .touchUpInside)
        return stepper
    }()
    
    lazy var stepperTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "The duration of the animation is 0.0"
        return label
    }()
    
    lazy var stepperTime: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 0
        stepper.addTarget(self, action: #selector(changeStepperSpeed(sender:)), for: .touchUpInside)
        return stepper
    }()
    
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square left  ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 50
        return buttonStack
    }()
    
    lazy var butonStackViewTwo: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 50
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square up   ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        configureConstraints()
        configureNavBar()
        
    }
    
    func configureNavBar() {
        navigationItem.title = "Animations"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    
    
    @objc
      private func showSettings(_ semder: UIBarButtonItem) {
          // segue to the SettingsViewController
          let settingsVC = SettingsViewController()
          
          //    present(settingsVC, animated: true)
          navigationController?.pushViewController(settingsVC, animated: true)
          
      }
    
    
    var distance: CGFloat = 0
    
    var duration: Double = 0
    
    
    

    
    @IBAction func changeStepperDistance(sender: UIStepper) {
        distance = CGFloat(sender.value)
        stepperDistanceLabel.text = "The distance of the animation is \(distance.description)"
        print(distance)
    }
    
    @IBAction func changeStepperSpeed(sender: UIStepper) {
        duration = sender.value
        stepperTimeLabel.text = "The duration of the animation is \(duration.description)"
        print(duration)
    }
    
    
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffset = self.blueSquareCenterXConstraint.constant
        self.blueSquareCenterXConstraint.constant = oldOffset + self.distance
        UIView.animate(withDuration: self.duration, delay: 0.0, options: [.repeat], animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffset = self.blueSquareCenterXConstraint.constant
        self.blueSquareCenterXConstraint.constant = oldOffset - self.distance
        UIView.animate(withDuration: self.duration, delay: 0.0, options: [.autoreverse], animations: {
           self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = self.blueSquareCenterYConstraint.constant
        self.blueSquareCenterYConstraint.constant = oldOffset - self.distance
        UIView.animate(withDuration: self.duration, delay: 0.0, options: [.transitionFlipFromLeft], animations: {
         self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = self.blueSquareCenterYConstraint.constant
        self.blueSquareCenterYConstraint.constant = oldOffet + self.distance
        UIView.animate(withDuration: self.duration, delay: 0.0, options: [.transitionCurlDown], animations: {
        self.view.layoutIfNeeded()
        }, completion: nil)
        print(duration)
    }

    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        view.addSubview(butonStackViewTwo)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        butonStackViewTwo.addSubview(leftButton)
        butonStackViewTwo.addSubview(rightButton)
    }
    
    private func configureConstraints() {
        configureStepper()
        configureTimeLabel()
        configureDistanceStepper()
        configureDistanceLabel()
        constrainBlueSquare()
        constrainUpButton()
        constrainDownButton()
        constrainButtonStackView()
        constraintLeftButton()
        constraintRightButton()
        constraintButtonStackViewTwo()
    }
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    private func constraintButtonStackViewTwo() {
        butonStackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            butonStackViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            butonStackViewTwo.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -50),
            butonStackViewTwo.heightAnchor.constraint(equalToConstant: 50),
            butonStackViewTwo.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func constraintLeftButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constraintRightButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false 
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        leftButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func configureStepper() {
        view.addSubview(stepperTime)
        stepperTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperTime.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stepperTime.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        ])
    }
    
    private func configureTimeLabel() {
        view.addSubview(stepperTimeLabel)
        stepperTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            stepperTimeLabel.leadingAnchor.constraint(equalTo: stepperTime.trailingAnchor, constant: 40),
            stepperTimeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 40)
        ])
    }
    
    private func configureDistanceStepper() {
        view.addSubview(stepperDistance)
        stepperDistance.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperDistance.topAnchor.constraint(equalTo: stepperTime.bottomAnchor, constant: 15),
            stepperDistance.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        ])
    }
    
    private func configureDistanceLabel() {
        view.addSubview(stepperDistanceLabel)
        stepperDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperDistanceLabel.topAnchor.constraint(equalTo: stepperTimeLabel.bottomAnchor, constant: 25),
            stepperDistanceLabel.leadingAnchor.constraint(equalTo:stepperDistance.trailingAnchor, constant: 40)
        ])
    }
    
}


