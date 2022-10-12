import SwiftUI

struct SongEditorView: View {
    @State private(set) var song: EditableSong

    var body: some View {
        TextEditor(text: $song.lyrics)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    print("Saving song...")
                }
            }
        }
    }
}

struct SongEditorView_Previews: PreviewProvider {
    static var previews: some View {
        SongEditorView(song: EditableSong(lyrics: ""))
    }
}
