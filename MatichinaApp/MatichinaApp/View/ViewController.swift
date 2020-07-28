//
//  ViewController.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/20/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    
    var resp: Response?
    var presenter: ViewPresenster!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ViewPresenster(presenter: self)
        
        
        /// MARK:  Register cells
        
        tableView.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(UINib(nibName: "SelectorTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectorTableViewCell")
        
        
        /// MARK:  Call the func (JSON)
        presenter.getData()
        
        
    }
    
    
    // MARK: - UIAlertController
    
    func alertController(_ message: String) {
        
        let alert = UIAlertController(title: "Информация", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableView.cellForRow(at: indexPath) {
            
        case let hzCell as TextTableViewCell:
            let objectType = hzCell.data?.name ?? ""
            let objectData = hzCell.data?.data?.text ?? ""
            presenter.showInfo("Тип: \(objectType)\nТекст: \(objectData)")
            
        case let pictureCell as ImageTableViewCell:
            let objectType = pictureCell.data?.name ?? ""
            let objectPhoto = pictureCell.data?.data?.url ?? ""
            let objectData = pictureCell.data?.data?.text ?? ""
            presenter.showInfo("Тип: \(objectType)\nФото: \(objectPhoto)\nТекст: \(objectData)")
        default:
            break
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resp?.view.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let resp = resp else {
            return UITableViewCell()
        }
        
        switch resp.view[indexPath.row] {
            
        case .hz:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            if let hz = resp.data.first(where: { $0.name == Type.hz.rawValue }) {
                cell.data = hz
            }
            return cell
            
            
        case .picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            if let picture = resp.data.first(where: { $0.name == Type.picture.rawValue }) {
                cell.data = picture
            }
            return cell
            
            
        case .selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorTableViewCell", for: indexPath) as! SelectorTableViewCell
            if let selector = resp.data.first(where: { $0.name == Type.selector.rawValue }) {
                cell.data = selector
                
                cell.actionHandler = { index in
                    
                    var message = ""
                    
                    if let type = selector.name {
                        message += "Тип: \(type)"
                    }
                    
                    if let startSelectedId = selector.data?.selectedId {
                       message += "\nНачальный id: \(startSelectedId)"
                    }
                    
                    if let selectedVariant = selector.data?.variants.first(where: { $0.id == index }), let id = selectedVariant.id {
                        message += "\nТекущий id: \(id)"
                    }
                    
                    
                    self.showInfo(message)
                    
                }
            }
            return cell
        }
    }
}


extension ViewController: ViewPresensterProtocol {
    
    func showInfo(_ message: String) {
        self.alertController(message)
    }
    
    func showResponse(resp: Response?) {
        self.resp = resp
        self.tableView.reloadData()
    }
}


