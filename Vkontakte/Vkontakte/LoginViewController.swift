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
        loadingAnimation()
    }
    
    private func loadingAnimation() {
        
        let dot1 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 - 35), y: (self.view.bounds.height / 2 + 75), width: 15, height: 15)))
        dot1.layer.cornerRadius = dot1.bounds.height / 2
        dot1.layer.borderColor = UIColor.white.cgColor
        dot1.backgroundColor = .white
        dot1.layer.masksToBounds = true
        dot1.layer.borderWidth = 2
        
        let dot2 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 - 10), y: (self.view.bounds.height / 2 + 75), width: 15, height: 15)))
        dot2.layer.cornerRadius = dot2.bounds.height / 2
        dot2.layer.borderColor = UIColor.white.cgColor
        dot2.backgroundColor = .white
        dot2.layer.masksToBounds = true
        dot2.layer.borderWidth = 2
        
        let dot3 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 + 15), y: (self.view.bounds.height / 2 + 75), width: 15, height: 15)))
        dot3.layer.cornerRadius = dot3.bounds.height / 2
        dot3.layer.borderColor = UIColor.white.cgColor
        dot3.backgroundColor = .white
        dot3.layer.masksToBounds = true
        dot3.layer.borderWidth = 2
        
        self.view.addSubview(dot1)
        self.view.addSubview(dot2)
        self.view.addSubview(dot3)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: { dot1.backgroundColor = .gray },
                       completion: nil)
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: [.autoreverse, .repeat],
                       animations: { dot2.backgroundColor = .gray },
                       completion: nil)
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: [.autoreverse, .repeat],
                       animations: { dot3.backgroundColor = .gray },
                       completion: nil)
    }


//        UIView.animate(withDuration: 1.0,
//                       delay: 0, options: [.repeat, .autoreverse],
//                       animations: { pointView1.backgroundColor = UIColor.gray },
//                       completion: nil)
//
//        UIView.animate(withDuration: 1.0,
//                       delay: 0.33,
//                       options: [.repeat, .autoreverse],
//                       animations: { pointView2.backgroundColor = UIColor.gray },
//                       completion: nil)
//
//        UIView.animate(withDuration: 1.0,
//                       delay: 0.66,
//                       options: [.repeat, .autoreverse],
//                       animations: { pointView3.backgroundColor = UIColor.gray },
//                       completion: nil)
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func myUnwindAction (_ unwindSegue: UIStoryboardSegue) {}
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        if loginTextField.text == "" &&
            passwordTextField.text == "" {
        
            performSegue(withIdentifier: "loginScreenSegue", sender: self)
            
        } else {
            //создаем контроллер
            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // добавляем кнопку на UIAlertController
            alert.addAction(action)
            // показываем UIAlertController
            present(alert, animated: true, completion: nil)
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
