//
//  UserCell.swift
//  VKApp_SwiftUI
//
//  Created by admin on 28.06.2022.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    var userName: String = ""
    var userPicName: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    CellImage {
                        KFImage(URL(string: userPicName))
                    }
                    VStack {
                        HStack{
                            Text(userName)
                                .padding(.all, 5)
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            HStack{
                                Text("Дата рождения")
                                    .padding(.all, 5)
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}


