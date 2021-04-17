//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 16/04/2021.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var isLeaderboardShowing:Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:10) {
                HeaderView(isLeaderboardShowing: $isLeaderboardShowing)
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
    }
}

struct RowView: View {
    let index:Int
    let score:Int
    let date:Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width:Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width:Constants.Leaderboard.leaderboardDateColWidth)
            
        }.background(RoundedRectangle(cornerRadius: .infinity)
                        .strokeBorder(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth ))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView:View {
    
    @Binding var isLeaderboardShowing:Bool
    
    // Here we call env vars to detect space into Portrait and Landscape mode
    // For more info about SizeClasses check this website
    // https://useyourloaf.com/blog/size-classes/
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    var body: some View{
        ZStack {
            HStack {
                if verticalSizeClass == .regular &&
                    horizontalSizeClass == .compact{
                    BigBoldText(text: "Leaderboard").padding(.leading)
                    Spacer()
                }else{
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack{
                Spacer()
                Button(action: {isLeaderboardShowing = false}) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView:View {
    var body: some View{
        HStack{
            Spacer()
                .frame(width:Constants.General.roundedViewLength)
            Spacer()
            LabelTextView(label: "Score")
                .frame(width:Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelTextView(label: "Date")
                .frame(width:Constants.Leaderboard.leaderboardDateColWidth)
        }  .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var isLeaderboardShowing = Binding.constant(false)
    
    static var previews: some View {
        
        // For Light Mode View
        LeaderboardView(isLeaderboardShowing: isLeaderboardShowing)
        LeaderboardView(isLeaderboardShowing: isLeaderboardShowing)
            .previewLayout(.fixed(width: 568
                                  , height: 320))
        
        // For Dark Mode View
        LeaderboardView(isLeaderboardShowing: isLeaderboardShowing)
            .preferredColorScheme(.dark)
        LeaderboardView(isLeaderboardShowing: isLeaderboardShowing)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568
                                  , height: 320))
    }
}
