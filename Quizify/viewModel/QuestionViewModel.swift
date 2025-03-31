//
//  QuestionViewModel.swift
//  Quiz Application
//
//  Created by macbook on 30/11/23.
//

import Foundation

class QuestionViewModel {
    var questionData:DataModel?
    private var sourceURL = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")!
    
    func apiToGetQuestionData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourceURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalMo = try! jsonDecoder.decode(DataModel.self, from: data)
                self?.questionData = finalMo
                completion()
            }
        }.resume()
    }
}
