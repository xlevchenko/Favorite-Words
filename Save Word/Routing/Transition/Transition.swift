//
//  Transition.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol Transition: AnyObject {
    var isAnimated: Bool { get set }

    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?)
    func close(_ viewController: UIViewController, completion: (() -> Void)?)
}
