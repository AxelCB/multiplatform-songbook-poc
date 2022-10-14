import Foundation

final class SongEditorViewModel: ObservableObject {
    @Published private(set) var state: SongEditorViewState
    private let songRepository: SongRepository

    init(songRepository: SongRepository = SongRepository(localFileManager: LocalFileManager())) {
        self.songRepository = songRepository
        state = .loading
    }

    func onTapSave() async {
        guard case let .editing(editableSong) = state else {
            return
        }
        let song = Song(id: editableSong.id ?? UUID(),
                        author: "",
                        lyrics: editableSong.lyrics,
                        lastUpdated: Date.now)
        state = .saving(song)
        do {
            try await songRepository.save(song: song)
        } catch {
            print(error)
        }
    }
}
