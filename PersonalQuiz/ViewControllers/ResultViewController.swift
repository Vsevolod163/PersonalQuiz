//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vsevolod Lashin on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultInfoLabel: UILabel!
    
    var answersChosen: [Answer]!
    var questions: [Question]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    
        let resultAnimal = getResultAnimalIn(answers: answersChosen)
        
        resultAnimalLabel.text = "Вы - \(resultAnimal.rawValue)"
        resultInfoLabel.text = resultAnimal.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getResultAnimalIn(answers: [Answer]) -> Animal {
        var animalsCount: [Int] = Array(repeating: 0, count: 4)

        for answer in answers {
            switch answer.animal {
            case .dog:
                animalsCount[0] += 1
            case .cat:
                animalsCount[1] += 1
            case .rabbit:
                animalsCount[2] += 1
            case .turtle:
                animalsCount[3] += 1
            }
        }
        
        let maximumElemet = animalsCount.max() ?? 0
        let indexOfMaxElement = animalsCount.firstIndex(of: maximumElemet)

        switch indexOfMaxElement {
        case 0:
            return Animal.dog
        case 1:
            return Animal.cat
        case 2:
            return Animal.rabbit
        case 3:
            return Animal.turtle
        default:
            return Animal.dog
        }
    }
}
