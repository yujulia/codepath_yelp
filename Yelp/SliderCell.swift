//
//  SliderCell.swift
//  Yelp
//
//  Created by Julia Yu on 2/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SliderCellDelegate {
    optional func sliderCell(sliderCell: SliderCell, didChangeValue value: Float)
}

class SliderCell: UITableViewCell {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var afterLabel: UILabel!
    @IBOutlet weak var beforeLabel: UILabel!
    
    weak var delegate: SliderCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.slider.addTarget(
            self,
            action: "sliderValueChanged",
            forControlEvents: UIControlEvents.ValueChanged
        )
    }
    
    func sliderValueChanged() {

        self.sliderLabel.text = String(Int(self.slider.value))
        delegate?.sliderCell?(self, didChangeValue: self.slider.value)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
