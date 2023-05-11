//
//  DetailViewController.swift
//  finalTest3month
//
//  Created by atay on 11/5/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.text = "Pizza with Mushrooms"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "detailMushrooms")
        return image
    }()
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.text = "Choose the size"
        label.textColor = .black
        return label
    }()
    
    private let sizeButton8: UIButton = {
        let button =  UIButton()
        button.setTitle("8 inch", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        return button
    }()
    
    private let sizeButton20: UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(named: "ButtonShadow"), for: .normal)
        button.setTitle("20 inch", for: .normal)
        button.restorationIdentifier = "sizeButton20"
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let sizeButton32: UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(named: "ButtonShadow"), for: .normal)
        return button
    }()
    
    private let sizeLabel20: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6500778794, green: 0.6500778198, blue: 0.6500778198, alpha: 1)
        label.text = "20 inch"
        label.restorationIdentifier = "sizeLabel20"
        return label
    }()
    
    private let sizeLabel8: UILabel = {
        let label = UILabel()
        label.text = "8 inch"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let sizeLabel32: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6500778794, green: 0.6500778198, blue: 0.6500778198, alpha: 1)
        label.text = "32 inch"
        return label
    }()
    
    private let viewButton8 = UIView()
    private let viewButton20 = UIView()
    private let viewButton32 = UIView()
    
    private let bgAmount: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let buttonMinus: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        return button
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        label.text = "01"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private let buttonPlus: UIButton = {
        let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5843137255, green: 0.5843137255, blue: 0.5843137255, alpha: 1)
        label.text = "Price"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1843137255, green: 0.7019607843, blue: 0, alpha: 1)
        label.text = "$12.00"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navBarUpdate()
        addViews()
        addConstrains()
        updateIndo()
    }
    
    private func updateIndo() {
        nameLabel.text = food?.foodName
        foodImage.image = UIImage(named: food!.detailImage)
        labelPrice.text = "$\(food!.price).00"
    }
    
    private func addViews() {
        view.addSubview(viewButton8)
        view.addSubview(viewButton20)
        view.addSubview(viewButton32)
        viewButton8.addSubview(sizeButton8)
        viewButton20.addSubview(sizeButton20)
        viewButton32.addSubview(sizeButton32)
        viewButton20.addSubview(sizeLabel20)
        viewButton8.addSubview(sizeLabel8)
        viewButton32.addSubview(sizeLabel32)
        
        view.addSubview(nameLabel)
        view.addSubview(foodImage)
        view.addSubview(chooseLabel)
        
        view.addSubview(bgAmount)
        bgAmount.addSubview(buttonPlus)
        bgAmount.addSubview(buttonMinus)
        bgAmount.addSubview(amountLabel)
        
        view.addSubview(addButton)
        view.addSubview(labelPrice)
        view.addSubview(priceLabel)
    }
    
    private func addConstrains() {
        //labelName
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.centerX.equalToSuperview()
            make.height.equalTo(96)
        }
        
        //foodImage
        foodImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        //Choos label
        chooseLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(foodImage.snp.bottom).offset(24)
        }
        
        //20 size bottons && view
        viewButton20.snp.makeConstraints { make in
            make.top.equalTo(chooseLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        sizeButton20.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        sizeLabel20.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        //8 size bottons && view
        viewButton8.snp.makeConstraints { make in
            make.top.equalTo(chooseLabel.snp.bottom).offset(24)
            make.trailing.equalTo(viewButton20.snp.leading).offset(-12)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        sizeButton8.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview().inset(11)
        }
    
        sizeLabel8.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        //32 size bottons && view
        viewButton32.snp.makeConstraints { make in
            make.top.equalTo(chooseLabel.snp.bottom).offset(24)
            make.leading.equalTo(viewButton20.snp.trailing).offset(12)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        sizeButton32.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        sizeLabel32.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        //amount views && buttons && label
        bgAmount.snp.makeConstraints { make in
            make.top.equalTo(viewButton20.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(200)
        }
        
        buttonPlus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-31)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        buttonMinus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(31)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        buttonPlus.addTarget(self, action: #selector(buttonPlusTapped), for: .touchUpInside)
        buttonMinus.addTarget(self, action: #selector(buttonMinusTapped), for: .touchUpInside)
        
        //addButton
        addButton.snp.makeConstraints { make in
            make.top.equalTo(bgAmount.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-35)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        
        //priceLabels
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(bgAmount.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
        }
        labelPrice.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.leading.equalToSuperview().offset(40)
        }
    }

    //updateAddButton
    private var amount = 1
    
    @objc private func buttonPlusTapped() {
        let price = Int(food!.price)
        if amount < 9 {
            amount += 1
            let price = price! * amount
            labelPrice.text = "$\(price).00"
            amountLabel.text = "0\(amount)"
        }
    }
    
    @objc private func buttonMinusTapped() {
        let price = Int(food!.price)
        if amount > 1 {
            amount -= 1
            let price = price! * amount
            labelPrice.text = "$\(price).00"
            amountLabel.text = "0\(amount)"
        }
    }
    
    //updateNavBar
    private func navBarUpdate() {
               title = "Detail"
        createCustomNavigationBar()
        
        let backLeftButton = createCustomButton(
            imageName: "arrow.left",
            selector: #selector(backLeftButtonTapped))
        let heartRightButton = createCustomButton(
            imageName: "heart",
            selector: #selector(heartRightButtonTapped))
        navigationItem.leftBarButtonItem = backLeftButton
        navigationItem.rightBarButtonItem = heartRightButton
    }
    @objc private func backLeftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    var likeChack = 1
    @objc private func heartRightButtonTapped(sender: UIBarButtonItem) {
        if likeChack == 1 {
            let heartRightButton = createCustomButton(
                imageName: "heart.fill",
                selector: #selector(heartRightButtonTapped))
            navigationItem.rightBarButtonItem = heartRightButton
            heartRightButton.customView?.tintColor = .red
            likeChack = 2
        } else {
            let heartRightButton = createCustomButton(
                imageName: "heart",
                selector: #selector(heartRightButtonTapped))
            navigationItem.rightBarButtonItem = heartRightButton
            likeChack = 1
        }
    }
}
