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
        // Сalcualte time
        let time = ContinuousClock().measure {
            getResultAnimal()
        }
        print(time)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

extension ResultViewController {
    private func getResultAnimal() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }

        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals.updateValue(1, forKey: animal)
            }
        }

        let sortedFrequentOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)"
        resultInfoLabel.text = animal.definition
    }
}
