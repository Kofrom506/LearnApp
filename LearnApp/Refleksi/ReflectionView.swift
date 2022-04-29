//
//  ReflectionView.swift
//  LearnApp
//
//  Created by Evan Susanto on 26/04/22.
//

import Foundation
import SwiftUI
//
//class SomeViewModel:ObservableObject{
//    @Published var someStructValue:Bool
//    var someClassValue:MyClass=NewMyClass
//}
struct ReflectionView:View{
     @State var reflections:[Refleksi]=RefleksiList.daftarRefleksi
    init(reflections:[Refleksi]) {
        self.reflections=reflections
    }
    var body:some View {
        VStack(alignment:.leading,spacing: 10){
            NavigationView{
                List(reflections,id: \.id){reflection in
                    NavigationLink(destination:ReflectionDetailView(reflection: reflection),label:{
                    Image(systemName: "doc.plaintext.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height:90)
                        .cornerRadius(4)
                    VStack(alignment: .leading, spacing: 5){
                        Text(reflection.title)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .font(.system(size: 20))
                            .minimumScaleFactor(0.5)
//                        Text((item.tipeBahan+"/"+item.checkJenisZatGiziName(jenisZatGizi: item.arrOfZatGizi[0])))
//                            .font(.system(size: 15, weight:.light))
//                            .lineLimit(2)
//                            .minimumScaleFactor(0.5)
                       Text(reflection.refleksi)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(4)
                        }
                    }
               )
            }.navigationTitle("Daftar Refleksi")
            .navigationBarItems(
                trailing:
                    NavigationLink(destination:ReflectionDetailAddView(reflections: $reflections),label: {
                Image(systemName: "plus.circle.fill")
                }
                                   )
            )
            }
            
        }
//
//        .onLoad{
//            ReflectionView()
//        }
    
}
}
struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

}
extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

}
