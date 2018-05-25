//
//  ViewController.swift
//  messagingapp
//
//  Created by Gabrielle Anderson on 2018-05-24.
//  Copyright © 2018 Gabrielle Anderson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func login(_ sender: Any) {
        let messageListScreen = self.storyboard?.instantiateViewController(withIdentifier: "messageList")
        self.present(messageListScreen!, animated: true, completion: nil)
    }
    
}

