//
//  PokedexViewController
//  PokeapiDex
//
//  Created by Brent Schooley on 8/3/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Siesta

class PokedexViewController: UITableViewController, ResourceObserver {

    // MARK: - Resource code
    var pokedexResource: Resource? {
        didSet {
            oldValue?.removeObservers(ownedBy: self)
            
            pokedexResource?
                .addObserver(self)
                .addObserver(statusOverlay, owner: self)
                .loadIfNeeded()
        }
    }
    
    func resourceChanged(resource: Resource, event: ResourceEvent) {
        pokemonList = pokedexResource?.typedContent() ?? []
    }

    
    // Replace these with Pokemon!
    var pokemonList: [JSON] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var statusOverlay = ResourceStatusOverlay()
    
   	override func viewDidLayoutSubviews() {
        statusOverlay.positionToCoverParent()
    }


    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusOverlay.embedIn(self)
        pokedexResource = Pokeapi.pokedex
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We'll replace 'objects' with 'pokemon' in the blog post
        return pokemonList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell", forIndexPath: indexPath)

        // Get pokemon out of pokemon resource
        let pokemonSummary = pokemonList[indexPath.row]
        
        // Customize cell here based on pokemon
        cell.textLabel?.text = pokemonSummary["name"].stringValue.capitalizedString
        cell.detailTextLabel?.text = "id: \(indexPath.row + 1)"
        
        return cell
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let pokemonVC = segue.destinationViewController as? PokemonViewController,
                let indexPath = self.tableView.indexPathForSelectedRow {
                pokemonVC.pokemonResource = Pokeapi.pokemon("\(indexPath.row + 1)")
            }
        }
    }

}

