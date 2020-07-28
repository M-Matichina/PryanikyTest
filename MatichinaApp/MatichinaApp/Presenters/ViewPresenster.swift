//
//  ViewPresenster.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/28/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit


protocol ViewPresensterProtocol {
    
    func showInfo(_ message: String)
    func showResponse(resp: Response?)
}


class ViewPresenster: NSObject {
    
    var presenter: ViewPresensterProtocol!
    
    init(presenter:ViewPresensterProtocol) {
        self.presenter = presenter
    }
    
    func getData(){
        DataManager.getContent { (resp) in
            self.presenter.showResponse(resp: resp)
        }
    }
    
    func showInfo(_ message: String) {
        self.presenter.showInfo(message)
    }
}
