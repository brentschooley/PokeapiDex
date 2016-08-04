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

class PokedexViewController: UITableViewController {

    // MARK: - Resource code
    
    // Replace these with Pokemon!
    var objects = [AnyObject]()


    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We'll replace 'objects' with 'pokemon' in the blog post
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell", forIndexPath: indexPath)

        // Get pokemon out of pokemon resource
        
        // Customize cell here based on pokemon
        
        return cell
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
            }
        }
    }

}

