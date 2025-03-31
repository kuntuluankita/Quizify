//
//  QuizCollectionViewCell.swift
//  Quiz Application
//
//  Created by macbook on 29/11/23.
//

import UIKit

enum selectedOption{
    case optionalA
    case optionalB
    case optionalC
    case optionalD
}

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var labelOption1: UILabel!
    @IBOutlet weak var labelOption2: UILabel!
    @IBOutlet weak var labelOption3: UILabel!
    @IBOutlet weak var labelOption4: UILabel!
    
    @IBOutlet weak var optionA: UIControl!
    @IBOutlet weak var optionB: UIControl!
    @IBOutlet weak var optionC: UIControl!
    @IBOutlet weak var optionD: UIControl!

    private var correctAnswer: String?
    
    var setValues: Questions? {
        didSet {
            questionLabel.text = setValues?.question
            labelOption1.text = setValues?.option_1
            labelOption2.text = setValues?.option_2
            labelOption3.text = setValues?.option_3
            labelOption4.text = setValues?.option_4
            
            correctAnswer = setValues?.correct_answer
        }
    }
    override func prepareForReuse() {
        updateBoarder(myView: optionA)
        updateBoarder(myView: optionB)
        updateBoarder(myView: optionC)
        updateBoarder(myView: optionD)
       }
       
       var selectedOption: ((_ selectedAnswer: Bool) -> Void)?
    
    
    
    @IBAction func onClickOptionA(_ sender: Any) {
        var isCorrect = false
               
               if correctAnswer == setValues?.option_1 {
                   isCorrect = true
               }
               selectedOption?(isCorrect)
        changeBoarder(selectedOption: .optionalA)
    }
    
    @IBAction func onClickOptionB(_ sender: Any) {
        var isCorrect = false
                
                if correctAnswer == setValues?.option_2 {
                    isCorrect = true
                }
                selectedOption?(isCorrect)
        changeBoarder(selectedOption: .optionalB)
    }
    
    @IBAction func onClickOptionC(_ sender: Any) {
        var isCorrect = false
            
            if correctAnswer == setValues?.option_3 {
                isCorrect = true
            }
            selectedOption?(isCorrect)
        changeBoarder(selectedOption: .optionalC)
    }
    
    @IBAction func onClickOptionD(_ sender: Any) {
        var isCorrect = false
             
             if correctAnswer == setValues?.option_4 {
                 isCorrect = true
             }
             selectedOption?(isCorrect)
        changeBoarder(selectedOption: .optionalD)
    }
    
    func changeBoarder(selectedOption: selectedOption) {
        switch selectedOption {
        case .optionalA:
            updateBoarder(myView: optionA, boarderWidth: 4)
            updateBoarder(myView: optionB)
            updateBoarder(myView: optionC)
            updateBoarder(myView: optionD)
        case .optionalB:
            updateBoarder(myView: optionB, boarderWidth: 4)
            updateBoarder(myView: optionA)
            updateBoarder(myView: optionC)
            updateBoarder(myView: optionD)
        case .optionalC:
            updateBoarder(myView: optionC, boarderWidth: 4)
            updateBoarder(myView: optionB)
            updateBoarder(myView: optionA)
            updateBoarder(myView: optionD)
        case .optionalD:
            updateBoarder(myView: optionD, boarderWidth: 4)
            updateBoarder(myView: optionA)
            updateBoarder(myView: optionC)
            updateBoarder(myView: optionB)
        }
    }
    
    func updateBoarder(myView: UIView, boarderWidth:CGFloat = 0) {
        myView.layer.borderWidth = boarderWidth
        myView.layer.borderColor = UIColor.white.cgColor
    }
}



