//
//  YoutubeVideoResponseModel.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 04/05/22.
//

import Foundation

struct YoutubeResponse: Codable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    let items: [Item]
}

struct Item: Codable {
    let kind, etag: String
    let id: ID
}


struct ID: Codable {
    let kind: String
    let videoID, playlistID: String?

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
        case playlistID = "playlistId"
    }
}

struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
