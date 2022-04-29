//
//  ReflectionDetailView.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//

import Foundation
import SwiftUI

struct TaskDetailAddView:View{
    @State private var titleTask:String=""
    @State private var deskripsiTask:String=""
    @Binding var tasks:[Tugas]
//    @State var task:Tugas
    @State var selectedDate:Date=Date()
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack{
            Form{
            DatePicker("Select a Date", selection: $selectedDate)
                .accentColor(Color.blue)
                .datePickerStyle(GraphicalDatePickerStyle())
            }
        TextField("Judul Tugas", text: $titleTask)
//            .fontWeight(.bold)
            .padding(.horizontal,30)
            .font(.system(size: 40))
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.brown)
//                .frame(maxWidth: .infinity, maxHeight: 10000)
//                    .padding(.horizontal,30)
//                    .overlay(
            ZStack{
                TextEditor(text: $deskripsiTask)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black)
                            .padding(.horizontal,30)
                            .multilineTextAlignment(.leading)
//                            .fontWeight(.bold)
                            .font(.system(size: 15))
            }.shadow(color: .black, radius: 1)
//                    )
            Button("Tambah tugas") {
                ListDaftarTaskTugas.DaftarTaskTugas.append(Tugas(judul: titleTask, deskripsi: deskripsiTask, tanggal: selectedDate, tipeTugas: []))
                self.tasks=ListDaftarTaskTugas.DaftarTaskTugas
                presentationMode.wrappedValue.dismiss()
//                print(RefleksiList.daftarRefleksi)
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
//            NavigationLink(destination:ReflectionView(),label: {
//                RoundedRectangle(cornerRadius: 30)
//                    .foregroundColor(.white)
//                                .padding()
//                                .background(.blue)
//                                .clipShape(RoundedRectangle(cornerRadius: 30))
            
        }
        
    }
                           }






