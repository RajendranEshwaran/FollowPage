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
                    case 3:FitnessProgressView()
                    case 4:FitnessProfileView()
                    default: FitnessHomeView()
                    }
            }
                
//                Rectangle()
//                        .fill(.green)
//                        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: 900)
//                        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
//                        .zIndex(1)
//                        .offset(y: -130)
                        
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.teal, .cyan, .gray]).opacity(0.6))
            .ignoresSafeArea()
//            .overlay( /// apply a rounded border
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(style: StrokeStyle(lineWidth: 0))
//            )
            //.cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            FitnessTabView(selectedTab: $selectedTab)
                .offset(y: UIScreen.main.bounds.height / 3  + 40)
                //.zIndex(-1)
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
    @State private var followerProfile: [FollowerProfileModel] = FollowerProfileModel.profileSample
    var body: some View {
        NavigationStack {
           
            VStack {
                VStack() {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .clipShape(.circle)
                        .padding()
                    Text(followerProfile[0].fullName)
                        .font(.system(size: 17, weight: .bold, design: .default))
                    Text(followerProfile[0].username)
                        .font(.system(size: 17, weight: .regular, design: .default))
                        
                }.offset(y: -50)
                  
                HStack {
                    Image(systemName: "figure.walk.motion")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipped()
                        .padding(.leading, 20)
                   
                    Text("2435")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.leading, 30)
                    Spacer()
                    Text("Steps today")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color.black.opacity(0.6))
                        .padding()
                }.frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.teal.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.horizontal)
                    .offset(y: -40)
                List {
                    ForEach(ProfileItemList.profileItemList) { item in
                        NavigationLink(destination: EmptyView(), label: {
                            HStack {
                                Image(systemName: item.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                
                                Text(item.item)
                                    .fontWeight(.semibold)
                                    .padding(.leading, 10)
                                Spacer()
                                VStack(alignment: .leading) {
                                    
                                }
                                .frame(height: 60)
                            }.background(
                                RoundedRectangle(cornerRadius: 10.0).fill(.gray.opacity(0.05)))
                            // ProfileItemList(item: "Sound", icon: "music.note")
                            .buttonStyle(DefaultListStyle())
                        })
                    }
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        Text("Profile")
                            .fontWeight(.bold)
                    })
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Action for the leading button
                        }) {
                            Image(systemName: "chevron.backward.chevron.backward.dotted")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Action for the trailing button
                        }) {
                            Image(systemName: "bubble.and.pencil")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                        }
                    }
                })
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

struct ProfileItemListView: View {
    @Binding var icon: String
    @Binding var item: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                
            Text(item)
                .fontWeight(.semibold)
                .padding(.leading, 10)
            Spacer()
            VStack(alignment: .leading) {
                
            }
        .frame(height: 60)
        }.background(
            RoundedRectangle(cornerRadius: 10.0).fill(.gray.opacity(0.05)))
    }
}
