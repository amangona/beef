//
//  HomeView.swift
//  beef
//
//  Created by abe on 5/25/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var showDetail = false
    //    @State var selected: BeefViewModel?
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "background")
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(named: "background")
        UINavigationBar.appearance().standardAppearance = appearance
    }
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.beefs) { beef in
                    BeefCardView(viewModel:  BeefViewModel(beef: beef)) {
                        print($0)
                        NavigationLink(destination: BeefView(viewModel: $0)) {
                            EmptyView()
                        }
                    }
                    BeefCardView(viewModel:  BeefViewModel(beef: beef)) {
                        print($0)
                        NavigationLink(destination: BeefView(viewModel: $0)) {
                            EmptyView()
                        }
                    }
                    BeefCardView(viewModel:  BeefViewModel(beef: beef)) {
                        print($0)
                        NavigationLink(destination: BeefView(viewModel: $0)) {
                            EmptyView()
                        }
                    }
                }
                .listRowBackground(Color("background"))
                .background(Color("background"))
            }
            .listSeparatorStyleNone()
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        print("SF Symbol button pressed...")
                    }) {
                        Image(systemName: "heart.fill").imageScale(.large)
                    }
                    Text("Beef")
                        .font(.system(size: 34))
                        .fontWeight(.medium)
                        .foregroundColor(Color("titleColor"))
                        .padding(screen.width/3.5)
                }
                ,
                                trailing:
                Button(action: {
                    print("Edit button pressed...")
                }) {
                    Image(systemName: "magnifyingglass").imageScale(.large)
                }
            )
            
            //            .navigationBarItems(trailing: Button(action: {
            //                print("seach action...")
            //            }, label: {
            //                Image(systemName: "magnifyingglass")
            //            }))
            //            .navigationBarItems(leading: Button(action: {
            //                print("like beef action..")
            //            }, label: {
            //                Image(systemName: "heart.fill")
            //            }))
            
        }
    }
}

struct CourseView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("20 Sections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "twitter"))
            }
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "twitter"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30 : 0)
//        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

class HomeViewModel: ObservableObject {
    @Published var beefs: [Beef] = []
    
    func getBeefs() {
        BFService.shared.getAllBeefs { (beefs) in
            // append this to the list of beefs
            if beefs != nil {
                self.beefs = beefs!
            }
        }
    }
    init() {
        getBeefs()
    }
    
}
