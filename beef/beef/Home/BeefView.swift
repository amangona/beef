//
//  BeefView.swift
//  beef
//
//  Created by abe on 5/25/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct BeefView: View {
    var viewModel: BeefViewModel?
    var body: some View {
        Text("Hello world")
    }
}

struct BeefView_Previews: PreviewProvider {
    static var previews: some View {
        BeefView(viewModel: BeefViewModel(beef: Beef.sample))
    }
}
