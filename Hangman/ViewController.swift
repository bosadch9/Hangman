//
//  ViewController.swift
//  Hangman
//  Created by Bohdan Osadchyy 2019 on 5/7/19.
//  Copyright © 2019 Bohdan Osadchyy 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    //This generates a random word
    @IBAction func buttonClicked(_ sender: UIButton)
    {
        if let wordsFilePath = Bundle.main.path(forResource: "english3.txt", ofType: nil) {
            do {
                let wordsString = try String(contentsOfFile: wordsFilePath)
                
                let wordLines = wordsString.components(separatedBy: .newlines)
                
                let randomWord = wordLines[numericCast(arc4random_uniform(numericCast(wordLines.count)))]
                
                print(randomWord)
                
            } catch {
                print("Error: \(error)")
            }
        }
    }

}

