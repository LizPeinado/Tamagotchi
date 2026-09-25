//
//  mascota_estado_panttalla.swift
//  maquina_de_estados
//
//  Created by alumno on 9/11/26.
//
import SwiftUI

struct MascotaEstado: View {
    @Environment(ControladorGeneral.self) var mascota
    enum EstadosTamagotchi{
        case Feliz
        case Neutro
        case Aburrido
        case Enojado
        case Comiendo
        case Dormido
        case Muerto
        case Paseando
    }
    var body: some View {
        switch mascota.estado {
            case .Neutro:
                Rectangle().foregroundStyle(Color.gray)
            
            case .Feliz:
                Rectangle().foregroundStyle(Color.green)
            
            case .Aburrido:
                    Rectangle().foregroundStyle(Color.purple)
            
            case .Enojado:
                Rectangle().foregroundStyle(Color.red)
            
            case .Comiendo:
                Rectangle().foregroundStyle(Color.orange)
            
            case .Dormido:
                Rectangle().foregroundStyle(Color.black)

            case .Muerto:
                Text("ESTA MUERTOOOOO").fontWidth(.expanded).fontWeight(.heavy)
            
        case .Paseando:
            Rectangle().foregroundStyle(Color.brown)
            
            default :
                Text("Nose")
        }
        Text("El estado de tu mascota es: \(mascota.estado)")
    }
}

#Preview {
    MascotaEstado().environment(ControladorGeneral())
}

