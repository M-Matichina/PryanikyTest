//
//  UIImageView.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/24/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

// MARK: - Load photo

extension UIImageView {
    
    func load(url: URL) {
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
