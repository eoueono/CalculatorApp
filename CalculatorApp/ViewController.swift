//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 전서영 on 4/12/25.
//

import UIKit

class ViewController: UIViewController {

    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupResultLabel()
        setupCalculatorButtons()
        // Do any additional setup after loading the view.
    }

    func setupResultLabel() {
        resultLabel.text = "0"
            resultLabel.font = UIFont.systemFont(ofSize: 40)
            resultLabel.textAlignment = .right
            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultLabel)

            NSLayoutConstraint.activate([
                resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                resultLabel.heightAnchor.constraint(equalToConstant: 80)
            ])
    }

    func setupCalculatorButtons() {
        
    }
    
}

