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
                    image: "spiderCartoon1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal3",
                    isBlurred: true
                )
            ]
            )
        )
        
        fobias.append(Fobia(
            tipoFobia: .agulha,
            icon: UIImage(named: "agulhaIcon")!,
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
                    image: "spiderCartoon1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal3",
                    isBlurred: true
                )
            ]
            )
        )
        
        fobias.append(Fobia(
            tipoFobia: .cobra,
            icon: UIImage(named: "snakeIcon")!,
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
                    image: "spiderCartoon1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal3",
                    isBlurred: true
                )
            ]
            )
        )
        
        fobias.append(Fobia(
            tipoFobia: .sapo,
            icon: UIImage(named: "frogIcon")!,
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
                    image: "spiderCartoon1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderCartoon3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderDraw3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Etapa Imagem",
                    description: "Etapa Imagem",
                    image: "spiderReal3",
                    isBlurred: true
                )
            ]
            )
        )
    }

}


