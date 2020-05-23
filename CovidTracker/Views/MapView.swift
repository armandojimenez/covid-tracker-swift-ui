//
//  MapView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

var wasFetched = false
var allAnnotations: [CoronaCaseAnnotation] = []

struct MapView: UIViewRepresentable {
    
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        if wasFetched {
            uiView.annotations.forEach{uiView.removeAnnotation($0)}
            uiView.addAnnotations(allAnnotations)
            return
        }
        
        var jsonObj = JSON();
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                jsonObj = try JSON(data: data)
                // let countriesList = jsonObj.array;
                print("jsonData:\(jsonObj)")
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        
        let countryDictionary = jsonObj.rawValue as! [Dictionary<String, AnyObject>]
        
        for data in countryData {
            
            
            for countryData in countryDictionary {
                print(countryData["name"]!)
                
                let countryName = countryData["name"] as? String ?? ""
                
                if countryName == data.country {
                    let title = data.country + "\n Confirmed " + data.totalConfirmed.formatNumer() + "\n Deaths " + data.totalDeaths.formatNumer()
                    
                    let latLang = countryData["latlng"] as? Array ?? []
                    let latitude = latLang[0] as! Double
                    let longitude = latLang[1] as! Double
                    
                    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    
                    allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinates));
                }
                
            }
            
            
        }
        
        
        
        uiView.annotations.forEach{uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
        wasFetched = true;
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
    
    func getLocation(from address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks,
                let location = placemarks.first?.location?.coordinate else {
                    completion(nil)
                    return
            }
            completion(location)
        }
    }
}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
