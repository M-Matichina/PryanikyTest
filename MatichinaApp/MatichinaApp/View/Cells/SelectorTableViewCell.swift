//
//  SelectorTableViewCell.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/20/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    
    var actionHandler: ((_ index: Int) -> Void)? = nil

    // MARK: Outlets 
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var data: DataModel? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    
    func configure() {
        guard let data = data, let dataContent = data.data else { return }
        
        
        segmentedControl.removeAllSegments()
        
        for variant in dataContent.variants {
            segmentedControl.insertSegment(withTitle: variant.text, at: variant.id ?? 0, animated: false)
        }
        segmentedControl.selectedSegmentIndex = dataContent.selectedId ?? 0
    }


    // MARK: Actions
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        actionHandler?(sender.selectedSegmentIndex)
    }
}
