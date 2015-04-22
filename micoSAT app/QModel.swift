//
//  QModel.swift
//  micoSAT app
//
//  Created by Kong Huang on 2/13/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import Foundation


class QModel {
    
    // array of questions, get it from the database later
    var questions: Array<Question>
    
    init () {
        questions = []
    }
    
    func fillReading(){
        questions.removeAll()
        questions.append(Question(question: "Insert reading quesiton here", answers:["1", "2", "3", "4", "5"], correctAnswerIndex: 1))
    }
    
    func fillMath(){
        questions.removeAll()
        // hard coding in the questions for now
        questions.append(Question(question: "Sheila works 8 hours per day on Monday, Wednesday and Friday, and 6 hours per day on Tuesday and Thursday. She does not work on Saturday and Sunday. She earns $324 per week. How much does she earn in dollars per hour?", answers:["11", "10", "9", "8", "7"], correctAnswerIndex: 2))

    }
    
    func fillWriting(){
        questions.removeAll()
        questions.append(Question(question: "Insert writing question here", answers:["1", "2", "3", "4", "5"], correctAnswerIndex: 1))
        
    }
}

// class for question, contains answers and question and what the correct answer is
class Question {
    var question: String
    var answers: Array<String>
    var correctAnswerIndex: Int
    
    init(question: String,answers:Array<String>,correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func isGuessCorrect(guessNumber: Int) -> Bool {
        return correctAnswerIndex == Int(guessNumber-1)
    }
    
}