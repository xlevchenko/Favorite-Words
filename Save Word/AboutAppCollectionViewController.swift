//
//  AboutAppCollectionViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 1/8/23.
//

import UIKit
import SnapKit

private let cellIdentifier = "AboutAppCell"

class AboutAppCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    lazy var scrollButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(AboutAppCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.isPagingEnabled = true
        
        view.setNeedsUpdateConstraints()
        
        view.addSubview(scrollButtonsStackView)
    }
    
    let pages = [
        AboutAppPage(imageName: "AboutAppImage1", headerText: "Create word lists", bodyText: "Create your word lists and add the words you want to learn to them."),
        AboutAppPage(imageName: "AboutAppImage1", headerText: "Learn new words", bodyText: "Study the word at a time convenient for you. Make the process more interesting with the Quiz game."),
        AboutAppPage(imageName: "AboutAppImage3", headerText: "Pronounce the words correctly", bodyText: "Learn to speak correctly and beautifully. Listen to the speech of the words of the audio assistant and repeat after him.")
    ]

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AboutAppCollectionViewCell
        let pages = pages[indexPath.item]
        cell.aboutAppPage = pages
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //Layout constraint
    override func updateViewConstraints() {
        scrollButtonsStackView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
        }
        super.updateViewConstraints()
    }
}
