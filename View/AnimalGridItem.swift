//
//  AnimalGridItem.swift
//  Africa
//
//  Created by enjykhaled on 14/03/2022.
//

import SwiftUI

struct AnimalGridItem: View {
    //MARK: - Properties
    let animal : Animal
    //MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItem_Previews: PreviewProvider {
    static let animals :[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItem(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
