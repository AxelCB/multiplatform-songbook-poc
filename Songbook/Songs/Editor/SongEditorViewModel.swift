import Foundation

final class SongEditorViewModel: ObservableObject {
    @Published private(set) var state: SongEditorViewState

    init() {
        state = .loading
    }
}
