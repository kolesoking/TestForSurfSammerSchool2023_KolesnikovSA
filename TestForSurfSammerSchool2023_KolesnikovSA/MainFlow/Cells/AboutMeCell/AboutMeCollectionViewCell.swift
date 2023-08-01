//
//  AboutMeCollectionViewCell.swift
//  TestForSurfSammerSchool2023_KolesnikovSA
//
//  Created by Sergey Kolesnikov on 01.08.2023.
//

import UIKit

class AboutMeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - PrivateMethods

private extension AboutMeCollectionViewCell {
    
    func configureAppearance() {
        backgroundColor = .white
        
        titleLabel.text = "О себе"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .black
        
        aboutMeLabel.text = """
        Уже более года я занимаюсь программированием на языке Swift, мне бы хотелось развиваться в этой области и работать в команде профессионалов.
        Я имею знания в области разработки приложений, включая архитектуры MVC/MVP/MVVM, работу с API, многопоточность и работу с памятью. Уверен, что моя страсть к программированию и мой опыт работы с iOS-приложениями могут быть полезны для вашей команды разработчиков.
        Всегда стремлюсь к совершенству и постоянно изучаю новые технологии и методы разработки. Я готов работать в команде, обмениваться знаниями и опытом, чтобы достичь общих целей.
        """
        aboutMeLabel.font = .systemFont(ofSize: 14)
        aboutMeLabel.numberOfLines = 0
        aboutMeLabel.textColor = .black
        
    }
}
