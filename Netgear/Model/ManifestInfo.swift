//
//  ManifestInfo.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import Foundation

struct ManifestInfo {
    var imageInfo: [ManifestImageInfo]?
}

struct ManifestImageInfo: Codable {
    var name: String
    var url: String
}
