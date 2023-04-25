//
//  SecondViewController.swift
//  Tipsy Project
//
//  Created by sidzhe on 23.04.2023.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var resultText: String?
    var comment: String?
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per pesrson"
        label.textColor = .systemGray2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.text = "56.32"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35, weight: .heavy)
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 peope, with 10% tip"
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(pressedRecalculate), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var backgrView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Color")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    private func setupViews() {
        totalLabel.text = resultText
        commentLabel.text = comment
        view.backgroundColor = .white
        view.addSubview(backgrView)
        view.addSubview(headerLabel)
        view.addSubview(totalLabel)
        view.addSubview(commentLabel)
        view.addSubview(button)
        
        backgrView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.3)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(100)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.top.equalTo(headerLabel.snp.bottom).inset(-50)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.top.equalTo(headerLabel.snp.bottom).inset(-150)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    @objc private func pressedRecalculate() {
        dismiss(animated: true)
    }
}
