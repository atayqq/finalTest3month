//
//  CustomCollectionViewCell.swift
//  finalTest3month
//
//  Created by atay on 11/5/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let bgView = UIView()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "fast Food"
        label.textColor = #colorLiteral(red: 0.6500778794, green: 0.6500778198, blue: 0.6500778198, alpha: 1)
        return label
    }()
    
    private let shadowView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shadow")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        
        addSubview(shadowView)
        addSubview(bgView)
        bgView.backgroundColor = .white
        bgView.addSubview(label)
        bgView.layer.cornerRadius = 10
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        shadowView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(9)
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setData(text: String) {
        label.text = text
    }
    
    func a() {
        bgView.backgroundColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        label.textColor = .white
        label.font  = .systemFont(ofSize: 18, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        label.textColor = #colorLiteral(red: 0.6500778794, green: 0.6500778198, blue: 0.6500778198, alpha: 1)
    }

}
