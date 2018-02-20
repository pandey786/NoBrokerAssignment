//
//  PropertySearchViewController.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit
import Nuke

class PropertySearchViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var collectionViewPropertySearch: UICollectionView!
    @IBOutlet weak var viewNoContent: UIView!
    
    //Varibales
    var currentPageCount = 1
    var textSearched = ""
    var presenter: PropertySearchPresentation!
    var propertySearchResults = [PropertySearchModel]()
    var filteredPropertySearchResults = [PropertySearchModel]()
    var selectedSortOrder = ""
    var selectedProperty: PropertySearchModel?
    var apartmentTypeList = [String]()
    var propertyTypeList = [String]()
    var furnishingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up View
        setUpView()
        
        //Set Up Bottom Refresh
        addBottomRefresh()
        
        //Fetch Property List
        self.fetchPropertyList(for: currentPageCount)
        
    }
    
    func addBottomRefresh() {
        
        //Bind Kafka Refresh
        self.collectionViewPropertySearch.bindRefreshStyle(.replicatorTriangle, fill: UIColor.red, at: .footer) {
            
            //Fetch Propertys
            self.currentPageCount += 1
            self.fetchPropertyList(for: self.currentPageCount)
            
        }
    }
    
    func setUpView() {
        
        //set Navigation Bar
        setupNavigationBar()
        
        //Register Nibs
        self.collectionViewPropertySearch.register(UINib.init(nibName: "PropertySearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PropertySearchCollectionViewCell")
        
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "Properties Near Me"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        
        //Change Fontcolor for Large navigation Title
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        
    }
    
    func fetchPropertyList(for pageCount: Int) {
        
        //Clear Search Data for First Page
        if pageCount == 1 {
            clearLastSearchedData()
        }
        
        //fetch Propertys
        presenter.fetchPropertyList(for: pageCount)
    }
    
    // MARK: - Actions
    // MARK: -
    
    @IBAction func buttonFilterTapped(_ sender: Any) {
        
        //Navigate To Property Filter page
        let propertyFilterNavCtrl: UINavigationController = PropertyFilterRouter.assembleModule() as! UINavigationController
        
        //Set Handler
        if let propertyFilterCtrl: PropertyFilterViewController = propertyFilterNavCtrl.topViewController as? PropertyFilterViewController {
            
            //Set Array
            propertyFilterCtrl.apartmentTypeList = self.apartmentTypeList
            propertyFilterCtrl.propertyTypeList = self.propertyTypeList
            propertyFilterCtrl.furnishingList = self.furnishingList
            
            propertyFilterCtrl.propertyFilterHandler = { (apartmentTypeList, propertyTypeList, furnishingList) in
                
                //Set New Array
                self.filteredPropertySearchResults = self.propertySearchResults
                
                //Set Filter Arrays
                self.apartmentTypeList = apartmentTypeList
                self.propertyTypeList = propertyTypeList
                self.furnishingList = furnishingList
                
                //Filter Results
                self.filterPropertyBasedOnApartmentType(apartmentTypeList: apartmentTypeList)
                self.filterPropertyBasedOnPropertyType(propertyTypeList: propertyTypeList)
                self.filterPropertyBasedOnFurnishingType(furnishingTypeList: furnishingList)
                
                //Reload Collection
                self.collectionViewPropertySearch.reloadData()
            }
        }
        
        self.present(propertyFilterNavCtrl, animated: true, completion: nil)
    }
}

// MARK: - Filter Property List
extension PropertySearchViewController {
    
    func filterPropertyBasedOnApartmentType(apartmentTypeList: [String]) {
        
        var apartmentTypeFilterArr = [String]()
        for aptType in apartmentTypeList {
            switch aptType {
            case "1 BHK":
                apartmentTypeFilterArr.append("BHK1")
            case "2 BHK":
                apartmentTypeFilterArr.append("BHK2")
            case "3 BHK":
                apartmentTypeFilterArr.append("BHK3")
            case "4 BHK":
                apartmentTypeFilterArr.append("BHK4")
            default:
                break
            }
        }
        
        for aptTypeFiltered in apartmentTypeFilterArr {
            self.filteredPropertySearchResults =  self.filteredPropertySearchResults.filter({ (propertySearchModel) -> Bool in
                return propertySearchModel.type! == aptTypeFiltered
            })
        }
    }
    
    func filterPropertyBasedOnPropertyType(propertyTypeList: [String]) {
        
        var propertyTypeFilterArr = [String]()
        for prprtyType in propertyTypeList {
            switch prprtyType {
            case "Apartment":
                propertyTypeFilterArr.append("AP")
            case "Independent House/Villa":
                propertyTypeFilterArr.append("IH")
            case "Independent Floor/Builder Floor":
                propertyTypeFilterArr.append("IF")
            default:
                break
            }
        }
        
        for prprtyTypeFiltered in propertyTypeFilterArr {
            self.filteredPropertySearchResults =  self.filteredPropertySearchResults.filter({ (propertySearchModel) -> Bool in
                return propertySearchModel.buildingType! == prprtyTypeFiltered
            })
        }
    }
    
    func filterPropertyBasedOnFurnishingType(furnishingTypeList: [String]) {
        
        var furnishingTypeFilterArr = [String]()
        for furnishingType in furnishingTypeList {
            switch furnishingType {
            case "Fully Furnished":
                furnishingTypeFilterArr.append("FULLY_FURNISHED")
            case "Semi Furnished":
                furnishingTypeFilterArr.append("SEMI_FURNISHED")
            default:
                break
            }
        }
        
        for furnishingTypeFiltered in furnishingTypeFilterArr {
            self.filteredPropertySearchResults =  self.filteredPropertySearchResults.filter({ (propertySearchModel) -> Bool in
                return propertySearchModel.furnishing! == furnishingTypeFiltered
            })
        }
    }
    
}

// MARK: - View Protocol
// MARK: -
extension PropertySearchViewController: PropertySearchView {
    
    func showPropertyList(_ propertySearchModel: [PropertySearchModel]) {
        self.viewNoContent.isHidden = true
        self.collectionViewPropertySearch.isHidden = false
        
        //Append Contents
        self.propertySearchResults.append(contentsOf: propertySearchModel)
        self.filteredPropertySearchResults.append(contentsOf: propertySearchModel)
        
        //Filter Array Based on CUrrent Filters
        self.filterPropertyBasedOnApartmentType(apartmentTypeList: apartmentTypeList)
        self.filterPropertyBasedOnPropertyType(propertyTypeList: propertyTypeList)
        self.filterPropertyBasedOnFurnishingType(furnishingTypeList: furnishingList)
        
        //Reload Data
        self.collectionViewPropertySearch.reloadData()
        
        //End Refresh
        self.collectionViewPropertySearch.footRefreshControl.endRefreshing()
        
        //Check If there are no Objects Fetched show no content screen
        if self.propertySearchResults.count == 0 || self.filteredPropertySearchResults.count == 0 {
            self.showNoContentScreen()
        }
    }
    
    func showNoContentScreen() {
        
        //Check If there are no Objects Fetched show no content screen
        if self.propertySearchResults.count == 0 || self.filteredPropertySearchResults.count == 0 {
            self.viewNoContent.isHidden = false
            self.collectionViewPropertySearch.isHidden = true
        }
        
        //End Refresh
        self.collectionViewPropertySearch.footRefreshControl.endRefreshing()
    }
    
    func clearLastSearchedData() {
        
        self.viewNoContent.isHidden = true
        self.collectionViewPropertySearch.isHidden = false
        
        //Remove current records and remove from UI as well
        self.propertySearchResults.removeAll()
        self.filteredPropertySearchResults.removeAll()
        self.collectionViewPropertySearch.reloadData()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
// MARK: -
extension PropertySearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filteredPropertySearchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let propertyCell: PropertySearchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertySearchCollectionViewCell", for: indexPath) as! PropertySearchCollectionViewCell
        
        //Configure Cell
        let propertyModel = self.filteredPropertySearchResults[indexPath.row]
        
        //Set Image
        if let displayPicPath = propertyModel.photos?.filter({ (propertyImageModel) -> Bool in
            return propertyImageModel.displayPic == true
        }).first?.image_original {
            
            let imageUrlStr = API.propertyImageUrl + propertyModel.id! + "/" + displayPicPath
            if let imageUrl = URL.init(string: imageUrlStr) {
                Manager.shared.loadImage(with: imageUrl, into: propertyCell.imageViewPropertyThumbnail)
            }
        }
        
        //Set title
        propertyCell.labelPropertyTitle.text = propertyModel.propertyTitle
        
        //Set Subtitle
        propertyCell.labelPropertySubTitle.text = propertyModel.secondaryTitle
        
        //Set Rent
        let propertyRent = Int(propertyModel.rent!).formattedWithSeparator
        propertyCell.labelPropertyPrice.text = "₹ \(propertyRent)"
        
        //Set Furnishing
        propertyCell.labelPropertyFurnishing.text = "\(propertyModel.furnishingDesc!) Furnished"
        
        //Set Bathrooms
        propertyCell.labelPropertyBathrooms.text = "\(propertyModel.bathroom!) Bathrooms"
        
        //Set Built Up Area
        propertyCell.labelPropertyBuiltUpArea.text = "\(propertyModel.propertySize!) Sq.ft"
        
        return propertyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: collectionView.frame.size.width - 10, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Set Selected Property
        let selectedProperty = self.filteredPropertySearchResults[indexPath.row]
        self.selectedProperty = selectedProperty
        
    }
}
