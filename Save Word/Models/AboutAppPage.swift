//
//  AboutAppPage.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 1/8/23.
//

import Foundation

struct AboutAppPage {
    let imageName: String
    let headerText: String
    let bodyText: String
}

extension AboutAppPage {
    static let data: [AboutAppPage] = [
        AboutAppPage(imageName: "AboutAppImage1", headerText: "Creating your word lists", bodyText: "The first step is to build your very own word lists. By doing so, you'll have the chance to focus on the words that genuinely interest you or those that are relevant to your studies or profession. These lists will be your personal toolkit for learning and growth."),
        AboutAppPage(imageName: "AboutAppImage2", headerText: "Expand your vocabulary with Quiz Games", bodyText: "With our flexible study approach and fun Quiz game, you can now make the process of language acquisition more enjoyable and effective."),
        AboutAppPage(imageName: "AboutAppImage3", headerText: "The Power of Listening", bodyText: "Listening attentively is the first step in honing your pronunciation. The audio assistant is here to guide you with accurate pronunciation and enunciation. Pay close attention to how each word is pronounced, focusing on the sounds, stress, and rhythm."),
        AboutAppPage(imageName: "", headerText: "", bodyText: "")
    ]
}


