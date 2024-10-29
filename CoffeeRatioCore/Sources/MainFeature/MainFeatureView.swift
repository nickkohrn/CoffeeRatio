import ComposableArchitecture
import SwiftUI

public struct MainFeatureView: View {
    private var store: StoreOf<MainFeatureReducer>
    
    public var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text("Beans")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text(store.result.beans.formatted(.measurement))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
            }
            
            Spacer()
            
            VStack {
                Text("Ratio")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text(store.result.ratio.formatted())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
            }
            
            Spacer()
            
            VStack {
                Text("Water")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text(store.result.water.formatted(.measurement(.grams)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear { store.send(.onAppear) }
    }
    
    public init(store: StoreOf<MainFeatureReducer>) {
        self.store = store
    }
}

#Preview {
    NavigationStack {
        MainFeatureView(
            store: StoreOf<MainFeatureReducer>(
                initialState: MainFeatureReducer.State(),
                reducer: { MainFeatureReducer() }
            )
        )
    }
}
