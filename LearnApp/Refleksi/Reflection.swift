//
//  struct.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//
import Foundation
import SwiftUI
//
//struct Refleksi:{
//    let id = UUID()
//    var title:String
//    var refleksi:String
//    var tag:[TagRefleksi]
//}
class Refleksi: ObservableObject,Identifiable {
    let id = UUID()
   var title:String
   var refleksi:String
   var tag:[TagRefleksi]
    
    init(title:String,refleksi:String,tag:[TagRefleksi]) {
        self.title=title
        self.refleksi=refleksi
        self.tag=tag
    }
    
}

//struct Refleksi:Identifiable{
//    let id = UUID()
//    var title:String
//    var refleksi:String
//    var tag:[TagRefleksi]
//}

enum TagRefleksi{
    case Goals
    case Experience
    case Thought
    case Challenging
}

class RefleksiList:ObservableObject{
    static var daftarRefleksi=[Refleksi(title: "Contoh Judul", refleksi: "Pada Hari ini saya mempelajari materi baru mengenai hidup, saya mereasa sangat senang sekali bisa belajar materi baru mengenai swiftui, saya berharap akan jadi lebih hebat dan lebih jago dari pada diriku kemarein. Semoga pula besok saya lebih positif dan bisa bekerja lebih banyak lagi", tag: [TagRefleksi.Goals,TagRefleksi.Experience])]
}
