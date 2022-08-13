//
//  EditView.swift
//  Inventory2
//
//  Created by user219288 on 6/30/22.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var title : [String]
    @Binding var descrip : [String]
    @State var currtitle : String
    @State var currdescrip : String
    @State var index : Int
    var body: some View {
            ZStack{
                VStack(alignment: .leading){
                    HStack{
                        TextField("", text: $currdescrip)
                            .accessibilityValue("editShortDescription")
                            .accessibilityLabel("editLongDescription")
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Edit Note", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
    }
    
    var saveButton: some View{
        Button(action:{
            SoundManager.instance.playSound()
            if currtitle != "" && currdescrip != ""{
                title[index] = currtitle
                descrip[index] = currdescrip
                presentationMode.wrappedValue.dismiss()
            }
        }, label:{
            Text("Save")
        })
    }
    
    var cancelButton: some View{
        Button(action:{
            SoundManager.instance.playSound()
            presentationMode.wrappedValue.dismiss()
        }, label:{
            Text("Cancel")
        })
    }
}
