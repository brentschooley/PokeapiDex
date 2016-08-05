//
//  PokemonViewController.swift
//  PokeapiDex
//
//  Created by Brent Schooley on 8/3/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Siesta

class PokemonViewController: UIViewController, ResourceObserver {
    @IBOutlet weak var imageView: RemoteImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstTypeLabel: UILabel!
    @IBOutlet weak var secondTypeLabel: UILabel!
    
    var pokemonResource: Resource? {
        didSet {
            oldValue?.removeObservers(ownedBy: self)
            
            pokemonResource?.addObserver(self)
                .addObserver(statusOverlay, owner: self)
                .loadIfNeeded()
        }
    }
    
    func resourceChanged(resource: Resource, event: ResourceEvent) {
        showPokemon()
    }
    
    var pokemon: Pokemon? {
        return pokemonResource?.typedContent()
    }
    
    func showPokemon() {
        if let _pokemon = pokemon {
            nameLabel?.text = _pokemon.name.capitalizedString
            imageView?.imageURL = _pokemon.spriteUrl
            firstTypeLabel?.text = _pokemon.types?[1]
            secondTypeLabel?.text = _pokemon.types?[0]
        }
    }
    
    var statusOverlay = ResourceStatusOverlay()
    
   	override func viewDidLayoutSubviews() {
        statusOverlay.positionToCoverParent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusOverlay.embedIn(self)
        
        showPokemon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

