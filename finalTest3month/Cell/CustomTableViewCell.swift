//
//  CustomTableViewCell.swift
//  finalTest3month
//
//  Created by atay on 11/5/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let bgView = UIView()
    
    private let shadowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shadow2")
        return image
    }()
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "defaultMushrooms")
        return image
    }()
    
    private let nameFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "Pizza with Mushrooms"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let timerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "timer")
        image.tintColor = #colorLiteral(red: 0.7675942779, green: 0.7675941586, blue: 0.7675942779, alpha: 1)
        return image
    }()
    
    private let timeFoodLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7675942779, green: 0.7675941586, blue: 0.7675942779, alpha: 1)
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.text = "14-20 minutes"
        return label
    }()
    
    private let priceFoodLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1843137255, green: 0.7019607843, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "$12"
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        return button
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
        addConstrains()
    }
    
    func addUI() {
        addSubview(shadowImage)
        addSubview(bgView)
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 15
        bgView.addSubview(foodImage)
        bgView.addSubview(nameFoodLabel)
        bgView.addSubview(timerImage)
        bgView.addSubview(timeFoodLabel)
        bgView.addSubview(priceFoodLabel)
        bgView.addSubview(addButton)
    }
    
    func addConstrains() {
        
        //shadowImage
        
        shadowImage.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        //view
        bgView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(22)
            make.top.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().inset(32)
            make.height.equalTo(184)
        }

        //image
        foodImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }

        //name
        nameFoodLabel.snp.makeConstraints { make in
            make.leading.equalTo(foodImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(68)
            make.top.equalToSuperview().offset(15)
        }
        
        
        //time
        timerImage.snp.makeConstraints { make in
            make.top.equalTo(nameFoodLabel.snp.bottom).offset(14)
            make.leading.equalTo(foodImage.snp.trailing).offset(10)
        }

        timeFoodLabel.snp.makeConstraints { make in
            make.top.equalTo(nameFoodLabel.snp.bottom).offset(18)
            make.leading.equalTo(timerImage.snp.trailing).offset(6)
        }

        //price && addBtn
        addButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(1)
            make.trailing.equalToSuperview().offset(1)
        }

        priceFoodLabel.snp.makeConstraints { make in
            make.leading.equalTo(foodImage.snp.trailing).offset(5)
            make.bottom.equalToSuperview().offset(-16)
        }

    }

    func setData(food: Food) {
        foodImage.image = UIImage(named: food.defaultImage)
        nameFoodLabel.text = food.foodName
        timeFoodLabel.text = food.time
        priceFoodLabel.text = "$\(food.price)"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
