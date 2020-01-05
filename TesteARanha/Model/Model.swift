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
    var nomePessoa: String {
        didSet {
            UserDefaults.standard.set(self.nomePessoa, forKey: "nome")
        }
    }
    
    var appleWatch = false
    
    var progresso = [
        "Nível 1" : [0.0, 0.0, 0.0, 0.0],
        "Nível 2" : [0.0, 0.0, 0.0, 0.0],
        "Nível 3" : [0.0, 0.0, 0.0, 0.0],
        "Nível 4" : [0.0, 0.0, 0.0, 0.0]
    ]
    
    func changeLevelLastProgress(level: Int, start: Double, pike: Double, end: Double, time: Double) {
        progresso["Nível " + level.description] = [start, pike, end, time]
    }
    
    func setNome(_ nome: String) {
        nomePessoa = nome
    }
    
    private init() {
        nomePessoa = UserDefaults.standard.string(forKey: "nome") ?? "você!"
        
        fobias.append(Fobia(
            tipoFobia: .aranha,
            icon: UIImage(named: "aranhaIcon")!,
            stageOne: [
                StageOne(
                    text: "Como é o corpo das aranhas?",
                    title: "As aranhas possuem pequenas estruturas chamadas de fiandeiras, que, em contato com o ar, produzem fios de teia. Seu corpo é composto de cefalotórax e abdome. É chamado de cefalotórax pois a cabeça é fundida ao tórax. É no cefalotórax também que se encontram as quelíceras, capazes de injetar veneno."
                ),
                StageOne(
                    text: "O que elas fazem?",
                    title: "Elas utilizam as teias para fazer seu casulo e para servir de armadilha aos animais que usa de alimento, como moscas. Existem aproximadamente 40 mil espécies de aranhas no mundo mas podemos citar 4 delas como responsáveis por colocar medo e estigmatizar as aranhas de um modo assustador."
                ),
                StageOne(
                    text: "Quem são elas?",
                    title: "Aranha armadeira, aranha marrom, tarântula e viúva-negra."
                ),
                StageOne(text: "Por que isso aconteceu?", title: "Porque essas aranhas foram as que mais estiveram envolvidas em acidentes com humanos. Sua aparência não é convidativa, as formas pouco arredondadas e flexíveis, ao contrário de um cachorrinho, não nos fazem gostar assim, à primeira vista."
                ),
                StageOne(text: "Então por que atacam?", title: "Devemos lembrar que as aranhas se alimentam de insetos e possuem veneno para sua proteção. Quando se sentem ameaçadas, picam.")
            ],
            stageTwo: [
                StageTwo(
                    audioDescription: "Etapa Áudio 1",
                    audio: "audio_F_EN.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "audio_F_EN 2.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "audio_F_EN 3.wav"
                )
            ],
            stageThree: [
                StageThree(
                    title: "Imagem Estilo Cartoon",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderCartoon1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Cartoon",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderCartoon2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Cartoon",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderCartoon3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Desenho",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderDraw1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Desenho",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderDraw2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Desenho",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderDraw3",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Fotografia",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderReal1",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Fotografia",
                    description: "Toque na quadrado para revelar a imagem.",
                    image: "spiderReal2",
                    isBlurred: true
                ),
                StageThree(
                    title: "Imagem Estilo Fotografia",
                    description: "Toque na quadrado para revelar a imagem.",
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
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "audio_F_EN 3.wav"
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
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "audio_F_EN 3.wav"
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
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 2",
                    audio: "audio_F_EN 3.wav"
                ),
                StageTwo(
                    audioDescription: "Etapa Áudio 3",
                    audio: "audio_F_EN 3.wav"
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


