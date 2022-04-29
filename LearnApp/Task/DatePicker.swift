//
//  DatePicker.swift
//  LearnApp
//
//  Created by Evan Susanto on 27/04/22.
//

import SwiftUI

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
struct DatePickerTask: View {
    @Environment(\.presentationMode) var presentationMode
    @State var tasks:[Tugas]=ListDaftarTaskTugas.DaftarTaskTugas
    @State var selectedDate:Date=Date()
//    @State var components = selectedDate.get(.day, .month, .year)
//    var components=selectedDate.get(self.day)
//    var day=components.day
//    var month=components.month
//    var year=components.year
//    if var day = components.day, var month = components.month, var year = components.year {
//        print("day: \(day), month: \(month), year: \(year)")
//    }
//    let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
//        guard let date = formatter.date(from: $selectedDate) else {
//            return
//        }
    var body: some View {
        NavigationView{
        VStack(spacing:10){
            Text("Task Management")
                .font(.title2.bold())
                .padding(.horizontal,40)
        Form{
        DatePicker("Select a Date", selection: $selectedDate)
            .accentColor(Color.blue)
            .datePickerStyle(GraphicalDatePickerStyle())
            Text("Tasks")
//                    .padding(.horizontal,40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
//                    .fontWeight(.bold)
//            if($selectedDate==TaskTugas.identifier){
//                Text("Evan Susanto")
//            }
            Text(selectedDate.formatted(date: .long, time: .omitted))
                .font(.system(size: 15))
                .fontWeight(.semibold)
//                 Text(selectedDate.formatted(date: .long, time: .omitted)
//                    .font(.title2.bold())
            List(tasks,id: \.id){task in
               
                    if(Calendar.current.isDate(selectedDate, equalTo: task.tanggal, toGranularity: .day)){
                        NavigationLink(destination:TaskDetailView(task: task),label:{
                Image(systemName: "doc.plaintext.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height:90)
                    .cornerRadius(4)
                VStack(alignment: .leading, spacing: 5){
                    Text(task.judul)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .font(.system(size: 20))
                        .minimumScaleFactor(0.5)
//                        Text((item.tipeBahan+"/"+item.checkJenisZatGiziName(jenisZatGizi: item.arrOfZatGizi[0])))
//                            .font(.system(size: 15, weight:.light))
//                            .lineLimit(2)
//                            .minimumScaleFactor(0.5)
                   Text(task.deskripsi)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(4)
                    }
                }
            )}
                        
//            Text("Hari Ini tanggal"+" "+selectedDate.description)
//            Text("Hari Ini tanggal"+" "+selectedDate.description)
//                NavigationLink(destination:TaskDetailAddView(tasks: ListDaftarTaskTugas.DaftarTaskTugas, task: task)
            
        
//        Form{
//        }
//            Button(action: print(selectedDate.description)
        }
            NavigationLink(destination:TaskDetailAddView(tasks: $tasks),label:{
                Button("Tambah Tugas") {
                    print(Calendar.current.isDate(selectedDate, equalTo: Date(), toGranularity: .day))
    //                presentationMode.wrappedValue.dismiss()
    //                RefleksiList.daftarRefleksi.append(Refleksi(title: titleRefleksi, refleksi: textRefleksi, tag: []))
    //                self.reflections=RefleksiList.daftarRefleksi
    //                print(RefleksiList.daftarRefleksi)
                }
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        )}
        }
        }
}
struct DatePickerTask_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerTask()
    }
}
}
