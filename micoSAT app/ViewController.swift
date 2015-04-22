//
//  ViewController.swift
//  micoSAT app
//
//  Created by Khagay . Nagdimov on 1/27/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variables
    var questionData = QModel()
    var subject = 0
    var numberOfTries = 3
    var numberOfPoints = 0
    var currentQuestion = 0
    var gameOver = false
    
    // UI Outlets
    // labels
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var currentNumberOfPoints: UILabel!
    
    // buttons
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    @IBOutlet weak var answerFiveButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    // actions when a button is pressed
    @IBAction func answerOneButtonPressed(sender: UIButton) {
        NSLog("button one pressed")
        answerQuestion(questionData.questions[currentQuestion], answer: 0)
    }
    @IBAction func answerTwoButtonPressed(sender: UIButton) {
        NSLog("button two pressed")
        answerQuestion(questionData.questions[currentQuestion], answer: 1)
    }
    @IBAction func answerThreeButtonPressed(sender: UIButton) {
        NSLog("button three pressed")
        answerQuestion(questionData.questions[currentQuestion], answer: 2)
    }
    @IBAction func answerFourButtonPressed(sender: UIButton) {
        NSLog("button four pressed")
        answerQuestion(questionData.questions[currentQuestion], answer: 3)
    }
    @IBAction func answerFiveButtonPressed(sender: UIButton) {
        NSLog("button four pressed")
        answerQuestion(questionData.questions[currentQuestion], answer: 4)
    }
    @IBAction func nextButtonPressed(sender: UIButton) {
        nextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switch(subject){
        case 0:
            questionData.fillMath()
            break
        case 1:
            questionData.fillReading()
            break
        case 2:
            questionData.fillWriting()
            break
        case _:
            break
        }
        currentNumberOfPoints.text = "\(numberOfPoints)"
        startUpQuestion(questionData.questions[currentQuestion])
        questionLabel.numberOfLines = 0
        homeButton.hidden = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // starts the question
    func startUpQuestion(questionObj:Question) {
        // set up the text in the label
        questionLabel.text = "\(questionObj.question)"
        
        // set up answers
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton, answerFiveButton]
        var i = 0
        for i in 0..<answerButtons.count {
            // set the answer
            answerButtons[i].setTitle("\(questionObj.answers[i])", forState: UIControlState.Normal)
            // make sure it is visible and enabled
            answerButtons[i].hidden = false
            answerButtons[i].enabled = true
            // change the color back to the default
            answerButtons[i].setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        nextQuestionButton.hidden = true
        
    }
    
    // handling when the question is answered
    func answerQuestion(questionObj:Question, answer: Int) {
        
        // set up answers
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton, answerFiveButton]
        var i = 0
        for i in 0..<answerButtons.count {
            answerButtons[i].enabled = false
            if i == questionObj.correctAnswerIndex {
                // color correct answer green
                answerButtons[i].setTitleColor(UIColor.greenColor(), forState: .Normal)
            } else if i != questionObj.correctAnswerIndex {
                // color wrong answer red
                answerButtons[i].setTitleColor(UIColor.redColor(), forState: .Normal)
            }
        }
        
        if (questionObj.correctAnswerIndex == answer) {
            addPoints(1)
        } else {
            reduceTries()
        }
        nextQuestionButton.hidden = false
    }
    
    // handling for next question
    func nextQuestion() {
        currentQuestion++
        
        if (questionData.questions.count == currentQuestion){
            endGame()
        } else if !gameOver {
            startUpQuestion(questionData.questions[currentQuestion])
        }
    }
    
    // i gave players 3 tries, reduce tries here, maybe indicator on screen later
    func reduceTries () {
        numberOfTries -= 1
        
        if numberOfTries == 0 {
            endGame()
        }
    }
    
    // give them points, simple for now
    func addPoints(points:Int) {
        numberOfPoints += points
        currentNumberOfPoints.text = "\(numberOfPoints)"
    }
    
    func endGame() {
        
        gameOver = true
        var gameOverText = "Game Over"
        
        if numberOfPoints == questionData.questions.count {
            gameOverText += "\nPerfect!\nNice!"
        } else if numberOfPoints >= (questionData.questions.count-2) {
            gameOverText += "\nPretty good."
        } else {
            gameOverText += "\nYou should have paid more attention in class."
        }
        
        var answerButtons = [answerOneButton, answerTwoButton,  answerThreeButton , answerFourButton, answerFiveButton]
        var i = 0
        
        for i in 0..<answerButtons.count {
            answerButtons[i].hidden = true
        }
        
        questionLabel.text = gameOverText
        nextQuestionButton.hidden = true
        homeButton.hidden = false
        
    }
    

}

