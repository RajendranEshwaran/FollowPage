//
//  ContentView.swift
//  FollowPage
//
//  Created by Rajendran Eshwaran on 7/21/25.
//

import SwiftUI

struct ContentView: View {
let tabItems = TabItem.allTabItems
    @State private var selectedTab = 0
    @State private var followers: FollowPageModel = .sample
    @State private var followerProfile: [FollowerProfileModel] = FollowerProfileModel.profileSample
    var body: some View {
       
                
                VStack {
                    Spacer()
                    // Main content view based on selected tab
                    Group {
                        switch selectedTab {
                        case 0: HomeView()
                        case 1: SearchView()
                        case 2: AddFollowerView(followers: $followers, followerProfile: $followerProfile)
                        case 3: ProfileView()
                        case 4: NotificationsView()
                        default: HomeView()
                            
                        }
                    }
                    
                    // Custom Tab Bar
                    CustomTabbarView(selectedTabIndex: $selectedTab, tabItems: tabItems)
                        .frame(height: 65)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 0)
                }
                .background(Color.tabBackground(for: selectedTab))
                .padding(.bottom, 35)
                .edgesIgnoringSafeArea(.bottom)
            }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
    }
}

struct AddFollowerView: View {
    @Binding var followers: FollowPageModel
    @Binding var followerProfile: [FollowerProfileModel]
    var body: some View {
       // ZStack {
            VStack(alignment: .leading){
                HStack {
                    Text("\(followers.followers)").padding(.leading, 20).font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                    Spacer()
                    Text("\(followers.following)").padding(.leading, 20).font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                    Spacer()
                    Text("\(followers.post)").padding(.trailing, 20).font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                }
                HStack {
                    Text("Followers").padding(.leading, 20).font(.system(size: 15, weight: .regular, design: .default)).foregroundColor(.black)
                    Spacer()
                    Text("Following").padding(.trailing, 20).font(.system(size: 15, weight: .regular, design: .default)).foregroundColor(.black)
                    Spacer()
                    Text("Post").padding(.trailing, 20).font(.system(size: 15, weight: .regular, design: .default)).foregroundColor(.black)
                }
            }.padding(.top,250)
        FollowersDetailView(followerProfile: $followerProfile)
        }
}

struct followerProfileView: View {
    var body: some View {
            VStack {
                HStack {
                    VStack {
                        Text("Add Followers").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                        Text("Add Followers").font(.system(size: 15, weight: .regular, design: .default)).foregroundColor(.gray)
                    }
                }
            }
    }
}


extension Color {
    static func tabBackground(for index: Int) -> Color {
        switch index {
        case 0: return .orange
        case 1: return .purple
        case 2: return .green
        default: return .blue
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct FollowersDetailView: View {
    @Binding var followerProfile: [FollowerProfileModel]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white).cornerRadius(20, corners: [.topLeft, .topRight])
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/2)
            HStack {
                ForEach(followerProfile, id: \.self) { profile in
                    VStack {
                        Text(profile.fullName).font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                        Text(profile.username).font(.system(size: 15, weight: .regular, design: .default)).foregroundColor(.black)
                    }.offset(x: -100, y: -150)
                    .frame(width: 300, height: 300)
                }
                
            }
            Button(action: {
                    print("sign up bin tapped")
                }) {
                    Text("FOLLOW")
                        .frame(minWidth: 0, maxWidth: 100)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.pink)
                .cornerRadius(25)
                .offset(x: 120, y: -150)
            VStack {
                Text("In order to show you the most relevant results, we have omitted some entries very similar to the 8 already displayed.").font(.system(size: 12, weight: .regular, design: .default)).foregroundColor(.black)
                    .offset(x: 0, y: -20)
                
                Text("Photos").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.black)
                    .offset(x: -150, y: 0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { _ in
                            Image("bg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                        }
                    }
                }.offset(x: 0, y: 40)
            }
        }
    }
}
