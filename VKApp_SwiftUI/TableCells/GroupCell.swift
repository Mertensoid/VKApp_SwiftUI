//
//  GroupCell.swift
//  VKApp_SwiftUI
//
//  Created by admin on 28.06.2022.
//

import SwiftUI

struct GroupCell: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
//                    CellImage {
//                        Image("essentials-2")
//                    }
                    VStack {
                        HStack{
                            Text("Название группы")
                                .padding(.all, 5)
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            HStack{
                                Text("Количество участников: ")
                                    .padding(.leading, 5)
                                    .padding(.vertical, 5)
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.8))
                                Text("0")
                                    .padding(.trailing, 5)
                                    .padding(.vertical, 5)
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.8))
                                Spacer()
                            }
                        }
                    }
                }
            }
            .frame(height: 74, alignment: .top)
            .padding(.all, 5)
            .background(Color(red: 0.1, green: 0.5, blue: 1, opacity: 0.1))
            .cornerRadius(10)
        }
        .padding(.all, 5)
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell()
    }
}
