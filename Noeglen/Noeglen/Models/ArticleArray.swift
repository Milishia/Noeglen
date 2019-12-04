//
//  ArticleArray.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 02/12/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation

struct ArticleArray {
    var articles: [Article] = [
        Article(title: "Psykiatrifonden",
                description: "PÅ PSYKIATRIFONDENS HJEMMESIDE KAN DU FÅ MERE INFORMATION OM STRESS, DEPRESSION OG ANGST. DU KAN OGSÅ BESTILLE BØGER OG TILMELDE DIG FOREDRAG OG KURSER OM EMNET. DU KAN FÅ ANONYM PROFESSIONEL RÅDGIVNING I PSYKIATRIFONDENS TELEFONRÅDGIVNING PÅ TLF. ‪3925 2525.",
                url: "https://www.psykiatrifonden.dk",
                image: "psykiatrifonden logo"),
        Article(title: "Sundhed.dk",
                description: "SUNDHED.DK ER DET OFFENTLIGE SUNDHEDSVÆSENS PORTAL. HER KAN DU FINDE INFORMATION OG VEJLEDNINGER TIL PATIENTER OG LÆGER. DU KAN KONTAKTE SUPPORTEN PÅ TELEFON ‪35 29 83 10 I DAGTIMERNE.",
                url: "https://www.sundhed.dk",
                image: "sundhed-logo")
    ]
}
