//
//  ReusableIdentifier.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation
import UIKit

protocol ReusableIdentifier {
    static var reuseIdentifier: String { get }
}

extension ReusableIdentifier {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


extension UICollectionViewCell {}
extension UIViewController: ReusableIdentifier {}
extension UIView: ReusableIdentifier {}
