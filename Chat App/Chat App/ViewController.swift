import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var chatTabbleView: UITableView!{
        didSet{
            chatTabbleView.delegate = self
            chatTabbleView.dataSource = self
            chatTabbleView.separatorStyle = .none
        }
    }
    var chatData = [String]()
    
    @IBOutlet weak var inputTextView: UITextView!{
        didSet{
            inputTextView.delegate = self
        }
    }
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰에 커스터마이징한 xib 셀 등록
        chatTabbleView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        chatTabbleView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        
        // 키보드 관련 옵저버 (상태를 알려주는 것) 설정
        // 키보드 올라올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드 내려올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(noti: Notification) {
        let notifiInfo = noti.userInfo!
        let keyboardFrame = notifiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height
        
        // 키보드가 올라오는 시간(애니매이션 시간)
        let animationDuration = notifiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            // 아이폰의 safe area 영역을 더해주어야 빈공간 없이 키보드와 inputView가 붙어진다.
            self.inputViewBottomMargin.constant = -height + self.view.safeAreaInsets.bottom
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notifiInfo = noti.userInfo!
        
        let animationDuration = notifiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }


    }
    
    // 사용자가 텍스트를 입려갛고 전송 버튼을 눌렀을 때 => chatData 어레이 안에 해당 텍스트가 들어가야 함
    @IBAction func SendString(_ sender: Any) {
        
        chatData.append(inputTextView.text)
        inputTextView.text = ""
        // 테이블 뷰 갱신
        chatTabbleView.reloadData()
        
        // 사용자가 새로운 메시지를 전송했을 때 화면을 테이블 뷰에 새로운 메시지가 생긴 부분으로 내려주게 함
        let lastIndexPath = IndexPath(row: chatData.count - 1, section: 0)
        
        chatTabbleView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
        inputTextViewHeight.constant = 40
    }
    
}

//MARK: - TableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatData[indexPath.row]
            myCell.selectionStyle = .none
            
            return myCell
            
        }else{
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCell
            yourCell.yourTextView.text = chatData[indexPath.row]
            yourCell.selectionStyle = .none
            
            return yourCell
        }
        
    }
}

// 사용자가 많은 양의 글자를 입력중일 때 inputTextView의 높이를 동적으로 키워서 사용자가 지금까지 입력하고 있는 텍스트를 한눈에 볼수 있도록 함
//MARK: - UITexViewDelegate
extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 40{
            inputTextViewHeight.constant = 40
        }else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant = 100
        }else {
            inputTextViewHeight.constant = textView.contentSize.height
        }
    }
    
}
