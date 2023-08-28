//
//  Router.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol Closable: AnyObject {
    /// Closes the Router's root view controller using the transition used to show it.
    func close()
    
    /// Closes the Router's root view controller using the transition used to show it.
    func close(completion: (() -> Void)?)
}

protocol Dismissable: AnyObject {
    /// Dismisses the Router's root view controller ignoring the transition used to show it.
    func dismiss()
    
    /// Dismisses the Router's root view controller ignoring the transition used to show it.
    func dismiss(completion: (() -> Void)?)
}

protocol Routable: AnyObject {
    /// Route to a view controller using the transition provided.
    func route(to viewController: UIViewController, as transition: Transition)
    
    /// Route to  a view controller using the transition provided.
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?)
}

protocol Router: Routable {
    /// The root view controller of this router.
    var root: UIViewController? { get set }
}
