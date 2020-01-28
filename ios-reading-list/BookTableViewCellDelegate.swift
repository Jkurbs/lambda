//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: ReadingListCell)
}
