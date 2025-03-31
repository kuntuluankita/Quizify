//
//  QuizViewController.swift
//  Quiz Application
//
//  Created by macbook on 29/11/23.
//

import UIKit

class QuizViewController: UIViewController {
    
    var viewModel = QuestionViewModel()
    var questions:[Questions]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var answerSelected = false
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.apiToGetQuestionData { [weak self] in
            self?.questions = self?.viewModel.questionData?.data?.questions
            DispatchQueue.main.async {
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func actionExitButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionNextButton(_ sender: UIButton) {
        if !answerSelected {
            let alert = UIAlertController(title: "Select One Option", message: "Please select one option before moving to the next question.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        
        print(index)
        if index<(self.questions?.count ?? 0) - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
            
        } else {
            // Move the user on the result controller
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
            vc.result = points
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as?
                QuizCollectionViewCell else {
                    return QuizCollectionViewCell()
                }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = questions?[indexPath.row]
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
