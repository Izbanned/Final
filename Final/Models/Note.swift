//
//  Note.swift
//  Final
//
//  Created by Dias Karimov on 21.05.2022.
//

import Foundation
import RealmSwift

class Note: Object {
    @Persisted var title: String = ""
}
