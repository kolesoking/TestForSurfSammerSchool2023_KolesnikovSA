//
//  MainViewController.swift
//  TestForSurfSammerSchool2023_KolesnikovSA
//
//  Created by Sergey Kolesnikov on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let backgroundColorCollectionView = UIColor(red: 243 / 255, green: 243 / 255, blue: 245 / 255, alpha: 1)
        
    }
    
    // MARK: - Views
    
    var collectionView: UICollectionView! = nil
    
    // MARK: - PrivateProperties
    
    private var skills: [String] = ["Swift", "CocoaPods"]
    private var deletionOff = true
    
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColorCollectionView
        setupCollectionView()
        configureAppearance()
        
    }
    
    // MARK: - Methods
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell") // TODO: -
        collectionView.register(UINib(nibName: "\(InfoCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(InfoCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "\(ButtonCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(ButtonCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "\(AboutMeCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(AboutMeCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "\(SkillCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(SkillCollectionViewCell.self)")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - PrivateMethods

private extension MainViewController {
    
    func configureAppearance() {
        title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = Constants.backgroundColorCollectionView
    }
    
    func addButtonTogle() {
        if deletionOff == false {
            skills.append("+")
        } else {
            skills.remove(at: skills.count - 1)
        }
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Недопустимое значение", message: "Попробуйте снова", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ок", style: .default) { _ in
            self.dismiss(animated: true)
            self.showAlert()
        }
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Добавить", style: .default) { action in
            let textField = alert.textFields?.first
            guard let text = textField?.text else { return }
            if text != "+" {
                self.skills.insert(text, at: self.skills.count - 1)
                self.collectionView.reloadData()
            } else {
                self.showErrorAlert()
            }
        }
        let cancelButton = UIAlertAction(title: "Отмена", style: .default) { action in
            self.dismiss(animated: true)
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Введите навык"
        }
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        return  UICollectionViewCompositionalLayout { (sectionNumber, evr) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(280))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                let spacing = CGFloat(20)
                group.interItemSpacing = .fixed(spacing)

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing

                return section
            case 1:

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                let spacing = CGFloat(20)
                group.interItemSpacing = .fixed(spacing)

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing

                return section
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(44), heightDimension: .absolute(44))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
                let spacing = CGFloat(20)
                group.interItemSpacing = .fixed(spacing)

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                return section
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.8))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                let spacing = CGFloat(20)
                group.interItemSpacing = .fixed(spacing)

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing

                return section
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return skills.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InfoCollectionViewCell.self)", for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ButtonCollectionViewCell.self)", for: indexPath)
            guard let cell = cell as? ButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.didEditingTapped = {
                self.deletionOff.toggle()
                self.addButtonTogle()
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SkillCollectionViewCell.self)", for: indexPath)
            guard let cell = cell as? SkillCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.skillLabel.text = skills[indexPath.row]
            cell.hiddenButton = deletionOff
            if skills[indexPath.row] == "+" {
                cell.hiddenButton = true
            }
            cell.didDeliteButton = {
                self.skills.remove(at: indexPath.row)
                collectionView.reloadData()
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AboutMeCollectionViewCell.self)", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            if indexPath.row == skills.count - 1 {
//                skills.insert("new", at: skills.count - 1)
                showAlert()
            }
        }
    }
}
