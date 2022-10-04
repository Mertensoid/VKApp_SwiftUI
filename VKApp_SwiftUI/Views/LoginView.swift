//
//  ContentView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 20.06.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @Binding var isUserLoggedIn: Bool
    
    @State var login: String = ""
    @State var password: String = ""
    @State var shoudShowLogo: Bool = true
    
    @State private var showIncorrectCredentialsWarning = false
    
    
    private func verifyLoginData() {
        if login == "" && password == "" {
            isUserLoggedIn = true
            print("Password is OK")
        } else {
            showIncorrectCredentialsWarning = true
        }
        password = ""
    }
    
    private let keyboardPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for:
            UIResponder.keyboardWillChangeFrameNotification)
            .map { notification in true},
        NotificationCenter.default.publisher(for:
            UIResponder.keyboardWillHideNotification)
            .map { notification in false}
        ).eraseToAnyPublisher()
    
    var body: some View {
        
        ZStack {
//            GeometryReader { geometry in
//                Image("leaf")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//
//            }
            VStack {
                if self.shoudShowLogo {
                    Text("VK App")
                        .padding()
                        .font(.largeTitle)
                }
                HStack {
                    Text("Телефон или e-mail:")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.top)
                TextField("", text: $login)
                    .cornerRadius(5)
                    .autocapitalization(.none)
                HStack {
                    Text("Пароль:")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.top)
                SecureField("", text: $password)
                    .cornerRadius(5)
                
                HStack {
                    Button {
                        verifyLoginData()
                    } label: {
                        Label("Войти", systemImage: "chevron.right.circle")
                            .foregroundColor(.white)
                            .padding(.all, 5)
                    }
                    .padding(.all, 5)
                    .background(.blue)
                    .cornerRadius(5)
                    
                    Button {
                        print("Button Tapped")
                    } label: {
                        Label("Отмена", systemImage: "multiply.circle")
                            .foregroundColor(.gray)
                            .padding(.all, 5)
                    }
                    .padding(.all, 5)
                    .background(.white)
                    .cornerRadius(5)
                    
                    Spacer()
                }
                .padding(.top)
                
                HStack {
                    Text("Еще не зарегистрированы?")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.top)
                
                Button {
                    print("Button Tapped")
                } label: {
                    HStack{
                        Spacer()
                        Label("Зарегистрироваться", systemImage: "doc.badge.plus")
                            .foregroundColor(.blue)
                            .padding(.all, 5)
                        Spacer()
                    }
                }
                .padding(.all, 5)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(true)
        }
        .alert(isPresented: $showIncorrectCredentialsWarning) {
            Alert(title: Text("Error"), message: Text("Some error"), dismissButton: .cancel())
        }
        .onReceive(self.keyboardPublisher) { isKeyboardShown in
            withAnimation(.easeIn(duration: 0.5)) {
                self.shoudShowLogo = !isKeyboardShown
            }
        }
        
    }
}

extension UIApplication {
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil)
    }
}

//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        LoginView(isUserLoggedIn: )
//
//    }
//}
