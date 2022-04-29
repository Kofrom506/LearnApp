//
//  ReflectionDetailView.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//

import Foundation
import SwiftUI

struct TaskDetailView:View{
    @State private var textRefleksi:String=""
    @State var task:Tugas
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack{
            Text(task.judul)
            .fontWeight(.bold)
            .font(.system(size: 40))
                Rectangle()
                .fill(.white)
                    .padding(.horizontal,30)
                    .shadow(radius: 3)
                    .overlay(
                    ScrollView{
                        VStack(alignment: .leading){
                            Text(task.deskripsi)
                                .foregroundColor(.black)
                                .padding(.horizontal,50)
                                .padding(.vertical,20)
                                .font(.system(size: 15))
                        }
                            }
                )
//
            Button("Go Back") {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            
            
//        Button("action"){
//            presentationMode.wrapped.dismiss()
//        }
//            RoundedRectangle(cornerRadius: 40)
//                    .fill(.blue)
//                    .frame(maxWidth: .infinity, maxHeight:50)
//                    .padding(.horizontal,30)
//                    .overlay(
//                        Text("Kembali")
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                            .font(.system(size: 20))
//                    )
//
//        }
        }
    }
}




