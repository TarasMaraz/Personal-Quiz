//
//  ResultViewController.swift
//  Personal Quiz
//
//
//

import UIKit


class ResultViewController: UIViewController {
    // 1. Массив ответов
    // 2. Определить наиболее часто встречаемый тип животного
    // 3. Отобразить результат
    // 4. Избавиться от кнопки Back
    
    @IBOutlet var resultsAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
                navigationItem.hidesBackButton = true
                
            }
            
            func calculatePersonalityResult() {
                var frequencyOfAnswers: [AnimalType: Int] = [:]
                let responseTypes = answers.map{ $0.type }
                
                for response in responseTypes {
                    frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
                }
                
                let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
                {(pair1, pair2) -> Bool in
                    return pair1.value > pair2.value
                })
                
                let mostCommonAnswer = frequentAnswersSorted.first!.key
                
                resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
                resultDefinitionLabel.text = mostCommonAnswer.definition
            }
    
    
}
