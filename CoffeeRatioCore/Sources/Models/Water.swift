import Foundation

public struct Water {
    public let value: Double
    
    public var gramsMeasurement: Measurement<UnitMass> {
        Measurement<UnitMass>(value: value, unit: .grams)
    }
    
    public var ouncesMeasurement: Measurement<UnitMass> {
        gramsMeasurement.converted(to: .ounces)
    }
    
    public init(value: Double) {
        self.value = value
    }
}

extension Water: Equatable {}
extension Water: Sendable {}

extension Water {
    public struct Formatter<Output> {
        public enum Option {
            case grams
            case ounces
        }
        
        public let format: (Water) -> Output
        
        public init(format: @escaping (Water) -> Output) {
            self.format = format
        }
    }
    
    public func formatted<Output>(_ formatter: Formatter<Output>) -> Output {
        formatter.format(self)
    }
}

extension Water.Formatter where Output == String {
    public static func measurement(_ option: Water.Formatter<Output>.Option) -> Self {
        Water.Formatter { water in
            let measurement: Measurement<UnitMass>
            switch option {
            case .grams: measurement = water.gramsMeasurement
            case .ounces: measurement = water.ouncesMeasurement
            }
            return measurement
                .formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .asProvided,
                        numberFormatStyle: .number.precision(.fractionLength(0...1))
                    )
                )
        }
    }
}
