//
//  ReflectionDetailView.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//

import Foundation
import SwiftUI

struct ReflectionDetailAddView:View{
    @State private var titleRefleksi:String=""
    @State private var textRefleksi:String=""
    @Binding var reflections:[Refleksi]
//    @State var reflection:Refleksi
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        
        VStack{
        TextField("Judul Refleksi", text: $titleRefleksi)
//            .fontWeight(.bold)
                .padding(.horizontal,30)
            .font(.system(size: 40))
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.brown)
//                .frame(maxWidth: .infinity, maxHeight: 10000)
//                    .padding(.horizontal,30)
//                    .overlay(
                        
            ZStack{
                TextEditor(text: $textRefleksi)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black)
                            .padding(.horizontal,30)
                            .multilineTextAlignment(.leading)
//                            .fontWeight(.bold)
                            .font(.system(size: 15))
            }.shadow(color: .black, radius: 1)
//                    )
            Button("Simpan") {
                presentationMode.wrappedValue.dismiss()
                RefleksiList.daftarRefleksi.append(Refleksi(title: titleRefleksi, refleksi: textRefleksi, tag: []))
                self.reflections=RefleksiList.daftarRefleksi
                print(RefleksiList.daftarRefleksi)
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
            
        Spacer()
        }
        
    }
                           }






