//
//  ExpandCell.swift
//  Yelp
//
//  Created by Julia Yu on 2/21/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

// cell prototype

@objc protocol ExpandCellDelegate {
    optional func expandCell(expandCell: ExpandCell, didTap expanded: Bool)
}

class ExpandCell: UITableViewCell {

    @IBOutlet weak var expandLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    
    weak var delegate: ExpandCellDelegate?
    var expanded: Bool = false

    // ------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // ------------------------------------------ expand cell tapped
    
    @IBAction func onExpand(sender: AnyObject) {
        self.expanded = !self.expanded
        self.delegate?.expandCell?(self, didTap: self.expanded)
        print("expand tapped expand is:", self.expanded)
    }
}