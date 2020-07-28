//
//  ImageTableViewCell.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/20/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
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
        titleLabel.text = data?.data?.text
        if let url = URL(string: data?.data?.url ?? "")  {
            photoView.load(url: url)
        }
        
    }
}
