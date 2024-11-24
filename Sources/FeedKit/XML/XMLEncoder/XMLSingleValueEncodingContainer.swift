//
//  XMLSingleValueEncodingContainer.swift
//
//  Copyright (c) 2016 - 2024 Nuno Dias
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

class XMLSingleValueEncodingContainer: SingleValueEncodingContainer {
  /// The XML encoder used for encoding.
  let encoder: XMLEncoder
  /// The XML element being encoded.
  let element: XMLElement
  /// The coding path of the current encoding process.
  var codingPath: [any CodingKey]

  /// Initializes a container for encoding values to an XML element.
  /// - Parameters:
  ///   - encoder: The XML encoder used for encoding.
  ///   - element: The XML element to encode values to.
  ///   - codingPath: The coding path representing the current encoding state.
  init(encoder: XMLEncoder, element: XMLElement, codingPath: [any CodingKey]) {
    self.encoder = encoder
    self.element = element
    self.codingPath = codingPath
  }

  // MARK: -

  func encodeNil() throws {
    fatalError()
  }

  func push<T: LosslessStringConvertible>(_ value: T) {
    encoder.stack.push(.init(
      type: .element, 
      name: encoder.currentKey,
      text: "\(value)"
    ))
  }

  func encode(_ value: Bool) throws { push(value) }
  func encode(_ value: String) throws { push(value) }

  // MARK: - Int

  func encode(_ value: Int) throws { push(value) }
  func encode(_ value: Int8) throws { push(value) }
  func encode(_ value: Int16) throws { push(value) }
  func encode(_ value: Int32) throws { push(value) }
  func encode(_ value: Int64) throws { push(value) }

  // MARK: - Unsigned Int

  func encode(_ value: UInt) throws { push(value) }
  func encode(_ value: UInt8) throws { push(value) }
  func encode(_ value: UInt16) throws { push(value) }
  func encode(_ value: UInt32) throws { push(value) }
  func encode(_ value: UInt64) throws { push(value) }

  // MARK: - Floating point

  func encode(_ value: Float) throws { push(value) }
  func encode(_ value: Double) throws { push(value) }

  // MARK: - Encode Type

  func encode<T>(_ value: T) throws where T: Encodable {
    let some = try encoder.encode(value)
    encoder.stack.push(some)
  }
}
