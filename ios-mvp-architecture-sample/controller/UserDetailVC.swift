//
//  UserDetail.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import UIKit
import MapKit

class UserDetailVC: UIViewController {
    
    public static var storyboardName:String = "Main"
    public static var identifier:String = "UserDetailVC"
    
    public var mUser:User!

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblSuite: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        if mUser != nil {
            lblName.text = mUser.name ?? ""
            let adress = mUser.address ?? nil
            if adress != nil {
                lblStreet.text = adress?.street ?? ""
                lblSuite.text = adress?.suite ?? ""
                lblCity.text = adress?.city ?? ""
                
                
                ///Set MapKit
                let geo = adress?.geo ?? nil
                if geo != nil {
                    let mLatitude:Double = Double(geo?.lat ?? "0") ?? 0
                    let mLongitude:Double = Double(geo?.lng ?? "0") ?? 0
                    let center = CLLocationCoordinate2D(latitude: mLatitude, longitude: mLongitude)
                    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    mapView.setRegion(region, animated: true)
                    
                    // Drop a pin at user's Current Location
                    let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                    myAnnotation.coordinate = CLLocationCoordinate2DMake(mLatitude, mLongitude)
                    myAnnotation.title = "Current location"
                    mapView.addAnnotation(myAnnotation)
                }

            }
        }
    }
    

    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
