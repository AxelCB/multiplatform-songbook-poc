import Foundation

enum SongEditorViewState {
    case loading
    case editing(EditableSong)
}

struct EditableSong {
    var lyrics: String
}
