//
//  AnimatedTransitioning.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol AnimatedTransitioning: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
