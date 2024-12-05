//
//  MediaHash.swift
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

/// This is the hash of the binary media file. It can appear multiple times as
/// long as each instance is a different algo. It has one optional attribute.
public struct MediaHash {
  /// The element's text.
  public var text: String?

  /// The element's attributes.
  public struct Attributes: Codable, Equatable, Hashable {
    /// This is the hash of the binary media file. It can appear multiple times as long as
    /// each instance is a different algo. It has one optional attribute.
    public var algo: String?

    public init(algo: String? = nil) {
      self.algo = algo
    }
  }

  /// The element's attributes.
  public var attributes: Attributes?

  public init(
    text: String? = nil,
    attributes: Attributes? = nil) {
    self.text = text
    self.attributes = attributes
  }
}

// MARK: - Equatable

extension MediaHash: Equatable {}

// MARK: - Hashable

extension MediaHash: Hashable {}

// MARK: - Codable

extension MediaHash: Codable {
  private enum CodingKeys: CodingKey {
    case text
    case attributes
  }

  public init(from decoder: any Decoder) throws {
    let container: KeyedDecodingContainer<MediaHash.CodingKeys> = try decoder.container(keyedBy: MediaHash.CodingKeys.self)

    text = try container.decodeIfPresent(String.self, forKey: MediaHash.CodingKeys.text)
    attributes = try container.decodeIfPresent(MediaHash.Attributes.self, forKey: MediaHash.CodingKeys.attributes)
  }

  public func encode(to encoder: any Encoder) throws {
    var container: KeyedEncodingContainer<MediaHash.CodingKeys> = encoder.container(keyedBy: MediaHash.CodingKeys.self)

    try container.encodeIfPresent(text, forKey: MediaHash.CodingKeys.text)
    try container.encodeIfPresent(attributes, forKey: MediaHash.CodingKeys.attributes)
  }
}
