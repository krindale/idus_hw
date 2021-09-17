//
//  IDUSModel.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation

// MARK: - Welcome
struct IDUSModel: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let screenshotUrls: [String]
    let artistViewURL: String
    let supportedDevices: [String]
    let kind, minimumOSVersion, trackCensoredName: String
    let fileSizeBytes, formattedPrice, contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewURL: String
    let trackContentRating: String
    let trackID: Int
    let trackName, primaryGenreName: String
    let sellerName: String
    let releaseNotes: String
    let primaryGenreID: Int
    let currency, resultDescription: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let bundleID, version, wrapperType: String
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case artistViewURL = "artistViewUrl"
        case supportedDevices, kind
        case minimumOSVersion = "minimumOsVersion"
        case trackCensoredName, fileSizeBytes, formattedPrice, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating
        case trackViewURL = "trackViewUrl"
        case trackContentRating
        case trackID = "trackId"
        case trackName, primaryGenreName, sellerName, releaseNotes
        case primaryGenreID = "primaryGenreId"
        case currency
        case resultDescription = "description"
        case artistID = "artistId"
        case artistName, genres, price
        case bundleID = "bundleId"
        case version, wrapperType, userRatingCount
    }
}
