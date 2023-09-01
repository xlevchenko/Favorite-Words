//
//  AboutAppCollectionViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 1/8/23.
//

import UIKit
import SnapKit


class AboutAppViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    private let viewModel: AboutAppViewModel
    
    private var collectionView: UICollectionView!
    
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
        pc.numberOfPages = pagesDataModel.count
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
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = false
        return button
    }()
    
    
    let pagesDataModel = AboutAppPage.data
    
    var coordinator = MainFlowCoordinator()
    
    
    //MARK: - App Lifecycle methods
    
    init(viewModel: AboutAppViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(handlePrevButton), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        
        
        view.addSubview(collectionView)
        collectionView.addSubview(scrollButtonsStackView)
        collectionView.addSubview(startButton)
        view.setNeedsUpdateConstraints()
    }
    
    
    //MARK: - App Action Methods
    @objc func handlePrevButton() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(index: indexPath.item)
    }
    
    @objc func handleNextButton(sender: UIButton) {
        
        let nextIndex = min(pageControl.currentPage + 1, pagesDataModel.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(index: pageControl.currentPage)
    }
    
    @objc func handlePageControl() {
        let currentPage = pageControl.currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateButtonState(index: currentPage)
    }
    
    @objc func handleStartButton() {
        viewModel.startButtonTapped()
        print("Show Welcome Screen")
    }
    
    func updateButtonState(index: PageApp.RawValue) {
        switch index {
        case 0:
            prevButton.setTitle("", for: .normal)
            prevButton.isEnabled = false
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.setTitleColor(.black, for: .normal)
            print("initPage")
            
        case 1:
            prevButton.isEnabled = true
            prevButton.setTitle("PREV", for: .normal)
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.setTitleColor(.black, for: .normal)
            startButton.isEnabled = false
            print("nextPage")
            
        case 2:
            prevButton.isEnabled = true
            prevButton.setTitle("PREV", for: .normal)
            nextButton.setTitle("START!", for: .normal)
            startButton.isEnabled = true
            print("lastPage")
            
        default: break
        }
    }
    
    
    //MARK: - Override Methods
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        updateButtonState(index: pageControl.currentPage)
    }
    
    
    //MARK: - Private Methods
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(AboutAppCollectionViewCell.self, forCellWithReuseIdentifier: AboutAppCollectionViewCell.cellIdentifier)
    }
}


//MARK: - UICollectionViewDataSource
extension AboutAppViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pagesDataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutAppCollectionViewCell.cellIdentifier, for: indexPath) as! AboutAppCollectionViewCell
        let pages = pagesDataModel[indexPath.row]
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
extension AboutAppViewController {
    override func updateViewConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollButtonsStackView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
        }
        
        let width = view.frame.width / 3
        
        startButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(width)
        }
        
        
        super.updateViewConstraints()
    }
}
