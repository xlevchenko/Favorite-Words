//
//  DefaultRouter.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

class DefaultRouter: NSObject, Router, Closable, Dismissable {
    
    private let rootTransition: Transition
    
    var root: UIViewController?
    
    init(rootTransition: Transition) {
        self.rootTransition = rootTransition
    }
    
    
    // MARK: - Routable
    
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?) {
        guard let root = root else { return }
        
        transition.open(viewController, from: root, completion: completion)
    }
    
    func route(to viewController: UIViewController, as transition: Transition) {
        route(to: viewController, as: transition, completion: nil)
    }
    
    
    // MARK: - Closable
    
    func close(completion: (() -> Void)?) {
        guard let root = root else { return }
        ///Removes the `root` with the same transition that it was opened.
        rootTransition.close(root, completion: completion)
    }
    
    func close() {
        close(completion: nil)
    }
    
    // MARK: - Dismissable
    
    func dismiss(completion: (() -> Void)?) {
        /// Dismiss the root with iOS' default dismiss animation.
        /// It will only work if the root or its ancestor were presented
        /// using iOS' native present view controller method.
        root?.dismiss(animated: rootTransition.isAnimated, completion: completion)
    }
    
    func dismiss() {
        dismiss(completion: nil)
    }
}
