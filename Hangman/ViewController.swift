//
//  ViewController.swift
//  Hangman
//  Created by Bohdan Osadchyy 2019 on 5/7/19.
//  Copyright © 2019 Bohdan Osadchyy 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    //These are the variables and constants used in the code
    @IBOutlet weak var hangmanImageView: UIImageView!
    @IBOutlet weak var viewHolder: UIView!
    var currentWord: String = ""
    var letters: [String] = Array()
    var labels: [UILabel] = Array()
    var incorrectGuesses: [String] = Array()
    var gameOver: Bool = true
    var guessedLetter: String = ""
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var currentGuessTextfield: UITextField!
    @IBOutlet weak var incorrectGuessLabel: UILabel!
    var i = 0
    let imageArray = ["hangman0", "hangman1", "hangman2", "hangman3", "hangman4", "hangman5", "hangman6"]
    var stackView1 = UIStackView()
    var win: Bool = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentGuessTextfield.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        currentGuessTextfield.delegate = self
        hangmanImageView.image = UIImage(named: imageArray[0])
    }
    
    //This is executed when the start button is pressed
    @IBAction func startGameButtonPressed(_ sender: UIBarButtonItem)
    {
        startGame()
    }
    

    //This starts the game. A random word is selected and blank spaces are displayed on the screen
    func startGame()
    {
        hangmanImageView.image = UIImage(named: imageArray[0])
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
        stackView1 = UIStackView(arrangedSubviews: labels)
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.alignment = .fill
        stackView1.spacing = 15
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        viewHolder.addSubview(stackView1)
        gameOver = true
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
    
    //This limits the textfield to only allow 1 character to be entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        guard let textFieldText = currentGuessTextfield.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }
    
    //This code is executed when the game ends
    func gameEnded()
    {
        currentWord = ""
        letters = Array()
        labels = Array()
        incorrectGuesses = Array()
        gameOver = true
        guessedLetter = ""
        i = 0
        incorrectGuessLabel.text = ""
        stackView1.removeFromSuperview()
        if (win)
        {
            hangmanImageView.image = UIImage(named: "win")
        }
        else
        {
            hangmanImageView.image = UIImage(named: "lose")
        }
        win = true
    }
    
    //This code is executed when the user clicks the guess button
    @IBAction func guessButtonPressed(_ sender: UIButton)
    {
        guessedLetter = currentGuessTextfield.text!
        var index = 0
        currentGuessTextfield.text=""
        gameOver = true
        var found = false
        
        for letter in letters
        {
            //This code is executed if the letter the user guesses is in the word
            if letter==guessedLetter
            {
                labels[index].text = letter
                found = true
            }
            index+=1
        }
        //This code is executed if the letter the user guesses is not in the word
        if (!found)
        {
            incorrectGuesses.append(guessedLetter)
            incorrectGuessLabel.text = "\(incorrectGuesses)"
            i += 1
            if (i<=6)
            {
                gameOver = false
                hangmanImageView.image = UIImage(named: imageArray[i])
            }
            else
            {
                win = false
            }
        }
        if (found)
        {
            for label in labels
            {
                if label.text == "_"
                {
                    gameOver = false
                }
            }
        }
        if (gameOver)
        {
            gameEnded()
        }
        
    }
    

}

