import Foundation

struct SongRepository {
    private static let songFileName = "songs.json"
    private let localFileManager: LocalFileManager

    init(localFileManager: LocalFileManager) {
        self.localFileManager = localFileManager
    }

    func save(song: Song) async throws {
        let result = localFileManager.write(song, toFileNamed: SongRepository.songFileName)
        if case let .failure(error) = result {
            throw error
        }
    }
}
