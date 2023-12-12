//
//  CardView.swift
//  Hike
//
//  Created by Andrew Kestler on 12/11/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage(){
        
        print("--BUTTON WAS PRESSED--")
        print("Status: OLD Image # = \(imageNumber)")
        
        
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Generated # = \(randomNumber)")
        } while randomNumber == imageNumber
        

        imageNumber = randomNumber
        print("Result: NEW Image # = \(imageNumber)")
    }
    
    
    var body: some View {
        ZStack {
                    
            CustomBackgroundView()
            
            VStack {
                
                //MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,
                                                        .customGrayMedium], startPoint: .top, endPoint: .bottom
                                )
                        )
                        Spacer()
                        Button {
                            // ACTION: Show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                            
                        }

                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: HEADER
                .padding(.horizontal, 30)
                
                //MARK: - Main Content
                ZStack {
                    CustomCircleView()
                        
                    Image("image-\(imageNumber)")
                         .resizable()
                     .scaledToFit()
                     .animation(.default, value: imageNumber)
                }
              //MARK: - Footer
                
                Button {
                    //ACTION: Generate a random number
                   randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                
                .buttonStyle(GradientButton())
            }
            
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
