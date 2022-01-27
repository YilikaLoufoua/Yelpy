//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Yilika Loufoua on 1/24/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantCategory: UILabel!
    @IBOutlet weak var restaurantRating: UIImageView!
    @IBOutlet weak var restaurantReviewCount: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
