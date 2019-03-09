//
//  MapPreviewViewController.swift
//  GetGoingClass
//
//  Created by Qian Cai on 2019-03-06.
//  Copyright © 2019 SMU. All rights reserved.
//

import UIKit
import MapKit
class MapPreviewViewController: UIViewController {

    var places: [PlaceDetails]!
    @IBOutlet weak var mapView: MKMapView!
    var annotationas = [MKPointAnnotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presentMapView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func exitMapView(_ sender: Any) {
        dismiss(animated: true)
    
    }
    
    
    func presentMapView()
    {
        for place in places{
            guard let coordinates = place.coordinate else { return }
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = coordinates
            
            let coordinateRegion = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: CLLocationDistance(5000), longitudinalMeters: CLLocationDistance(5000))
            
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.showsUserLocation = true
            mapView.addAnnotation(annotation)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }
    
    
    

}
