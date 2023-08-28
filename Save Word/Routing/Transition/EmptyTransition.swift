//
//  EmptyTransition.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

final class EmptyTransition {
    var isAnimated: Bool = true
}

extension EmptyTransition: Transition {
    // MARK: - Transition
    
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
