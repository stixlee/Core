//
//  UIView+Layout.swift
//  Core
//
//  Created by Michael Lee on 12/30/19.
//

import UIKit

// Extension for constraining a view to another view (with insets, if provided)
public extension UIView {

  // Constrain the view to its superview (with insets, if provided).  Activate if specified
  @discardableResult
  func constrainToSuperview(active: Bool = true, insets: UIEdgeInsets = UIEdgeInsets.zero, identifier: String? = nil) -> [NSLayoutConstraint] {
      guard let superview = superview else { return [] }
      return constrain(toView: superview, active: active, insets: insets, identifier: identifier)
  }

  // Constrain the view to the specified view (with insets, if provided). Activate if specified
  @discardableResult
  func constrain(toView view: UIView, active: Bool = true, insets: UIEdgeInsets = UIEdgeInsets.zero, identifier: String? = nil) -> [NSLayoutConstraint] {
    guard #available(iOS 9.0, *) else { return [] }
    let leadingConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor)
    leadingConstraint.constant = insets.left
    leadingConstraint.identifier = "\(identifier ?? "")Leading"
    let trailingConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor)
    trailingConstraint.constant = -insets.right
    trailingConstraint.identifier = "\(identifier ?? "")Trailing"
    let topConstraint = topAnchor.constraint(equalTo: view.topAnchor)
    topConstraint.constant = insets.top
    topConstraint.identifier = "\(identifier ?? "")Top"
    let bottomConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor)
    bottomConstraint.constant = -insets.bottom
    bottomConstraint.identifier = "\(identifier ?? "")Bottom"

    let constraints = [
        leadingConstraint,
        trailingConstraint,
        topConstraint,
        bottomConstraint
    ]
    if active {
        NSLayoutConstraint.activate(constraints)
    }
    return constraints

  }
}
