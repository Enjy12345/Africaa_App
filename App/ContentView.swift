//
//  ContentView.swift
//  Africa
//
//  Created by enjykhaled on 17/02/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Ptoperties
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColoumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    //MARK: - Functions
    func gridSwitch()
    {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        //It is incremented by 1 to switch to the next grid layout
        gridColoumn = gridLayout.count
        print("Grid Number: \(gridColoumn)")
        switch gridColoumn
        
        {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
        //MARK: - Body

        NavigationView{
            Group {
                if !isGridViewActive {
                    List{
                    CoverViewImage()
                        .frame(height:300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach (animals) {
                            animals in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animals)){
                                AnimalListItem(animal: animals)
                            }//:Link
                        }//:Loop
                    }//:list
                } else {
                    ScrollView(.vertical , showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animals in
                                NavigationLink(destination: AnimalDetailView(animal: animals)) {
                                    AnimalGridItem(animal: animals)
                                }//:Link
                            }//:Loop
                        }//Grid
                        .padding(10)
                        .animation(.easeIn)
                    }//:ScrollView
                }//:Condition
            }//:Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        Button {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName:toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ?  .accentColor : .primary)
                        }


                    }//Hstack
                    
                }//:Buttons
                
            }//:toolbar
        }//:NavigationView
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
