//
//  LocationDetailsView.swift
//  Za Hunter
//
//  Created by Raphael Abano on 2/18/25.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    let mapItem : MKMapItem
    var body: some View {
        VStack {
            Text(mapItem.placemark.name!)
                .font(.title)
                .bold()
            Text(getAddress(mapItem: mapItem))
                .padding()
            Text(mapItem.phoneNumber!)
                .padding()
            if let url = mapItem.url {
                Link(destination: url, label: {
                    Text("Website")
                    .padding()
                })
            }
            Button(action: {
                let latitude = mapItem.placemark.coordinate.latitude
                let longitude = mapItem.placemark.coordinate.longitude
                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }, label: {
                Text("Get Directions")
            })
            Spacer()
        }
    }
    // This was created to fix Xcode type checking in "unreasonable" time.
    func getAddress(mapItem : MKMapItem) -> String {
        let address1 = (mapItem.placemark.subThoroughfare ?? " ") + " " + (
            mapItem.placemark.thoroughfare ?? " "
        ) + "\n"
        let address2 = (mapItem.placemark.locality ?? " ") + ", " + (
            mapItem.placemark.administrativeArea ?? " "
        ) + " "
        return address1 + address2 + (mapItem.placemark.postalCode ?? " ")
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
