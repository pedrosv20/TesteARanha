//
//  Model.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 16/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class Model {
    static let shared = Model()
    var fobias = [Fobia]()
    
    private init() {
        fobias.append(Fobia(
            tipoFobia: .aranha,
            backgroundIcon: UIImage(named: "cardSpider")!,
            icon: UIImage(named: "aranhaIcon")!,
            stageOne: [
                StageOne(
                    text: "Etapa Texto",
                    title: "Etapa Texto"
                ),
                StageOne(
                    text: "Etapa texto",
                    title: "Etapa Texto"
                )
            ],
            stageTwo: [
                StageTwo(
                    audioDescription: "Etapa Áudio 1",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "night-at-the-club.mp3"
                )
            ],
            stageThree: [
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem")
            ])
        )
        
        fobias.append(Fobia(
            tipoFobia: .agulha,
            backgroundIcon: UIImage(named: "needleCard")!,
            icon: UIImage(named: "aranhaIcon")!,
            stageOne: [
                StageOne(
                    text: "Etapa Texto",
                    title: "Etapa Texto"
                ),
                StageOne(
                    text: "Etapa texto",
                    title: "Etapa Texto"
                )
            ],
            stageTwo: [
                StageTwo(
                    audioDescription: "Etapa Áudio 1",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "night-at-the-club.mp3"
                )
            ],
            stageThree: [
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "frogIcon.png"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "frogIcon.png"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "frogIcon.png")
            ])
        )
        
        fobias.append(Fobia(
            tipoFobia: .cobra,
            backgroundIcon: UIImage(named: "snakeCard")!,
            icon: UIImage(named: "aranhaIcon")!,
            stageOne: [
                StageOne(
                    text: "Etapa Texto",
                    title: "Etapa Texto"
                ),
                StageOne(
                    text: "Etapa texto",
                    title: "Etapa Texto"
                )
            ],
            stageTwo: [
                StageTwo(
                    audioDescription: "Etapa Áudio 1",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "night-at-the-club.mp3"
                )
            ],
            stageThree: [
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem")
            ])
        )
        
        fobias.append(Fobia(
            tipoFobia: .sapo,
            backgroundIcon: UIImage(named: "frogCard")!,
            icon: UIImage(named: "aranhaIcon")!,
            stageOne: [
                StageOne(
                    text: "Etapa Texto",
                    title: "Etapa Texto"
                ),
                StageOne(
                    text: "Etapa texto",
                    title: "Etapa Texto"
                )
            ],
            stageTwo: [
                StageTwo(
                    audioDescription: "Etapa Áudio 1",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "night-at-the-club.mp3"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "night-at-the-club.mp3"
                )
            ],
            stageThree: [
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem"
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "imagem")
            ])
        )
    }

}


