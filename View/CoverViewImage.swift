//
//  CoverViewImage.swift
//  Africa
//
//  Created by enjykhaled on 17/02/2022.
//

import SwiftUI
//MARK: - Properties
let coverImages:[CoverImage] = Bundle.main.decode("covers.json")
//MARK: - Body
struct CoverViewImage: View {
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                .resizable()
            .scaledToFill()
            }//:Loop
        }//:Tabview
        .tabViewStyle(PageTabViewStyle())
    }
}
//MARK: - Preview
struct CoverViewImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverViewImage()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
