//
//  CustomTabbarView.swift
//  FollowPage
//
//  Created by Rajendran Eshwaran on 7/21/25.
//

import SwiftUI

struct CustomTabbarView: View {
    @Binding var selectedTabIndex: Int
    @State var tabItems: [TabItem] = TabItem.allTabItems
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0)
            HStack(spacing: 0) {
                ForEach(0..<tabItems.count, id: \.self){ index in
                    Button(action: {
                        withAnimation {
                            selectedTabIndex = index
                        }
                    }, label: {
                        Image(systemName: tabItems[index].icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.gray)
                            .background(tabItems[index].title == "Add" ? Color.pink : Color.white)
                            .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
            }
            GeometryReader { geometry in
                
                let tabWidth = geometry.size.width / CGFloat(tabItems.count)
                                let indicatorWidth: CGFloat = 40
                                let indicatorOffset = (tabWidth * CGFloat(selectedTabIndex)) + (tabWidth - indicatorWidth) / 2
                Color.pink
                    .frame(width: indicatorWidth, height: 4)
                    .cornerRadius(2)
                    .offset(x: indicatorOffset)
                    .animation(.easeInOut(duration: 0.3), value: selectedTabIndex)
                    
            }.frame(height: 65)
        }
    }
}

#Preview {
    CustomTabbarView(selectedTabIndex: .constant(0))
}

struct TabItem: Identifiable {
    let id: Int
    let title: String
    let icon: String
    
    static let allTabItems : [TabItem] = [
        TabItem(id: 0, title: "Home", icon: "house"),
        TabItem(id: 1, title: "Search", icon: "magnifyingglass"),
        TabItem(id: 2, title: "Add", icon: "plus"),
        TabItem(id: 3, title: "Profile", icon: "person.circle"),
        TabItem(id: 4, title: "Notifications", icon: "bell"),
    ]
}


