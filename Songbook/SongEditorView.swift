//
//  SongEditorView.swift
//  Songbook
//
//  Created by Axel Collard Bovy on 9/10/22.
//

import SwiftUI

struct SongEditorView: View {
    @State private var lyrics = ""

    var body: some View {
        TextEditor(text: $lyrics)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    print("Saving lyrics")
                }
            }
        }
    }
}

struct SongEditorView_Previews: PreviewProvider {
    static var previews: some View {
        SongEditorView()
    }
}
