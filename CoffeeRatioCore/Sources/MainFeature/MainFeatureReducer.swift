import ComposableArchitecture
import Foundation
import Models

@Reducer
public struct MainFeatureReducer {
    @ObservableState
    public struct State: Equatable {
        public var beans: Beans
        public var ratio: Ratio
        public var result: Equation.Result
        public var water: Water
        
        public init() {
            let result = Equation.default.result
            self.result = result
            self.beans = result.beans
            self.ratio = result.ratio
            self.water = result.water
        }
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case setBeansValue(Double)
        case setRatioConsequentValue(Int)
        case setWaterValue(Double)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .none
                
            case .setBeansValue(let value):
                state.beans = Beans(value: value)
                return calculateResult(state: &state)
                
            case .setRatioConsequentValue(let value):
                state.ratio = Ratio(consequent: value)
                return calculateResult(state: &state)
                
            case .setWaterValue(let value):
                state.water = Water(value: value)
                return calculateResult(state: &state)
            }
        }
    }
    
    public init() {}
    
    private func calculateResult(state: inout State) -> Effect<Action> {
        state.result = Equation(beans: state.beans, ratio: state.ratio, water: state.water).result
        return .none
    }
}

