import Foundation

struct MovieData: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let backdropPath: String
    let genreIDS: [Int]
    let originalLanguage: String
    let originalTitle: String?
    let posterPath: String
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let overview: String
    let releaseDate, title: String?
    let id: Int
    let adult: Bool?
    let popularity: Double
    let mediaType: MediaType
    let name, firstAirDate, originalName: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case overview
        case releaseDate = "release_date"
        case title, id, adult, popularity
        case mediaType = "media_type"
        case name
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}
