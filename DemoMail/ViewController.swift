//
//  ViewController.swift
//  DemoMail
//

//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var textViewBody: UITextView!
    @IBOutlet weak var textFieldSubject: UITextField!
    @IBOutlet weak var textFieldTo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonHandlerSendEmail(_ sender: Any) {
        
      let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([self.textFieldTo.text!])
        mailComposeVC.setSubject(self.textFieldSubject.text!)
        mailComposeVC.setMessageBody(self.textViewBody.text!, isHTML: false)
        return mailComposeVC
    }
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

