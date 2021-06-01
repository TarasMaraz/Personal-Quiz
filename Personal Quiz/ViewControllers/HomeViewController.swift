//
//  HomeViewController.swift
//  Personal Quiz
//
// 
//

import UIKit

class HomeViewController: UIViewController {
    let questions = Question.getQuestions()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController,
              let vc = navigationVC.topViewController as? QuestionsViewController
        else { return }
        
        vc.questions = questions
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { }
}
