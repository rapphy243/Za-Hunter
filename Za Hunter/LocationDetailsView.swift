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
            Spacer()
        }
    }
    // This was created to fix Xcode type checking in "unreasonable" time.
    func getAddress(mapItem : MKMapItem) -> String {
        let address1 = (mapItem.placemark.subThoroughfare ?? " ") + " " + (mapItem.placemark.thoroughfare ?? " ") + "\n"
        let address2 = (mapItem.placemark.locality ?? " ") + ", " + (mapItem.placemark.administrativeArea ?? " ") + " "
        return address1 + address2 + (mapItem.placemark.postalCode ?? " ")
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
