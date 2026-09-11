//
//  maquinas_de_estadosApp.swift
//  maquinas_de_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

@main
struct maquinas_de_estadosApp: App {
    @State var control: ControladorGeneral = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            PantallaInicial().environment(control)
        }
    }
}
