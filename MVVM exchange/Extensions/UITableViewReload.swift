//
//  UITableViewReload.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import UIKit

extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
