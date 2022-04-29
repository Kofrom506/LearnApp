//
//  HomeScreenPage.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//

import Foundation
import SwiftUI

struct HomeScreenPage: View{
    var body: some View{
    TabView(){
        DatePickerTask()
            .tabItem{
                Image(systemName: "rectangle.inset.filled.and.person.filled")
                    Text("Task")
            }
        ReflectionView(reflections: RefleksiList.daftarRefleksi)
            .tabItem{
                Image(systemName: "note.text")
                    Text("Refleksi")
            }
        ContentView()
            .tabItem{
                Image(systemName: "timer.square")
                    Text("Pomodoro")
            }
        
        
    }
}
}
