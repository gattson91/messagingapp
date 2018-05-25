//
//  MessageListViewController.swift
//  messagingapp
//
//  Created by Gabrielle Anderson on 2018-05-24.
//  Copyright © 2018 Gabrielle Anderson. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     @IBOutlet weak var messageListTableView: UITableView!
    
    var ref: DatabaseReference!
    
    var messages : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageListTableView.delegate = self
        messageListTableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
      ref = Database.database().reference()
        
        ref.child("messages").observe(DataEventType.value, with: { (snapshot) in
            self.messages.removeAll()
            
            let dictionary = snapshot.value as? [String: Any]
            
            dictionary?.forEach({ (arg, in
                let (key, value) = arg
                self.messages.append(value as! String)
            })
            self.messageListTableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
    @IBAction func addPressed(_ sender: Any) {
        let messageEditorScreen = self.storyboard?.instantiateViewController(withIdentifier: "messageEditor")
        self.present(messageEditorScreen!, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    
}
