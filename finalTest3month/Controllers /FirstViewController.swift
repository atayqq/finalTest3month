//
//  FirstViewController.swift
//  finalTest3month
//
//  Created by atay on 9/5/23.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    private let helloMehrabLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Mehrab"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.searchBarStyle = .minimal
        return search
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filer"), for: .normal)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 55)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let cellID = "cell"
    
    private let pizzaTable: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var foodType: [String] = []
    
    private var foods: [Food] = []
    
    private var filteredFoods: [Food] = []
    
    private var isFiltered: Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        addConstrains()
        subscribeSelf()
        updateInfo()
        

    }
    
    private func subscribeSelf(){
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        pizzaTable.dataSource = self
        pizzaTable.delegate = self
        pizzaTable.register(CustomTableViewCell.self, forCellReuseIdentifier: cellID)
        searchBar.delegate = self
    }
    
    private func addViews(){
        view.addSubview(helloMehrabLabel)
        view.addSubview(welcomeBackLabel)
        view.addSubview(bellButton)
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        view.addSubview(collectionView)
        view.addSubview(pizzaTable)
    }
    
    private func updateInfo() {
        foodType = ["All","Pizza","Fast Food", "Vegan", "Drinks", "Desserts"]
        foods = [Food(detailImage: "detailMushrooms",
                      defaultImage: "defaultMushrooms",
                      foodName: "Pizza with Mushrooms",
                      time: "14-20 minutes",
                      price: "12"),
                 Food(detailImage: "detailPepperoni",
                      defaultImage: "defaultPepperoni",
                      foodName: "Pepperoni Cheese Pizza",
                      time: "18-25 minutes",
                      price: "14"),]
    }
    
    private func addConstrains() {
        helloMehrabLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.equalToSuperview().offset(24)
        }
        
        helloMehrabLabel.snp.makeConstraints { make in
            make.top.equalTo(helloMehrabLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(24)
        }
        
        bellButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(helloMehrabLabel.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(filterButton.snp.leading).offset(-25)
        }
        
        filterButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(bellButton.snp.bottom).offset(37)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(pizzaTable.snp.top)
        }
        pizzaTable.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.setData(text: foodType[indexPath.row])
        if indexPath.row == 1 {
            cell.a() }
        return cell

    }
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteredFoods.count : foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
        cell.setData(food: isFiltered ? filteredFoods[indexPath.row] : foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.food = isFiltered ? filteredFoods[indexPath.row] : foods[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            
            filteredFoods = foods.filter{$0.foodName.contains(searchText)}
        }
        
        pizzaTable.reloadData()
    }
}
   ///EXTENSION
extension UIColor {
    static var tabBarItemAccent: UIColor {
        #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
    }
    static var mainBlack: UIColor {
        #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2039215686, alpha: 1)
    }
    static var tabBarItemLight: UIColor {
        #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
    }
}

extension UIViewController {
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9499530196, green: 0.9499530196, blue: 0.9499530196, alpha: 1)
    }
    func createCustomTitleView(contactName: String,contactDescription: String, contactImage: String) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let imageBack = UIImageView()
        imageBack.image = UIImage(named: contactImage)
        imageBack.frame = CGRect(x: 5, y: 0, width: 40, height: 40)
        view.addSubview(imageBack)
        
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.tintColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}





