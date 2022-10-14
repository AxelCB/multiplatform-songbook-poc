import Foundation

struct Song: Codable {
    let id: UUID
    let author: String
    let lyrics: String
    let lastUpdated: Date

    init(id: UUID = UUID(), author: String, lyrics: String, lastUpdated: Date) {
        self.id = id
        self.author = author
        self.lyrics = lyrics
        self.lastUpdated = lastUpdated
    }
}
