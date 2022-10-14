import Foundation

enum SongEditorViewState {
    case loading
    case editing(EditableSong)
    case saving(Song)
}

struct EditableSong {
    let id: UUID?
    var lyrics: String

    init(id: UUID? = nil, lyrics: String) {
        self.id = id
        self.lyrics = lyrics
    }
}
