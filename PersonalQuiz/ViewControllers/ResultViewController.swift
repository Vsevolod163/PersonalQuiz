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
//        var dogAnswer = 0
//        var catAnswer = 0
//        var rabbitAnswer = 0
//        var turtleAnswer = 0
//
//        for answer in answers {
//            switch answer.animal {
//            case .dog:
//                dogAnswer += 1
//            case .cat:
//                catAnswer += 1
//            case .rabbit:
//                rabbitAnswer += 1
//            case .turtle:
//                turtleAnswer += 1
//            }
//        }
//
//        let animalsAnswers = [dogAnswer, catAnswer, rabbitAnswer, turtleAnswer]
//        let maximumElemet = animalsAnswers.max() ?? 0
//        let indexOfMaxElement = animalsAnswers.firstIndex(of: maximumElemet)
//
//        switch indexOfMaxElement {
//        case 0:
//            return Animal.dog
//        case 1:
//            return Animal.cat
//        case 2:
//            return Animal.rabbit
//        case 3:
//            return Animal.turtle
//        default:
//            return Animal.dog
//        }
        var animals: [Animal: Int] = [:]
        var resultAnimal: Animal!
        
        for answer in answers {
            if let count = animals[answer.animal] {
                animals[answer.animal] = count + 1
            } else {
                animals[answer.animal] = 1
            }
        }
        
        let maxCount = animals.values.max()
        if let mostCommonAnimal = animals.first(where: { $0.value == maxCount })?.key {
            resultAnimal = mostCommonAnimal
        }
        
        return resultAnimal
    }

}
