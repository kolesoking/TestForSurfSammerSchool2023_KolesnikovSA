//
//  ButtonCollectionViewCell.swift
//  TestForSurfSammerSchool2023_KolesnikovSA
//
//  Created by Sergey Kolesnikov on 01.08.2023.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let editingImage = UIImage(named: "editing")
        static let saveImage = UIImage(named: "save")
    }
    
    // MARK: - Views
    
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var editingButton: UIButton!
    
    // MARK: - Events
    
    var didEditingTapped: (() -> Void)?
    
    // MARK: - Calculated
    
    var buttonImage: UIImage? {
        return editing ? Constants.saveImage : Constants.editingImage
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        editing = false
    }

    // MARK: - Properties
    
    var editing: Bool = true {
        didSet {
            editingButton.setImage(buttonImage, for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func editingAction(_ sender: Any) {
        didEditingTapped?()
        editing.toggle()
    }
}

// MARK: - PrivateMethods

private extension ButtonCollectionViewCell {
    func configureAppearance() {
        backgroundColor = .white
        
        skillLabel.text = "Мои навыки"
        skillLabel.font = .systemFont(ofSize: 16)
        skillLabel.textColor = .black
        
        editingButton.tintColor = .black
    }
}
