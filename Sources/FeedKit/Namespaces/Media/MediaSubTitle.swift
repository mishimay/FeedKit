//
// MediaSubTitle.swift
//
// Copyright (c) 2016 - 2025 Nuno Dias
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import XMLKit

public struct MediaSubTitleAttributes: Codable, Equatable, Hashable, Sendable {
  // MARK: Lifecycle

  public init(
    type: String? = nil,
    lang: String? = nil,
    href: String? = nil
  ) {
    self.type = type
    self.lang = lang
    self.href = href
  }

  // MARK: Public

  /// The type of the subtitle.
  public var type: String?

  /// The subtitle language based on the RFC 3066.
  public var lang: String?

  /// The location of the subtitle.
  public var href: String?
}

/// Optional link to specify the machine-readable license associated with the
/// content.
public typealias MediaSubTitle = XMLAttributesElement<MediaSubTitleAttributes>
