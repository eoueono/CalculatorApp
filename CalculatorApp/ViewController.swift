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
        let buttonTitles = [
            "1", "2", "3", "+",
            "4", "5", "6", "-",
            "7", "8", "9", "×",
            "", "0", "", "÷",
            "", "", "", "="
        ]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        var rowStackViews: [UIStackView] = []
        
        for (index, title) in buttonTitles.enumerated() {
            let button = createButton(withTitle: title)
            
            if index % 4 == 0 {
                let rowStackView = UIStackView()
                rowStackView.axis = .horizontal
                rowStackView.spacing = 10
                rowStackView.distribution = .fillEqually
                rowStackViews.append(rowStackView)
                stackView.addArrangedSubview(rowStackView)
            }
            
            rowStackViews[index / 4].addArrangedSubview(button)
        }
    }
        func createButton(withTitle title: String) -> UIButton {
            let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                return button
        }
    @objc func buttonTapped(_ sender: UIButton) {
        if let title = sender.title(for: .normal) {
            resultLabel.text = title // 결과레이블에 누른 버튼의 텍스트 출력하기
        }
    }
}

