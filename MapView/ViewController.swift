//
//  ViewController.swift
//  MapView
//
//  Created by D7703_22 on 2018. 6. 5..
//  Copyright © 2018년 jun5250. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //번개반점
        //35.167754, 129.070578
        //부산광역시 부산진구 양정동 418-282
        
        //동의과학대학교
        //35.165780, 129.072532
        //부산광역시 부산진구 양정동 429-19
        
        //지도 center, span, region 표시하기
        // 위도, 경도
        
        //동의과학대학교
        let center = CLLocationCoordinate2D(latitude: 35.165780, longitude: 129.072532)
        //번개반점
        let loc01 = CLLocationCoordinate2D(latitude:35.167754 , longitude: 129.070578)
            //반경(room in, out)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        // region 객체(center, span)
        let region = MKCoordinateRegion(center: center, span: span)
        
        //지도에 표시하기
        myMapView.setRegion(region, animated: true)
        
        //// annotation 표시하기
        let pin01 = MKPointAnnotation()
        pin01.coordinate = loc01
        myMapView.addAnnotation(pin01)
        pin01.title = "번개반점"
        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "DIT 동의과학대학교"
        pin02.subtitle = "부산광역시 부산진구 양정동 429-19"
        myMapView.addAnnotation(pin02)
        
        //// grocoding : 주소 -> 위도, 경도
        let addr = "부산광역시 양정동1동 350-1"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }else{
                print("nil 발생")
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
//                print(placemark.location)
//                print(placemark.name)
//                print(placemark.postalCode)
//                print(placemark.country)
                let loc02 = placemark.location?.coordinate
                let pin03 = MKPointAnnotation()
                pin03.coordinate = loc02!
                pin03.title = "토마토 도시락"
                pin03.subtitle = addr
                self.myMapView.addAnnotation(pin03)
                
            }else{
                print("nil 발생")
            }
        }
    }
}

