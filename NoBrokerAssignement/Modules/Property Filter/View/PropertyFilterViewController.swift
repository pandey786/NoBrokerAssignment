//
//  PropertyFilterViewController.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit
import TagListView

class PropertyFilterViewController: UIViewController {
    
    @IBOutlet weak var tagListViewApartmentType: TagListView!
    @IBOutlet weak var tagListVIewPropertyType: TagListView!
    @IBOutlet weak var tagListViewFurnishing: TagListView!
    
    var apartmentTypeList = [String]()
    var propertyTypeList = [String]()
    var furnishingList = [String]()
    var propertyFilterHandler: (([String], [String], [String]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Large Title for Navigation Bar
        self.title = "FILTER BY"
        
        //Set up Tags
        tagListViewApartmentType.addTags(["1 BHK", "2 BHK", "3 BHK", "4 BHK"])
        tagListViewApartmentType.textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        tagListViewApartmentType.delegate = self
        
        tagListVIewPropertyType.addTags(["Apartment", "Independent House/Villa", "Independent Floor/Builder Floor"])
        tagListVIewPropertyType.textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        tagListVIewPropertyType.delegate = self
        
        tagListViewFurnishing.addTags(["Fully Furnished", "Semi Furnished"])
        tagListViewFurnishing.textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        tagListViewFurnishing.delegate = self
        
        //Set Apartment type selected
        for tagView in tagListViewApartmentType.tagViews {
            if apartmentTypeList.contains(tagView.currentTitle!) {
                tagView.isSelected = true
            } else {
                tagView.isSelected = false
            }
        }
        
        //Set Property type selected
        for tagView in tagListVIewPropertyType.tagViews {
            if propertyTypeList.contains(tagView.currentTitle!) {
                tagView.isSelected = true
            } else {
                tagView.isSelected = false
            }
        }
        
        //Set Furnishing type selected
        for tagView in tagListViewFurnishing.tagViews {
            if furnishingList.contains(tagView.currentTitle!) {
                tagView.isSelected = true
            } else {
                tagView.isSelected = false
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Actions
    // MARK: -
    @IBAction func buttonCloseTapped(_ sender: Any) {
        
        //Dismiss
        self.dismiss(animated: true) {
        }
    }
    
    @IBAction func buttonApplyFiltersTapped(_ sender: Any) {
        
        //Pass Data to Completion handler
        propertyFilterHandler!(apartmentTypeList, propertyTypeList, furnishingList)
        
        //Dismiss
        self.dismiss(animated: true) {
        }
    }
}

extension PropertyFilterViewController: TagListViewDelegate {
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        
        switch sender.tag {
        case TagViewType.ApartmentType.rawValue:
            
            if tagView.isSelected {
                
                 //Set Apartment Type
                apartmentTypeList.append(title)
            } else {
              
                //Remove Apartment Type
                apartmentTypeList.remove(object: title)
            }
            
        case TagViewType.PropertyType.rawValue:
            
            if tagView.isSelected {
                
                //Set Property Type
                propertyTypeList.append(title)
            } else {
                
                //Remove Property Type
                propertyTypeList.remove(object: title)
            }
        case TagViewType.Furnishing.rawValue :
            
            if tagView.isSelected {
                
                //Set Apartment Type
                furnishingList.append(title)
            } else {
                
                //Remove Apartment Type
                furnishingList.remove(object: title)
            }
            
        default:
            break
        }
    }
    
}
