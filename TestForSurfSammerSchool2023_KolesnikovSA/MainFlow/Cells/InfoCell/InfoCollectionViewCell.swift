//
//  InfoCollectionViewCell.swift
//  TestForSurfSammerSchool2023_KolesnikovSA
//
//  Created by Sergey Kolesnikov on 01.08.2023.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let viewBackgroundColor = UIColor(red: 243 / 255, green: 243 / 255, blue: 245 / 255, alpha: 1)
        static let professionAndPlaceTextColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
    }
    
    // MARK: - Views
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - PrivateMethods

private extension InfoCollectionViewCell {
    
    func configureAppearance() {
        backgroundColor = Constants.viewBackgroundColor
        
        mainImage.backgroundColor = .red
        mainImage.layer.cornerRadius = mainImage.frame.width / 2
        
        nameLabel.text = "Колесников Сергей Александрович"
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        
        professionLabel.text = "Trainee iOS-разработчик"
        professionLabel.font = .systemFont(ofSize: 14)
        professionLabel.numberOfLines = 2
        professionLabel.textAlignment = .center
        professionLabel.textColor = Constants.professionAndPlaceTextColor
        
        placeLabel.text = "Воронеж"
        placeLabel.font = .systemFont(ofSize: 14)
        placeLabel.numberOfLines = 1
        placeLabel.textAlignment = .left
        placeLabel.textColor = Constants.professionAndPlaceTextColor
    }
}
