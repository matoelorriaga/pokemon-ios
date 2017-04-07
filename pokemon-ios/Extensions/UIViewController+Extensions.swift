//
//  UIViewController+Extensions.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 6/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func smoothlyDeselectRows(tableView: UITableView?) {
        let selectedIndexPaths = tableView?.indexPathsForSelectedRows ?? []
        
        if let coordinator = transitionCoordinator {
            coordinator.animateAlongsideTransition(in: parent?.view, animation: { context in
                selectedIndexPaths.forEach {
                    tableView?.deselectRow(at: $0, animated: context.isAnimated)
                }
            }, completion: { context in
                if context.isCancelled {
                    selectedIndexPaths.forEach {
                        tableView?.selectRow(at: $0, animated: false, scrollPosition: .none)
                    }
                }
            })
        } else {
            selectedIndexPaths.forEach {
                tableView?.deselectRow(at: $0, animated: false)
            }
        }
    }
    
}
