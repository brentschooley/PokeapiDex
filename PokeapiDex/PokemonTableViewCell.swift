//
//  PokemonTableViewCell.swift
//  PokeapiDex
//
//  Created by Brent Schooley on 8/3/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView: RemoteImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
