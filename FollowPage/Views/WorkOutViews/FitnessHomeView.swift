//
//  FitnessHomeView.swift
//  FollowPage
//
//  Created by Rajendran Eshwaran on 7/23/25.
//

import SwiftUI

struct FitnessHomeAppView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        ZStack {
            VStack {
                Group {
                    switch selectedTab {
                    case 0:FitnessHomeView()
                    case 1:JumpsView()
                    case 2:BattleFitView()
                    case 3:FitnessProfileView()
                    case 4:FitnessProfileView()
                    default: FitnessHomeView()
                    }
            }
                
                Rectangle()
                        .fill(.green)
                        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: 900)
                        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                        .zIndex(1)
                        .offset(y: -130)
                        
            }
//            .containerRelativeFrame([.horizontal, .vertical])
//            .background(Gradient(colors: [.teal, .cyan, .gray]).opacity(0.6))
            .ignoresSafeArea()
//            .overlay( /// apply a rounded border
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(style: StrokeStyle(lineWidth: 0))
//            )
            //.cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            FitnessTabView(selectedTab: $selectedTab)
                .offset(y: UIScreen.main.bounds.height / 3  + 40)
                .zIndex(-1)
        }
    }
}

#Preview {
    FitnessHomeAppView()
}

struct FitnessTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
            HStack {
                ForEach(FitnessTabbarItems.allCases, id: \.self) { item in
                    Spacer()
                    Button(action: {
                        selectedTab = item.rawValue
                    }, label: {
                        VStack {
                            Image(systemName: item.tabbarImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.white.opacity(selectedTab == item.rawValue ? 1.0 : 0.7))
                            Text(item.tabbarTitle)
                                .font(.callout)
                                .foregroundColor(Color.white.opacity(selectedTab == item.rawValue ? 1.0 : 0.7))
                        }
                    })
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/6)
            .background(.black.opacity(1.0))
            // .cornerRadius(35)
            
        }
}

struct FitnessHomeView: View {
    var body: some View {
        Text("FitnessHomeView!")
    }
}

struct JumpsView: View {
    var body: some View {
        Text("JumpsView!")
    }
}

struct FitnessProfileView: View {
    var body: some View {
        ZStack {
            
        }
    }
}


struct BattleFitView: View {
    var body: some View {
        Text("BattleFitView!")
    }
}


struct FitnessProgressView: View {
    var body: some View {
        Text("FitnessProgressView!")
    }
}
