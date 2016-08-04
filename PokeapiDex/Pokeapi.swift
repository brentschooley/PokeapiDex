import Foundation
import Siesta
import SwiftyJSON

let Pokeapi = _Pokeapi()

class _Pokeapi: Service {
    private init() {
        super.init(baseURL: "https://pokeapi.co/api/v2")
        
        // Configuration
        self.configure {
            $0.config.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
            $0.config.expirationTime = 3600
        }
        
        self.configureTransformer("/pokemon") {
            ($0.content as JSON)["results"].arrayValue
        }
        
        self.configureTransformer("/pokemon/*") {
            try Pokemon(json: $0.content)
        }
    }
    
    var pokedex: Resource { return resource("/pokemon").withParam("limit", "151") }
    
    func pokemon(id: String) -> Resource {
        return pokedex.child(id)
    }
}

private let SwiftyJSONTransformer =
    ResponseContentTransformer
        { JSON($0.content as AnyObject) }