//
//  ViewController.swift
//  Quizzler
//
//  Created by Anna Zaitsava on 3.08.23.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet var questionText: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var variantOneButton: UIButton!
    
    @IBOutlet var variantTwoButton: UIButton!
    
    @IBOutlet var variantThreeButton: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        variantOneButton.layer.cornerRadius = 20
        variantTwoButton.layer.cornerRadius = 20
        variantThreeButton.layer.cornerRadius = 20
        
       updateUI()
    }
    
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userRight = quizLogic.checkAnswer(userAnswer)
        
        
        if userRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    
    
    @objc func updateUI() {
        questionText.text = quizLogic.getText()
        
        let variants = quizLogic.getAnswer()
//        variantOneButton.titleLabel?.text = variants[0]
//        variantTwoButton.titleLabel?.text = variants[1]
//        variantThreeButton.titleLabel?.text = variants[2]
        variantOneButton.setTitle(variants[0], for: .normal)
        variantTwoButton.setTitle(variants[1], for: .normal)
        variantThreeButton.setTitle(variants[2], for: .normal)
        
        variantOneButton.backgroundColor = UIColor.clear
        variantTwoButton.backgroundColor = UIColor.clear
        variantThreeButton.backgroundColor = UIColor.clear
        progressBar.progress = quizLogic.getProgress()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
    }
    
}
     



    



