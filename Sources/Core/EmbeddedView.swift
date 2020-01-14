//
//  EmbeddedView.swift
//  soshL
//
//  Created by Mike Lee on 1/17/19.
//  Copyright © 2019 RedemptionCreative.com. All rights reserved.
//

import UIKit

open class EmbeddedView: UIView {

    open var nibName: String? = nil

    public convenience init() {
        self.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _setup()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        loadViewFromNib()
    }

    open func loadViewFromNib() {
        if let nibName = nibName {
            let view = loadViewFromNib(named: nibName, owner: self)
            addSubview(view)
            let _ = view.constrainToSuperview()
        }
    }

    open func setup() { }

}

extension EmbeddedView {

    private func _setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }

    private func loadNib(named name: String, in bundle: Bundle? = nil) -> UINib {
        let bundle = bundle ?? Bundle.main
        return UINib(nibName: name, bundle: bundle)
    }

    private func loadView<T: UIView>(fromNib nib: UINib, owner: AnyObject? = nil) -> T {
        return nib.instantiate(withOwner: owner, options: nil)[0] as! T
    }

    private func loadViewFromNib<T: UIView>(named name: String, in bundle: Bundle? = nil, owner: AnyObject? = nil) -> T {
        let nib = loadNib(named: name, in: bundle)
        let view = loadView(fromNib: nib, owner: owner)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view as! T
    }

}
