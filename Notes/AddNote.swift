//
//  AddView.swift
//  Inventory2
//
//  Created by user219288 on 6/30/22.
//

import SwiftUI

struct AddNoteView: View {
    @Binding var isPresented: Bool
    @Binding var title : [String]
    @Binding var descrip : [String]
    @State var addtitle : String
    @State var adddescrip : String
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
//                    TextField("Title", text: $addtitle)
//                    TextField("Description", text: $adddescrip)
                    HStack{
                        Text("Title: ")
                        TextField("", text: $addtitle)
                            .accessibilityValue("addShortDescription")
                            .accessibilityLabel("addShortDescription")
                    }
                    HStack{
                        Text("Details: ")
                        TextField("", text: $adddescrip)
                            .accessibilityValue("addLongDescription")
                            .accessibilityLabel("addLongDescription")
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Add New Note", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
    }
        var saveButton: some View{
            Button(action:{
                if addtitle != "" && adddescrip != ""{
                    SoundManager.instance.playSound()
                    title.append(addtitle)
                    descrip.append(adddescrip)
                    isPresented.toggle()
                }
            }, label:{
                Text("Add")
            })
        }
        
        var cancelButton: some View{
            Button(action:{
                SoundManager.instance.playSound()
                isPresented.toggle()
            }, label:{
                Text("Cancel")
            })
        }

}
