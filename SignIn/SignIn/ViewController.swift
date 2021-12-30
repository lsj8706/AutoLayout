import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 값이 변경되는 것을 실시간으로 캐치해야하는데 기본적으로는 구현되어 있지 않아서 직접 만들어야 함
        // addTarget 사용
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }

    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField{
            
            if isValidEmail(testStr: textField.text!) == true{
                emailErrorHeight.isActive = true
            }
            else{
                emailErrorHeight.isActive = false
            }
        }
        else if textField == passwordTextField{
            
            if isValidPassword(pw: textField.text!) == true{
                passwordErrorHeight.isActive = true
            }
            else{
                passwordErrorHeight.isActive = false
            }
            
        }
        
        // 에러 문구가 자연스럽게 변하도록 애니메이션 추가
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    // email 형식인지 정규식으로 확인
    func isValidEmail(testStr:String?) -> Bool {
        guard testStr != nil else {return false}
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // password 형식에 맞는지(8글자 이상) 정규식으로 확인
    func isValidPassword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8{
                return false
            }
        }
        
        return true
    }

}

