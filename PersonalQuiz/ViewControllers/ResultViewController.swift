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
        var animalsCount: [Animal: Int] = [:]
        var resultAnimal: Animal!
        
        for answer in answers {
            if let count = animalsCount[answer.animal] {
                animalsCount[answer.animal] = count + 1
            } else {
                animalsCount[answer.animal] = 1
            }
        }
        
        let maximumValue = animalsCount.values.max()
        if let animal = animalsCount.first(where: { $0.value == maximumValue })?.key {
            resultAnimal = animal
        }
        
        return resultAnimal
    }
}
