//
//  ViewController.swift
//  Hangman
//  Created by Bohdan Osadchyy 2019 on 5/7/19.
//  Copyright © 2019 Bohdan Osadchyy 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var viewHolder: UIView!
    var currentWord: String = ""
    var letters: [String] = Array()
    var labels: [UILabel] = Array()
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var currentGuessTextfield: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    //This starts the game. A random word is selected and blank spaces are displayed on the screen
    func startGame()
    {
        letters.removeAll()
        labels.removeAll()
        getWord()
        for letter in currentWord
        {
            letters.append("\(letter)")
            var label = UILabel()
            label.text = "_"
            labels.append(label)
        }
        let stackView1 = UIStackView(arrangedSubviews: labels)
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.alignment = .fill
        stackView1.spacing = 15
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        viewHolder.addSubview(stackView1)
    }
    
    //This generates a random word
    func getWord()
    {
        if let wordsFilePath = Bundle.main.path(forResource: "english3.txt", ofType: nil) {
            do {
                let wordsString = try String(contentsOfFile: wordsFilePath)
                let wordLines = wordsString.components(separatedBy: .newlines)
                currentWord = wordLines[numericCast(arc4random_uniform(numericCast(wordLines.count)))]
                
                print(currentWord)
            }
            catch
            {
                print("Error: \(error)")
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 1
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton)
    {
        
        
        //if let guessedChar = Character(currentGuessTextfield.text!)
        for letter in letters
        {
                
        }
        
    }
    

}

