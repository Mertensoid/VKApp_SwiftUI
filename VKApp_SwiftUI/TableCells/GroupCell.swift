//
//  GroupCell.swift
//  VKApp_SwiftUI
//
//  Created by admin on 28.06.2022.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    var groupName: String = ""
    var groupPicName: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    CellImage {
                        KFImage(URL(string: groupPicName))
                    }
                    VStack {
                        HStack{
                            Text(groupName)
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

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell()
    }
}
