//
//  PokemonViewController.swift
//  PokeapiDex
//
//  Created by Brent Schooley on 8/3/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var imageView: RemoteImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstTypeLabel: UILabel!
    @IBOutlet weak var secondTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

