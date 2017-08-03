//
//  ViewController.swift
//  View Only
//
//  Created by Nico Boentoro on 7/31/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var smallGesture: UITapGestureRecognizer!
    @IBOutlet var bigGesture: UITapGestureRecognizer!
    @IBOutlet weak var addbookTextField: UITextField!
    @IBOutlet weak var codeoneTextField: UITextField!
    @IBOutlet weak var codetwoTextField: UITextField!
    @IBOutlet weak var codethreeTextField: UITextField!
    @IBOutlet weak var ScrollView: RoundedScroll!
    
    
    var fixScreenHeight: Int = 0
    var fixScreenWidth: Int = 0
    var tempScreenHeight: Int = 0
    var tempScreenWidth: Int = 0
    var initialConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreenSize()
        
        ScrollView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = ScrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250)
        let leadingConstraint = ScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 650)
        let trailingConstraint = ScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -130)
        let bottomConstraint = ScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -173)
        
        initialConstraints.append(contentsOf: [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        NSLayoutConstraint.activate(initialConstraints)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .landscape
    }
    
    
    @IBAction func bigTapGesture(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func smallTapGesture(_ sender: Any) {
        self.view.endEditing(true)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        getScreenSize()
        configureLayoutBeforeEditing(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        getScreenSize()
        if tempScreenWidth == 1366 && tempScreenHeight == 1024 {
            moveView(textField: textField, moveDistance: 310, up: true)
        }else{
            moveView(textField: textField, moveDistance: 230, up: true)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == addbookTextField{
            codeoneTextField.becomeFirstResponder()
        }else if textField == codeoneTextField{
            codetwoTextField.becomeFirstResponder()
        }else if textField == codetwoTextField{
            codethreeTextField.becomeFirstResponder()
        }else{
            codethreeTextField.resignFirstResponder()
        }
        return true
    }
    
    func getScreenSize(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        tempScreenHeight = Int(screenHeight)
        tempScreenWidth = Int(screenWidth)
        
        ScrollView.frame.size.width = screenWidth / 4.65
        ScrollView.frame.size.height = screenHeight / 2.47
    }
    
    func moveView(textField: UITextField, moveDistance: Int, up: Bool){
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0 , dy: movement)
        UIView.commitAnimations()
    }
    
    func configureLayoutBeforeEditing(textField: UITextField){
        if tempScreenWidth == 1366 && tempScreenHeight == 1024 {
            moveView(textField: textField, moveDistance: -310, up: true)
        }else{
            moveView(textField: textField, moveDistance: -230, up: true)
        }
    }
}



