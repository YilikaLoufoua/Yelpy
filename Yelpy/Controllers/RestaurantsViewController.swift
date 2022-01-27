//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    @IBOutlet weak var tableView: UITableView!
    
    // Initialize restaurantsArray
    var restaurantsArray: [[String:Any?]] = []
    
    // Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 180
        getAPIData()
    }
    
    // Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() {(restaurants) in guard let restaurants = restaurants else {
            return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }


    // Create tableView Extension and TableView Functionality
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        // Get the restaurant for the current cell
        let restaurant = restaurantsArray[indexPath.row]
        
        // Set name of restaurant
        cell.restaurantName.text = restaurant["name"] as? String ?? ""
        
        // Set category of restaurant
        let categories = restaurant["categories"] as! [[String:Any]]
        let categoryDict = categories[0]
        let categoryTitle = categoryDict["title"] as! String
        cell.restaurantCategory.text = categoryTitle
        
        // Set rating of restaurant
        let rating = restaurant["rating"] as! Double * 10
        switch rating {
        case 0:
            cell.restaurantRating.image = UIImage(named: "small_0")
        case 10..<15:
            cell.restaurantRating.image = UIImage(named: "small_1")
        case 15..<20:
            cell.restaurantRating.image = UIImage(named: "small_1_half")
        case 20..<25:
            cell.restaurantRating.image = UIImage(named: "small_2")
        case 25..<30:
            cell.restaurantRating.image = UIImage(named: "small_2_half")
        case 30..<35:
            cell.restaurantRating.image = UIImage(named: "small_3")
        case 35..<40:
            cell.restaurantRating.image = UIImage(named: "small_3_half")
        case 40..<45:
            cell.restaurantRating.image = UIImage(named: "small_4")
        case 45..<50:
            cell.restaurantRating.image = UIImage(named: "small_4_half")
        case 50:
            cell.restaurantRating.image = UIImage(named: "small_5")
        default:
            cell.restaurantRating.image = UIImage(named: "small_0")
        }
        
        // Set review count of each restaurant
        let reviewCount = restaurant["review_count"] as? Int ?? 0
        cell.restaurantReviewCount.text = String(reviewCount)

        // Set phone number of each restaurant
        let phone = restaurant["display_phone"] as? String ?? ""
        cell.restaurantPhone.text = phone
        // Set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        return cell
    }
}
