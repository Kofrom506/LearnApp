import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @StateObject private var ist=ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        NavigationView{
        VStack {
            Text("")
            Text("\(vm.time)")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .alert("Waktunya Istirahat!!", isPresented: $vm.showingAlert) {
                    Button("Recess", role: .cancel) {
                        ist.start(minutes: ist.minutes)
                    }
                }
                .padding()
                .frame(width: width)
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4)
                    )
            
            Slider(value: $vm.minutes, in: 0...40, step: 1)
                .padding()
                .disabled(vm.isActive)
                .animation(.easeInOut, value: vm.minutes)
                .frame(width: width)
            HStack(spacing:50) {
                Button("Start") {
                    vm.start(minutes: vm.minutes)
                }
                .disabled(vm.isActive)
                
                Button("Reset", action: vm.reset)
                    .tint(.red)
            }
            .frame(width: width)
           //Ini Masukin Watch satu lagi
            Text("\(ist.time)")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .alert("Timer done!", isPresented: $ist.showingAlert) {
                    Button("Continue", role: .cancel) {
                        // Code
                    }
                }
                .padding()
                .frame(width: width)
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4)
                    )

            Slider(value: $ist.minutes, in: 1...40, step: 1)
                .padding()
                .disabled(ist.isActive)
                .animation(.easeInOut, value: ist.minutes)
                .frame(width: width)

            HStack(spacing:50) {
//                Button("Start") {
//                    ist.start(minutes: ist.minutes)
//                }
//                .disabled(ist.isActive)
//
                Button("Reset", action: ist.reset)
                    .tint(.red)
            }
            .frame(width: width)
        }
        .onReceive(timer) { _ in
            ist.updateCountdown()
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
            
        }.navigationTitle("Pomodoro")
        }

        }
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

