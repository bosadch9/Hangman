//
//  introViewController.swift
//  Hangman
//
//  Created by Lillian Djunaedi 2020 on 5/16/19.
//  Copyright © 2019 Bohdan Osadchyy 2019. All rights reserved.
//

import UIKit
import SafariServices

class introViewController: UIViewController {
    let helpURL = "https://www.wikihow.com/Play-Hangman"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confusedButtonTapped(_ sender: UIButton) {
        let url = URL(string: helpURL)
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)
    }
    

}
