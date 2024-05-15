//
//  Extesions.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Override dequeueReusableCell with T type means that could be any type of cell
    /// - Parameters:
    ///   - indexPath: array of the index for each cell
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell")
        }
        return cell
    }

    func dequeueReusableHeader<T: UITableViewHeaderFooterView>() -> T {
        guard let headerView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to dequeue headerView")
        }
        return headerView
    }
    
//    func setupEmptyView(delegate: EmptyViewDelegate?) {
//        let emptyView = EmptyView.setupView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
//        self.backgroundView = emptyView
//        emptyView.delegate = delegate
//        self.backgroundView?.isHidden = true
//    }
//
//    func showEmptyView(viewType: EmptyViewType) {
//        guard let emptyView = backgroundView as? EmptyView else { return }
//        emptyView.viewType  = viewType
//        emptyView.viewSetup()
//        self.bringSubviewToFront(emptyView)
//        emptyView.isHidden  = false
//    }
//
//    func hideEmptyView() {
//        guard let emptyView = backgroundView as? EmptyView else { return }
//        emptyView.hideLoading()
//        backgroundView?.isHidden = true
//    }
//
//    func hideRetryButton() {
//        guard let emptyView = backgroundView as? EmptyView else { return }
//        emptyView.targetButton.isHidden = true
//    }
//
//    func setBackgroundColor() {
//        guard let emptyView = backgroundView as? EmptyView else { return }
//        emptyView.backgroundColor = .clear
//    }
    
    func registerNib(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderNib(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerClass(_ identifier: String) {
        self.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    var lastIndexPath: IndexPath {
        var indexPath = IndexPath(row: 0, section: 0)
        
        guard numberOfSections > 0 else { return indexPath}
        
        indexPath.section = self.numberOfSections - 1
        indexPath.row = self.numberOfRows(inSection: indexPath.section) - 1
        
        return indexPath
    }
    
    func scrollToBottom(animated: Bool) {

        guard numberOfSections > 0 else { return }

        let lastSectionIndex = numberOfSections - 1
        let numberOfRowsInLastSection = numberOfRows(inSection: lastSectionIndex)
        
        guard numberOfRowsInLastSection > 0 else { return }

        let lastRowIndex = numberOfRowsInLastSection - 1
        let indexPath = IndexPath(row: lastRowIndex, section: lastSectionIndex)
        
        scrollToRowAtIndexPathIfValid(indexPath: indexPath, atScrollPosition: .bottom, animated: animated)
    }
    
    func scrollToRowAtIndexPathIfValid(indexPath: IndexPath, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        
        //First check if indexPath is valid for scrollToItemAtIndexPath method calling
        if (indexPath.section >= 0 && indexPath.section < numberOfSections) && (indexPath.row >= 0 && indexPath.row < numberOfRows(inSection: indexPath.section)) {
            scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
        }
    }
}
