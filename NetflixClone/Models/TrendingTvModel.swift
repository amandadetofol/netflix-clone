
import Foundation

struct TrendinggTv: Codable {
    let page: Int?
    let results: [TrengingTvResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct TrengingTvResult: Codable {
    let voteAverage: Double?
    let overview, originalName: String?
    let originCountry: [String]?
    let backdropPath: String?
    let voteCount: Int?
    let genreIDS: [Int]?
    let firstAirDate: String?
    let originalLanguage: TrengingTvOriginalLanguage?
    let name, posterPath: String?
    let id: Int?
    let popularity: Double?
    let mediaType: TrengingTvMediaType?

    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case overview
        case originalName = "original_name"
        case originCountry = "origin_country"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case genreIDS = "genre_ids"
        case firstAirDate = "first_air_date"
        case originalLanguage = "original_language"
        case name
        case posterPath = "poster_path"
        case id, popularity
        case mediaType = "media_type"
    }
}

enum TrengingTvMediaType: String, Codable {
    case tv = "tv"
}

enum TrengingTvOriginalLanguage: String, Codable {
    case en = "en"
    case fr = "fr"
    case it = "it"
    case ja = "ja"
}
