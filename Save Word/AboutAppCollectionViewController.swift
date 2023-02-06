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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        //button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrevButton() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if indexPath.item != 2 && indexPath.item != 0 {
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.setTitleColor(.black, for: .normal)
        } else if indexPath.item == 0 {
            prevButton.setTitle("", for: .normal)
        }
    }
    
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNextButton() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if indexPath.item == 2 {
            nextButton.setTitle("START!", for: .normal)
            nextButton.setTitleColor(UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00), for: .normal)
            nextButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        }  else if indexPath.item > 0 {
            prevButton.setTitle("PREV", for: .normal)
        }
    
    }
    
    lazy var scrollButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(AboutAppCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.isPagingEnabled = true
        
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(handlePrevButton), for: .touchUpInside)
        
        view.addSubview(scrollButtonsStackView)
        view.setNeedsUpdateConstraints()
    }
    
    let pages = [
        AboutAppPage(imageName: "AboutAppImage1", headerText: "Create word lists", bodyText: "Create your word lists and add the words you want to learn to them."),
        AboutAppPage(imageName: "AboutAppImage2", headerText: "Learn new words", bodyText: "Study the word at a time convenient for you. Make the process more interesting with the Quiz game."),
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
