import Foundation

public struct Ratio {
    public let antecedent = 1
    public var consequent: Int
    
    public init(consequent: Int) {
        self.consequent = consequent
    }
}

extension Ratio: Sendable {}

extension Ratio {
    public func formatted() -> String {
        "\(antecedent.formatted()):\(consequent.formatted())"
    }
}

