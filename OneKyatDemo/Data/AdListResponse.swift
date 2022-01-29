//
//  AdResponse.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import Foundation

struct AdListResponse: Codable {
    
    let bannerImages: [String]
    let adList: [Ads]
}

struct Ads: Codable {
    let itemName, itemDetail, itemDescription: String
    let itemCondition, itemImage, price: String
    let sellerName, sellerUserName: String
    let sellerImage: String?
    let sellerLocation, time: String
}
