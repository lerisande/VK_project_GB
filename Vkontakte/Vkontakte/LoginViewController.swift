//
//  LoginViewController.swift
//  Vkontakte
//
//  Created by Lera on 02.07.21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var loginScrollView: UIScrollView!
    @IBOutlet private weak var logoImage: UIImageView!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction func facebookLoginButton(_ sender: Any) {}
    @IBAction func appleLoginButton(_ sender: Any) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        // Получаем текст логина
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else {
            print("Wrong login or password")
            return
        }
        
        // Проверяем, верны ли они
        if login == "1" && password == "1" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }
    
    // Когда клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc private func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
            self.loginScrollView?.endEditing(true)
        }

    private func setViews() {
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
}
