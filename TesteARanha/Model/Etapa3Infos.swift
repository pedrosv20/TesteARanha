//
//  Etapa3Infos.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 30/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class Etapa3Infos {
    
    internal init(etapa3Title: String, etapa3SubTitle: String, etapa3Imagem: UIImage, isBlurred: Bool) {
        self.etapa3Title = etapa3Title
        self.etapa3SubTitle = etapa3SubTitle
        self.etapa3Imagem = etapa3Imagem
        self.isBlurred = isBlurred
        
    }
    
    var etapa3Title: String
    var etapa3SubTitle: String
    var etapa3Imagem: UIImage
    var isBlurred: Bool

}
