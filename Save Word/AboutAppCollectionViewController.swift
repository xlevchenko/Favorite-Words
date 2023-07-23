//
//  AboutAppCollectionViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 1/8/23.
//

import UIKit
import SnapKit
import Combine


enum PageAboutApp: Int, CaseIterable {
    case one = 0
    case two
    case tree
    case four
}

class AboutAppCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .gray
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var scrollButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let pages = [
        AboutAppPage(imageName: "AboutAppImage1", headerText: "Creating your word lists", bodyText: "The first step is to build your very own word lists. By doing so, you'll have the chance to focus on the words that genuinely interest you or those that are relevant to your studies or profession. These lists will be your personal toolkit for learning and growth."),
        AboutAppPage(imageName: "AboutAppImage2", headerText: "Expand your vocabulary with Quiz Games", bodyText: "With our flexible study approach and fun Quiz game, you can now make the process of language acquisition more enjoyable and effective."),
        AboutAppPage(imageName: "AboutAppImage3", headerText: "The Power of Listening", bodyText: "Listening attentively is the first step in honing your pronunciation. The audio assistant is here to guide you with accurate pronunciation and enunciation. Pay close attention to how each word is pronounced, focusing on the sounds, stress, and rhythm.")
    ]
    
    
    //MARK: - App Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AboutAppCollectionViewCell.self, forCellWithReuseIdentifier: AboutAppCollectionViewCell.cellIdentifier)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(handlePrevButton), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .touchUpInside)
        
        view.addSubview(scrollButtonsStackView)
        view.setNeedsUpdateConstraints()
    }
    
    
    //MARK: - App Action Methods
    @objc func handlePrevButton() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(page: indexPath.item)
    }
    
    @objc func handleNextButton() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(page: pageControl.currentPage)
    }
    
    @objc func handlePageControl() {
        let currentPage = pageControl.currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(page: currentPage)
    }
    
    func updateButtonState(page: PageAboutApp.RawValue) {
        switch page {
        case 0:
            prevButton.setTitle("", for: .normal)
            prevButton.isEnabled = false
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.setTitleColor(.black, for: .normal)
        
        case 1:
            prevButton.isEnabled = true
            prevButton.setTitle("PREV", for: .normal)
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.setTitleColor(.black, for: .normal)
       
        case 2:
            prevButton.isEnabled = true
            prevButton.setTitle("PREV", for: .normal)
            nextButton.setTitle("START!", for: .normal)

        default:
            print(#function)
        }
    }
    
    
   @objc func pushStartViewController() {
        let aboutAppCollectionVC = WelcomeViewController()
        let navigationController = UINavigationController(rootViewController: aboutAppCollectionVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    
    //MARK: - Override Methods
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        updateButtonState(page: pageControl.currentPage)
    }
}


//MARK: - UICollectionViewDataSource
extension AboutAppCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutAppCollectionViewCell.cellIdentifier, for: indexPath) as! AboutAppCollectionViewCell
        let pages = pages[indexPath.row]
        cell.configureAppPage = pages
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


//MARK: - Layout constraint
extension AboutAppCollectionViewController {
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
