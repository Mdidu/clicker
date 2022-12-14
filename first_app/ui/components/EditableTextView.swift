//
//  EditableTextView.swift
//  first_app
//
//  Created by alexandre meddas on 31/10/2022.
//

import SwiftUI

struct EditableTextView: View {
    let title: String
    @State private var isEditing = false
    @Binding var editedText: String
    var body: some View {
        HStack {
            if isEditing == true {
                TextField(title, text: $editedText)
                    .frame(width: 300.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(editedText)
                    .frame(width: 300.0)
            }
            Image(systemName: "pencil.circle")
                .onTapGesture {
                    isEditing.toggle()
                }
        }
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(title: "Pseudo", editedText: .constant("Leonard"))
            .previewLayout(.sizeThatFits)
            
    }
}
