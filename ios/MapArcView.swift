//
//  MapArcView.swift
//  nativeIOS
//
//  Created by dinh tho on 9/30/20.
//

import UIKit
import ArcGIS


class MapArcView: UIView ,AGSGeoViewTouchDelegate,AGSCalloutDelegate{
  let credential=AGSCredential(user: "dothibienhoa", password: "dothibienhoa2020")

  
   let label :UILabel={
    let  b:UILabel = UILabel();
    b.text = "Swift Counter"
    b.textAlignment = .center
    b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return b
    }();
  var map :AGSMapView={
    let  mapSetting:AGSMapView = AGSMapView();
  
    mapSetting.map = AGSMap(
                basemapType: .navigationVector,
                latitude: 34.09042,
                longitude: -118.71511,
                levelOfDetail: 10
            )
    let trailheads1 = URL(string: "https://services3.arcgis.com/GVgbJbqm8hXASVYi/arcgis/rest/services/Trails/FeatureServer/0")!

    let trailheads: AGSFeatureLayer = {
                let trailheadsTable = AGSServiceFeatureTable(url: trailheads1)
                let trailheadsFeatureLayer = AGSFeatureLayer(featureTable: trailheadsTable)
                return trailheadsFeatureLayer
            }()
    let lowElevationGainTrails: AGSFeatureLayer = {
        let trailsURL = URL(string: "https://services3.arcgis.com/GVgbJbqm8hXASVYi/arcgis/rest/services/Trails/FeatureServer/0")!
        let trailsTable = AGSServiceFeatureTable(url: trailsURL)
        let trailsLayer = AGSFeatureLayer(featureTable: trailsTable)
        trailsLayer.definitionExpression = "ELEV_GAIN < 250"
        return trailsLayer
    }()
    mapSetting.map?.operationalLayers.add(lowElevationGainTrails)
    mapSetting.map?.operationalLayers.add(trailheads)
    mapSetting.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return mapSetting
  }();
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView();

      }
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView();

     
    }

  private func setupView() {
    map.touchDelegate=self
    self.addSubview(map);
    self.backgroundColor = .red
    }
  func geoView(_ geoView: AGSGeoView, didTapAtScreenPoint screenPoint: CGPoint, mapPoint: AGSPoint) {
    if(map.callout.isHidden){
      map.callout.title="Location"
      map.callout.detail=String(format: "x: %.2f, y: %.2f",mapPoint.x,mapPoint.y );
      map.callout.isAccessoryButtonHidden=true;
      map.callout.show(at: mapPoint, screenOffset: CGPoint.zero, rotateOffsetWithMap: false, animated: true);
      
    }
    else{
      map.callout.dismiss();
    }
  }

}
