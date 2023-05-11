//
//  TabBarViewController.swift
//  finalTest3month
//
//  Created by atay on 9/5/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        tabBarPosition()
        
    }
    
    private func createTabBar(){
        let nav = UINavigationController(rootViewController: FirstViewController())
        viewControllers = [
            createVC(viewController: nav,
                     title: "Home",
                     image: UIImage(systemName: "house.fill")),
            createVC(viewController: FavoriteViewController(),
                     title: "Favorite",
                     image: UIImage(systemName: "heart.fill")),
            createVC(viewController: CartViewController(),
                     title: "Cart",
                     image: UIImage(systemName: "cart.fill")),
            createVC(viewController: OrdersViewController(),
                     title: "My orders",
                     image: UIImage(systemName: "list.clipboard"))
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }
    
    private func tabBarPosition(){
        let positionX: CGFloat = 35
        let positionY: CGFloat = 8
        
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height - positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionX,
                y: tabBar.bounds.minY - positionY,
                width: width,
                height: height
            ),
            cornerRadius: 20
        )
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 6
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.black.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
        
    }
    
}
