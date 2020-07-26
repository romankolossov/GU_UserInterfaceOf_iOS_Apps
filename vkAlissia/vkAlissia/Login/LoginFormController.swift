//
//  LoginFormController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 01.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillBeShown(notification:)), name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillBeHiden(notification:)), name:
            UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
        
        animateTitleAppearing()
        animateFieldAppearing()
        animateAuthButton()
    }
    
    @objc func keyboardWillBeShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHiden(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard(){
        scrollView.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            if checkLoginInfo() {
                return true
            } else {
                showLoginError()
                return false
            }
        }
        return true
    }
    
    private func checkLoginInfo() -> Bool {
        guard let loginText = loginField.text else { return false }
        guard let passwordText = passwordField.text else { return false }
        
        if loginText == "", passwordText == "" {
            animateCorrectPassword()
            return true
        } else {
            animateWrongPassword()
            return false
        }
    }
    
    private func showLoginError() {
        let  alert = UIAlertController(title: "Ошибка", message: "Неверный логин и/или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func animateTitleAppearing() {
        loginLabel.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        titleLabel.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
        
        UIView.animate(withDuration: 1,
                       delay: 0.8,
                       options: .curveEaseOut,
                       animations: {
                        self.loginLabel.transform = .identity
                        self.passwordLabel.transform = .identity
        },
                       completion: nil)
        
        UIView.animate(withDuration: 1.6,
                       delay: 0.6,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: { self.titleLabel.transform = .identity
        } ,
                       completion: nil)
    }
    
    func animateFieldAppearing() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 3
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1.3
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        loginField.layer.add(fadeInAnimation, forKey: nil)
        passwordField.layer.add(fadeInAnimation, forKey: nil)
    }
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1.6
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards

        authButton.layer.add(animation, forKey: nil)
    }
    
    func animateCorrectPassword() {
        self.loginField.layer.borderWidth = 1
        self.loginField.layer.borderColor = UIColor.green.cgColor
        self.passwordField.layer.borderWidth = 1
        self.passwordField.layer.borderColor = UIColor.green.cgColor
    }
    
    func animateWrongPassword() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0.1,
                       options: [.autoreverse],
                       animations: {
                        self.loginField.layer.borderWidth = 1
                        self.loginField.layer.borderColor = UIColor.red.cgColor
                        self.loginField.layer.frame.origin.x += 1
                        self.loginField.layer.frame.origin.y += 1
                        self.passwordField.layer.borderWidth = 1
                        self.passwordField.layer.borderColor = UIColor.red.cgColor
                        self.passwordField.frame.origin.x += 1
                        self.passwordField.frame.origin.y += 1
                        
        }) { _ in
            self.loginField.layer.frame.origin.x -= 1
            self.loginField.layer.frame.origin.y -= 1
            self.passwordField.frame.origin.x -= 1
            self.passwordField.frame.origin.y -= 1
        }
    }
}
