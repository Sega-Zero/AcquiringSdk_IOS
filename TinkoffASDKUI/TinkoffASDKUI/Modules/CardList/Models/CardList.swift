//
//
//  CardList.swift
//
//  Copyright (c) 2021 Tinkoff Bank
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


import Foundation
import TinkoffASDKCore

struct CardList {
    struct Card {
        let id: String
        let pan: String
        let validThru: String
        let icon: UIImage?
    }

    struct Alert {
        let title: String
        let message: String?
        let icon: AcquiringAlertIconType
    }
}

// MARK: - Alerts Factory Methods

extension CardList.Alert {
    static func cardAdded(card: PaymentCard) -> CardList.Alert {
        CardList.Alert(
            title: "TinkoffAcquiring.alert.title.cardSuccessAdded".localized,
            message: "card id = \(card.cardId),\n\(card.pan) \(card.expDateFormat() ?? "")",
            icon: .success
        )
    }

    static func cardAddingFailed(with error: Error) -> CardList.Alert {
        CardList.Alert(
            title: "TinkoffAcquiring.alert.title.error".localized,
            message: error.localizedDescription,
            icon: .error
        )
    }
}
