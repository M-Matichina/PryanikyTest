//
//  TextTableViewCell.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/20/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tekstLabel: UILabel!
    
    
    // MARK: Properties
    
    var data: DataModel? {
        didSet {
            configure()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    fileprivate func configure() {
        tekstLabel.text = data?.data?.text
    }
}
