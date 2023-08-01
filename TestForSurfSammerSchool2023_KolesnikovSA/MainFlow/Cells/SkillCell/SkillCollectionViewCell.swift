//
//  SkillCollectionViewCell.swift
//  TestForSurfSammerSchool2023_KolesnikovSA
//
//  Created by Sergey Kolesnikov on 01.08.2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let deliteImage = UIImage(named: "delite")
        static let viewBackgroundColor = UIColor(red: 243 / 255, green: 243 / 255, blue: 245 / 255, alpha: 1)
    }
    
    // MARK: - Views

    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var deliteButton: UIButton!

    
    // MARK: - Events
    
    var didDeliteButton: (() -> Void)?
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    // MARK: - Properties
    
    var hiddenButton: Bool = true {
        didSet {
            deliteButton.isHidden = hiddenButton
        }
    }
    
    // MARK: - Actions
    
    @IBAction func deliteAction(_ sender: Any) {
        didDeliteButton?()
        print("asda")
    }
    
}

// MARK: - PrivateMethods

private extension SkillCollectionViewCell {
    func configureAppearance() {
        backgroundColor = Constants.viewBackgroundColor
        layer.cornerRadius = 12
    
        
        skillLabel.text = "TEST test TESTTEST test TEST"
        skillLabel.font = .systemFont(ofSize: 14)
        skillLabel.textColor = .black
        
        deliteButton.setImage(Constants.deliteImage, for: .normal)
    }
}
