//
//  ViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 9/3/22.
//

import UIKit
import SnapKit

enum SectionLayoutKind {
    case listWords
}

class HomeViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let profileStatusView = ProfileStatusView()
    let dashboardView = DashboardView()
    var collectionView: UICollectionView!
    
    let searchButton: UIButton  = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "SearchButton"), for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        scrollView.showsVerticalScrollIndicator = false
        
        setupCollectionView()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //collectionView.reloadData()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(WordsListCell.self, forCellWithReuseIdentifier: WordsListCell.cellIdentifier)
        collectionView.register(HeaderReusableViewі.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableViewі.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.isScrollEnabled = false
        
        
    }
    
    func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileStatusView)
        contentView.addSubview(searchButton)
        contentView.addSubview(dashboardView)
        contentView.addSubview(collectionView)

        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets.zero)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        profileStatusView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(0)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.height.equalTo(63)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(profileStatusView.snp.right).offset(30)
            make.right.equalTo(contentView.snp.right).offset(-30)
            make.centerY.equalTo(profileStatusView.snp.centerY)
        }
        
        dashboardView.snp.makeConstraints { make in
            make.top.equalTo(profileStatusView.snp.bottom).offset(25)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.height.equalTo(146)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(dashboardView.snp.bottom).offset(15)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(430)
        }
        
        super.updateViewConstraints()
    }
}

//MARK: - Create Compositional Layout
extension HomeViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            // Creating a section for each section index
            let sectionLayoutKind = self.sectionLayoutKind(for: sectionIndex)
            return self.createSectionLayout(for: sectionLayoutKind)
        }
        return layout
    }
    
    private func sectionLayoutKind(for sectionIndex: Int) -> SectionLayoutKind {
        // Setting markup for each section index
        switch sectionIndex {
        default:
            return .listWords
            
        }
    }
    
    private func createSectionLayout(for layoutKind: SectionLayoutKind) -> NSCollectionLayoutSection {
        switch layoutKind {
            
        case .listWords:
            let fraction: CGFloat = 1 / 2
            
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            
            //header view
            addStandardHeader(toSection: section)
            
            return section
        }
    }
    
    private func addStandardHeader(toSection section: NSCollectionLayoutSection) {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        section.boundarySupplementaryItems += [headerElement]
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordsListCell.cellIdentifier, for: indexPath) as! WordsListCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableViewі.cellIdentifier, for: indexPath) as! HeaderReusableViewі
            //headerView.titleLabelx.text = "fgdfgdfrge"
            if indexPath.section == 0 {
                headerView.configure(with: "All Sets", buttonTitle: "View All")
                headerView.allSetsButton.titleLabel?.textColor = .black
            }
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
