extension Optional: Parser where Wrapped: Parser {
  public func parse(_ input: inout Wrapped.Input) rethrows -> Wrapped.Output? {
    guard let self = self
    else { return nil }

    return try self.parse(&input)
  }
}

extension Parsers {
  public struct OptionalVoid<Wrapped>: Parser where Wrapped: Parser, Wrapped.Output == Void {
    let wrapped: Wrapped?

    public init(upstream: Wrapped?) {
      self.wrapped = upstream
    }

    public func parse(_ input: inout Wrapped.Input) rethrows {
      guard let wrapped = self.wrapped
      else { return }

      return try wrapped.parse(&input)
    }
  }
}
