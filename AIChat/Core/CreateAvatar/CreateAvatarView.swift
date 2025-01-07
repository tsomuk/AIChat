//
//  CreateAvatarView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 07.01.2025.
//

import SwiftUI

struct CreateAvatarView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    @State private var isSaving: Bool = false
    @State private var isGenerating: Bool = false
    @State private var generatedImage: UIImage?
    
    var body: some View {
        NavigationStack {
        List {
            nameSection
            attributesSection
            imageSection
            saveSection
                .padding(.top, 24)
        }
                .navigationTitle("Create Avatar")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        backButton
                    }
                }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.accent)
            .anyButton {
                onBackButtonPressed()
            }
    }
    
    private var nameSection: some View {
        Section {
            TextField("Enter name", text: $name)
        } header: {
            Text("Name your avatar*")
        }
    }
    
    private var attributesSection: some View {
        Section {
            Picker(selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized).tag(option)
                }
            } label: {
                Text("is a...")
            }
            
            Picker(selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized).tag(option)
                }
            } label: {
                Text("that is...")
            }
            
            Picker(selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized).tag(option)
                }
            } label: {
                Text("in the...")
            }
        } header: {
            Text("Attribute")
        }
    }
      
    private var imageSection: some View {
        Section {
            HStack(alignment: .top) {
                ZStack {
                    Text("Generate image")
                        .underline()
                        .foregroundStyle(.accent)
                        .opacity(isGenerating ? 0 : 1)
                        .anyButton(.plain) {
                            onGenerateImageButtonPressed()
                        }
                        .disabled(isGenerating || name.isEmpty)
                    
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                
                Circle()
                    .fill(.secondary.opacity(0.3))
                    .overlay {
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    .clipShape(.circle)
            }
            .removeListRowFormatting()
        }
    }
    
    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                title: "Save",
                action: onSaveButtonPressed
            )
            .removeListRowFormatting()
            .disabled(generatedImage == nil)
            .opacity(generatedImage == nil ? 0.5 : 1)
        }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private func onGenerateImageButtonPressed() {
        isGenerating = true
        Task {
            try? await Task.sleep(for: .seconds(3))
            generatedImage = UIImage(systemName: "dog.circle.fill")
            isGenerating = false
        }
    }
    
    private func onSaveButtonPressed() {
        isSaving = true
        Task {
            try? await Task.sleep(for: .seconds(3))
            isSaving = false
            dismiss()
        }
    }
}

#Preview {
    CreateAvatarView()
}
