//
//  ViewController.swift
//  Quiz Application
//
//  Created by macbook on 28/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonPlay: UIButton!{
        didSet {
            buttonPlay.layer.cornerRadius = buttonPlay.frame.height/2
        }
    }
    @IBOutlet weak var buttonTopic: UIButton!{
        didSet {
            buttonTopic.layer.cornerRadius = buttonTopic.frame.height/2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func actionButtonPlay(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionButtonTopic(_ sender: UIButton) {
        
    }
        
}

