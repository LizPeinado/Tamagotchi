//
//  controlador+comandos.swift
//  maquina_de_estados
//
//  Created by alumno on 9/18/26.

// con extensions solo permite crear funciones, no variables
import ARKit

//los protocol son las intrfaces de swift


enum ComandosTamagotchi: Comando {
    case darle_un_dulce
    case jugar
}

extension ControladorGeneral {

    
    func procesar_comando(_ comando: Comando) -> Bool{
        var tamagotchi: Tamagotchi
        
        if (!(comando is ComandosTamagotchi)) {
            return false
        }
        
        switch (comando as! ComandosTamagotchi) {
            case.darle_un_dulce:
                alimentar()
                feliz()
            case .jugar:
                actualizar_medidores()
                pasear()
        }
        return true
    }
}

