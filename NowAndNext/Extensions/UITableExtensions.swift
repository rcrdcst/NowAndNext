//
//  UITableExtensions.swift
//  NowAndNext
//
//  Created by ricardo silva on 21/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//


import UIKit

extension UITableViewCell {
    
    static var cellId: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func register(cellType: UITableViewCell.Type) {
        let name = cellType.cellId
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}


extension UIViewController {
    static var storyboardId: String {
        return String(describing: self)
    }
}
