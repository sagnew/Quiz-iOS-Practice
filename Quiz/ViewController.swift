//
//  ViewController.swift
//  Quiz
//
//  Created by Sam Agnew on 1/18/16.
//  Copyright (c) 2016 Sam Agnew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7+7?",
        "Vermont's capital?"
    ]
    
    let answers: [String] = [
        "Grapes",
        "14",
        "Montpelier"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        // Animate the alpha
        UIView.animateWithDuration(0.5, delay: 0, options: [], animations: {
                self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        })
    }
    
}

