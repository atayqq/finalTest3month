//
//  CartViewController.swift
//  finalTest3month
//
//  Created by atay on 9/5/23.
//

import UIKit

class CartViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Зайдите на эту страницу позже"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        view.backgroundColor = .systemGray
    }
}
