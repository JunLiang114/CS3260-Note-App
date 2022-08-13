//
//  ContentView.swift
//  Shared
//
//  Created by user219288 on 6/30/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    @State var isPresentedAdd = false
    @State var isPresentedEdit = false
    @State var shortdescrip: [String] = ["Note Title1", "Note Title 2"]
    @State var longdescrip: [String] = ["Textfield 1", "Textfield 2"]
    @StateObject var soundManager = SoundManager()
    var body: some View {
        NavigationView{
            List{
                ForEach(shortdescrip.indices, id: \.self){ index in
                    NavigationLink(
                        destination: EditNoteView(title: $shortdescrip, descrip: $longdescrip
                                              , currtitle: shortdescrip[index], currdescrip: longdescrip[index], index: index),
                            label: {
                                VStack(alignment: .leading){
                                    Text(shortdescrip[index])
                                }
                            })
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Notes", displayMode: .inline)
            .navigationBarItems(trailing: addButton)
        }.sheet(isPresented: $isPresentedAdd, content: {
            AddNoteView(isPresented: $isPresentedAdd, title: $shortdescrip, descrip: $longdescrip
            , addtitle: "", adddescrip: "")
        })
    }
    
    var addButton: some View{
        Button(action:{
            SoundManager.instance.playSound()
            isPresentedAdd.toggle()
        }, label:{
            Text("Add")
        })
    }
    
    func delete(indexSet: IndexSet){
        SoundManager.instance.playSound()
        shortdescrip.remove(atOffsets: indexSet)
        longdescrip.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class SoundManager: ObservableObject{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(){
        guard let url = Bundle.main.url(forResource: "button-16", withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error{
            print("Error playing sound.\(error.localizedDescription)")
        }
    }
}
