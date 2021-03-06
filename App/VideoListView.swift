//
//  VideoListView.swift
//  Africa
//
//  Created by enjykhaled on 17/02/2022.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - Properties
  @State  var videos :[VideoModel] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - Body
    var body: some View {
        NavigationView {
            List{
                ForEach(videos) { item in
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical , 8)
                    }
                }//:Loop
            }//:List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
            
        }//:Navigation
    }
}
//MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
