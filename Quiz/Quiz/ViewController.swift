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
        
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOfScreenLabel()
    }
    
    func updateOfScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

    
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
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
    
    
    func animateLabelTransitions() {
//        let animationClosure = {
//            () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        
//        //Animate the alpha
//        UIView.animateWithDuration(0.5, animations: animationClosure)
//        UIView.animateWithDuration(0.5, animations: {
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//        })
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [.CurveLinear, .AllowUserInteraction],//UIViewAnimationOptions
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                self.view.layoutIfNeeded()
                
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                self.updateOfScreenLabel()
        })
        
//        UIView.animateWithDuration(0.5,
//            delay: 0.2,
//            usingSpringWithDamping: 0.5,
//            initialSpringVelocity: 0,
//            options: [.CurveLinear],
//            animations: {
//                self.currentQuestionLabel.alpha = 0
//                self.nextQuestionLabel.alpha = 1
//                self.view.layoutIfNeeded()
//            },
//            completion: {
//                _ in
//                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
//                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
//                self.updateOfScreenLabel()
//        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
}

