//
//  UIWindowExt.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 18.11.2021.
//

import UIKit

extension UIWindow {
    @discardableResult
    static func showAlert(
        title: String?,
        message: String?,
        level: UIWindow.Level = .alert,
        actions: [AlertAction]
    ) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            let uiAction = UIAlertAction(title: action.title, style: action.style) { _ in
                action.handler?()
                window.rootViewController = nil
                window.isHidden = true
            }
            alert.addAction(uiAction)
        }
        
        window.presentViewController(alert, level: level)
        
        return window
    }
    
    func presentViewController(_ vc: UIViewController, level: UIWindow.Level) {
        windowLevel = level
        rootViewController = UIViewController()
        makeKeyAndVisible()
        DispatchQueue.main.async { [weak self] in
            // Prevent 'Unbalanced calls to begin/end appearance transitions'
            self?.rootViewController?.present(vc, animated: true)
        }
    }
}
