//
//  FriendModel.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/19/24.
//

import UIKit

struct Friend: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let talk: String
    let image: UIImage
}
let talkList: [Friend] = [
    Friend(name: "Hue", talk: "왜요? 요즘 코딩이 대세인데", image: UIImage(systemName: "figure.hiking")!),
    Friend(name: "Jack", talk: "깃허브 푸쉬 해주세요", image: UIImage(systemName: "sun.horizon.fill")!),
    Friend(name: "Bran", talk: "과제 파이팅!", image: UIImage(systemName: "moon.stars")!),
    Friend(name: "Den", talk: "벌써 퇴근하시나여?ㅎㅎ", image: UIImage(systemName: "star.square")!),
    Friend(name: "친구", talk: "술 한잔 고?", image: UIImage(systemName: "person.circle")!),
    Friend(name: "카카오톡", talk: "[PC버전 자동 로그인]", image: UIImage(systemName: "person.circle")!)

]