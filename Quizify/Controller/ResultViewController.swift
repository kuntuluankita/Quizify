//
//  ResultViewController.swift
//  Quiz Application
//
//  Created by macbook on 29/11/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    var result = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(result)"
    }
    
    @IBAction func actionHomeButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
