//
//  ViewController.swift
//  Hangman
//  Created by Bohdan Osadchyy 2019 on 5/7/19.
//  Copyright © 2019 Bohdan Osadchyy 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var stackView: UIStackView!
    var currentWord: String = ""
    var letters: [String] = Array()
    var labels: [UILabel] = Array()
    
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
                currentWord = randomWord
                test()
            }
            catch
            {
                print("Error: \(error)")
            }
        }
    }
    
    func test()
    {
        for letter in currentWord
        {
            letters.append("\(letter)")
            var label = UILabel()
            label.text = "\(letter)"
            labels.append(label)
        }
        
        
        let stackView1 = UIStackView(arrangedSubviews: labels)
        //stackView1.frame.width = 200
        //stackView1.frame.height = 100
        //stackView1.frame.minX = 0
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.alignment = .fill
        stackView1.spacing = 5
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        //let horizontalConstraint = stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        //let verticalConstraint = stackView1.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        //stackView1.addConstraint(verticalConstraint)
        //NSLayoutConstraint.activate([verticalConstraint])
        view.addSubview(stackView1)
    }

}

