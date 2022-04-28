import Foundation

struct MovieData: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Result: Codable {
    let voteAverage: Double?
    let overview, releaseDate: String?
    let adult: Bool?
    let backdropPath: String?
    let voteCount: Int?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, posterPath, title: String?
    let video: Bool?
    let popularity: Double?
    let mediaType: MediaType?
    let originalName: String?
    let originCountry: [String]?
    let firstAirDate, name: String?

    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case adult
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case title, video, popularity
        case mediaType = "media_type"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case it = "it"
    case pl = "pl"
}
