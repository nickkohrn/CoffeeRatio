import Foundation

public struct Equation {
    public let beans: Beans
    public let ratio: Ratio
    public let water: Water
    
    public var result: Self.Result {
        let consequent = water.value / beans.value
        return Self.Result(beans: beans, ratio: Ratio(consequent: Int(consequent)), water: water)
    }
    
    public init(beans: Beans, ratio: Ratio, water: Water) {
        self.beans = beans
        self.ratio = ratio
        self.water = water
    }
}

extension Equation {
    public struct Result {
        public let beans: Beans
        public let ratio: Ratio
        public let water: Water
        
        public init(beans: Beans, ratio: Ratio, water: Water) {
            self.beans = beans
            self.ratio = ratio
            self.water = water
        }
    }
}

extension Equation: Sendable {}

extension Equation {
    public static let `default`: Self = {
        let beans = Beans(value: 18)
        let ratio = Ratio(consequent: 18)
        let waterValue = beans.value * Double(ratio.consequent)
        let water = Water(value: waterValue)
        return Equation(beans: beans, ratio: ratio, water: water)
    }()
}
