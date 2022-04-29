//
//  Task.swift
//  LearnApp
//
//  Created by Evan Susanto on 27/04/22.
//

import Foundation
import SwiftUI

class Tugas:ObservableObject,Identifiable{
    let id = UUID()
    var judul:String
    var deskripsi:String
    var tanggal:Date
    var tipeTugas:[TagTipeTugas]
    
    init(judul:String,deskripsi:String,tanggal:Date,tipeTugas:[TagTipeTugas]) {
        self.judul=judul
        self.deskripsi=deskripsi
        self.tanggal=tanggal
        self.tipeTugas=tipeTugas
    }
}
//var hari =Date()

enum TagTipeTugas{
    case Quiz
    case PR
    case Presentation
    case SelfImprovement
    
}


//class TaskTugas:Identifiable{
//    let id = UUID()
//    init(identifier:String,arrTask:[String]) {
//        self.tanggal=tanggal
//    }
//}


class ListDaftarTaskTugas:ObservableObject{
    static var DaftarTaskTugas=[Tugas(judul: "Judul Tugas", deskripsi: "Ulangan Rangkaian Listrik", tanggal: Date(), tipeTugas: [TagTipeTugas.Quiz,TagTipeTugas.PR])]
}




