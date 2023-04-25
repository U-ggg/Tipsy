//
//  ViewController.swift
//  Tipsy Project
//
//  Created by sidzhe on 23.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var result = ["text" : 0.0, "persent" : 1.0]
    private var discount = String()
    
    private lazy var valueOneButton: UIButton = {
        let button = UIButton()
        button.setTitle("0 %", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        button.addTarget(self, action: #selector(pressedPersent(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var valueTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("10 %", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        button.addTarget(self, action: #selector(pressedPersent(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var valueThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("20 %", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        button.addTarget(self, action: #selector(pressedPersent(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var select: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.textAlignment = .left
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private lazy var stepperLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 2
        stepper.maximumValue = 12
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(pressedStepper(sender:)), for: .valueChanged)
        return stepper
    }()
    
    private lazy var backgrView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Color")
        return view
    }()
    
    private lazy var enterTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.font = .systemFont(ofSize: 30, weight: .semibold)
        textField.placeholder = "e.g. 123.56"
        textField.addTarget(self, action: #selector(typingTextField(sender:)), for: .editingDidEnd)
        return textField
    }()
    
    private lazy var stackViewUpper: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var stackViewLower: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 26
        return view
    }()
    
    private lazy var stackViewStepper: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    private lazy var stackViewValues: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 26
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    private func setupViews() {
        view.addSubview(backgrView)
        view.addSubview(stackViewUpper)
        view.addSubview(button)
        
        backgrView.addSubview(stackViewLower)
        
        stackViewUpper.addArrangedSubview(enterLabel)
        stackViewUpper.addArrangedSubview(enterTextField)
        
        stackViewLower.addArrangedSubview(select)
        stackViewLower.addArrangedSubview(stackViewValues)
        stackViewLower.addArrangedSubview(chooseLabel)
        stackViewLower.addArrangedSubview(stackViewStepper)
        
        stackViewStepper.addArrangedSubview(stepperLabel)
        stackViewStepper.addArrangedSubview(stepper)
        
        stackViewValues.addArrangedSubview(valueOneButton)
        stackViewValues.addArrangedSubview(valueTwoButton)
        stackViewValues.addArrangedSubview(valueThreeButton)
        
        backgrView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(stackViewUpper.snp.bottom)
        }
        
        stackViewUpper.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalTo(backgrView.snp.top)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(40)
        }
        
        stackViewLower.snp.makeConstraints { make in
            make.top.equalTo(backgrView.snp.top).inset(50)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
        
        enterLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        enterTextField.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
    }
    
    @objc private func pressedButton() {
        let totalValue = result["text"]! * result["persent"]! / stepper.value
        let secondVC = SecondViewController()
        secondVC.resultText = String(format: "%.2f", totalValue)
        secondVC.comment = "Split between \(Int(stepper.value)) people with \(discount) tip"
        present(secondVC, animated: true)
    }
    
    @objc private func pressedPersent(sender: UIButton) {
        valueOneButton.isSelected = false
        valueTwoButton.isSelected = false
        valueThreeButton.isSelected = false
        valueOneButton.backgroundColor = .clear
        valueTwoButton.backgroundColor = .clear
        valueThreeButton.backgroundColor = .clear
        sender.isSelected = true
        sender.backgroundColor = .systemGreen
        discount = sender.currentTitle ?? "0"
        
        switch sender.currentTitle {
        case "0 %":
            result["persent"] = 1
        case "10 %":
            result["persent"] = 0.1
        default:
            result["persent"] = 0.2
        }
    }
    
    @objc private func pressedStepper(sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
    }
    
    @objc private func typingTextField(sender: UITextField) {
        guard let text = Double(sender.text!) else { return }
        result["text"] = Double(text)
    }
    
}

