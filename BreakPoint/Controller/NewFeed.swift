//
//  NewFeed.swift
//  BreakPoint
//
//  Created by walid elzo on 1/27/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit
import Firebase

class NewFeed: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var postMessageText: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    let defaultTextInPostMessageText = "write your message ....."
    override func viewDidLoad() {
        super.viewDidLoad()
        postMessageText.delegate = self
        sendButton.makeButtonUpToKeboard()
        // sendButton.isEnabled = false
    }
    
    @IBAction func closePostScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if postMessageText.text.count > 0 {sendButton.isEnabled = true} else {return}
        
        if postMessageText.text != nil || postMessageText.text != defaultTextInPostMessageText {
            DataService.instance.WriteANewPost(withMessage: postMessageText.text, AndSenderID: Auth.auth().currentUser!.uid, groupID: nil) { (completeSaved) in              if(completeSaved){
                print("the post was sent..")
            }else {
                print("error occured")
                }
            }
        }
        
    }
    
    
}

extension NewFeed:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        postMessageText.text = ""
    }
}
