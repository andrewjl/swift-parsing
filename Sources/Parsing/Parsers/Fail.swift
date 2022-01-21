/// A parser that always fails, no matter the input.
///
/// ```swift
/// Fail<Substring, Int>().parse("123 Hello") // (output: nil, rest: "123 Hello")
/// ```
public struct Fail<Input, Output>: Parser {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    // TODO: `Fail.init(throwing: Error)`?
    throw ParsingError.failed(debugDescription: "A failing parser ran.", at: input)
  }
}

extension Fail where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension Fail where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension Parsers {
  public typealias Fail = Parsing.Fail  // NB: Convenience type alias for discovery
}
