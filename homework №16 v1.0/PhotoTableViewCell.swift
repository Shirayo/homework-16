//
//  PhotoTableViewCell.swift
//  homework №16
//
//  Created by Shirayo on 06.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func setPhoto (photos: Photos) {
        logoImageView.image = photos.image
        nameLabel.text! = photos.photoName
    }

}
