//
//  PokeCell.swift
//  Pokedex3
//
//  Created by Ken Krippeler on 12.07.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell
{
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon)
    {
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
}
