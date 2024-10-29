import ComposableArchitecture
import Foundation
import Models

@Reducer
public struct MainFeatureReducer {
    @ObservableState
    public struct State: Equatable {
        public var result = Equation.default.result
        
        public init() {}
    }
    
    public enum Action {
        case onAppear
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                return .none
                
            }
        }
    }
    
    public init() {}
}

