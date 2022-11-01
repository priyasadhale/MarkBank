//
//  ContentView.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/12/22.
//
/**:
 - Author: Priya Sadhale
 - Remark: This view is responsible for showing onboarding screens.
 */
import SwiftUI

struct OnboardingFlowView: View {
    //MARK: We will be using the value stored in environment to check which screen is to be displayed
    @EnvironmentObject var appState: AppState
    
    @State private var pageIndex = 0
    
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
       
       var body: some View {
          
           VStack{
               HStack{
                   Spacer()
                   Button("Skip"){
                       print("skipping")
                       incrementPage()
                   }
                   .padding()
              }
               TabView(selection: $pageIndex) {
                       ForEach(pages) { page in
                           VStack {
                               Spacer()
                               PageView(page: page)
                               Spacer()
                               if page == pages.last {
                                   Button("Sign up!", action: goToLogin)
                                       .buttonStyle(.bordered)
                               } else {
                                   Button("Next", action: incrementPage)
                                       .buttonStyle(.borderedProminent)
                               }
                               Spacer()
                           }
                           .tag(page.tag)
                       }
                   }
                   
                   .animation(.easeInOut, value: pageIndex)// 2
                   .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                   .tabViewStyle(PageTabViewStyle())
                   .onAppear {
                       dotAppearance.currentPageIndicatorTintColor = .black
                       dotAppearance.pageIndicatorTintColor = .gray
               }
           }
           .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
         
       }
    
       
       func incrementPage() {
           pageIndex += 1
       }
       
       func goToLogin() {
           //appState.hasOnboarded = true
           appState.screen = .onboarded
       }
   }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView()
    }
}
