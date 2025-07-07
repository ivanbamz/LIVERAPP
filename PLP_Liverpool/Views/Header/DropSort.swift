//
//  Sort.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI


struct DropSort: View {
    @Binding var selectedOption: SortOptions
    @Environment(\.dismiss) var dismiss
    @State var isExpanded = false
    //Este se debe cambiar por un binding e inyectarse en un URL
    
    
    
    var body: some View {
        
        ZStack{
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                
                Image(systemName: "arrow.up.arrow.down.circle")
                    .padding(12)
                    .background(Color(.blue.opacity(0.4)))
                    .cornerRadius(10)
            }
            
            // Opciones desplegables
            if isExpanded {
                ZStack{
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(SortOptions.allCases) { option in
                            Button(action: {
                                selectedOption = option
                                withAnimation {
                                    isExpanded = false
                                    dismiss()
                                }
                            }) {
                                HStack {
                                    Text(option.name)
                                        .foregroundColor(selectedOption == option ? .blue : .primary)
                                    Spacer()
                                    if selectedOption == option {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(.vertical, 6)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .zIndex(3) 
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedOption: SortOptions = .predefined
    DropSort(selectedOption: $selectedOption)
            
    
}
