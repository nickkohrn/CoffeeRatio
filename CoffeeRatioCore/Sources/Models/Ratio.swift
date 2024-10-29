import Foundation

public struct Ratio {
    public let antecedent = 1
    public let consequent: Int
    
    public init(consequent: Int) {
        self.consequent = consequent
    }
}

extension Ratio: Equatable {}
extension Ratio: Sendable {}

extension Ratio {
    public func formatted() -> String {
        "\(antecedent.formatted()):\(consequent.formatted())"
    }
}

