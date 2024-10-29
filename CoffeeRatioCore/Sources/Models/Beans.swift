import Foundation

public struct Beans {
    public let value: Double
    
    public var gramsMeasurement: Measurement<UnitMass> {
        Measurement<UnitMass>(value: value, unit: .grams)
    }
    
    public init(value: Double) {
        self.value = value
    }
}

extension Beans: Equatable {}
extension Beans: Sendable {}

extension Beans {
    public struct Formatter<Output> {
        public let format: (Beans) -> Output
        
        public init(format: @escaping (Beans) -> Output) {
            self.format = format
        }
    }
    
    public func formatted<Output>(_ formatter: Formatter<Output>) -> Output {
        formatter.format(self)
    }
}

extension Beans.Formatter where Output == String {
    public static var measurement: Self {
        Beans.Formatter { beans in
            beans.gramsMeasurement
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
