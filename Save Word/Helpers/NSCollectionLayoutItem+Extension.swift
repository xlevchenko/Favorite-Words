//
//  NSCollectionLayoutItem+Extension.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/15/23.
//

import UIKit

extension NSCollectionLayoutItem {
    static func withEntireSize() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    static func entireWidth(withHeight height: NSCollectionLayoutDimension) -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: height)
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    static func entireSize(with width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension) -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    static func entireSizeGroup(with width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension) -> NSCollectionLayoutGroup {
        let itemSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        return NSCollectionLayoutGroup(layoutSize: itemSize)
    }
}
