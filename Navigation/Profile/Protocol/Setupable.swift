//
//  b.swift
//  Navigation
//
//  Created by Юлия Корнишина on 03.04.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
