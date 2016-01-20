//
//  ViewController.swift
//  Quiz
//
//  Created by daizhouliang@mac on 16/1/16.
//  Copyright © 2016年 daizhouliang@mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = questions[currentQuestionIndex]
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(sender: AnyObject) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    let questions = ["火星的英文名是啥？",
                    "7+7等于多少呀？",
                    "台湾的省会是那里呀？", ]
    let answers = ["Mars", "14", "台北"]
    
    var currentQuestionIndex = 0
    
    
}

