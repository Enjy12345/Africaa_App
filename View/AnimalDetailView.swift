//
//  AnimalDetailView.swift
//  Africa
//
//  Created by enjykhaled on 19/02/2022.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - Properties
    let animal: Animal
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical ,showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
               //HERO Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical , 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                        InsetGalleryView(animal: animal)
                }//:Group
                .padding(.horizontal)
                //Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                    
                }//:Group
                .padding(.horizontal)
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }.padding(.horizontal)
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }.padding(.horizontal)
            }//:VStack(
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//:scroll
    }
}
//MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals : [Animal] =  Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[1])
        }
        .previewDevice("iphone 11 Pro")
     
    }
}
