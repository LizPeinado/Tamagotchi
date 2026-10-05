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
                //Rectangle().foregroundStyle(Color.gray)
            Image("Neutro").resizable().scaledToFit().frame(width: 300, height: 300)
            case .Feliz:
                //Rectangle().foregroundStyle(Color.green)
            Image("Feliz").resizable().scaledToFit().frame(width: 300, height: 300)
            
            case .Aburrido:
                    //Rectangle().foregroundStyle(Color.purple)
                Image("Neutro").resizable().scaledToFit().frame(width: 300, height: 300)
            
            case .Enojado:
                //Rectangle().foregroundStyle(Color.red)
                Image("Enojado").resizable().scaledToFit().frame(width: 300, height: 300)
            
            case .Comiendo:
                Image("Comer").resizable().scaledToFit().frame(width: 300, height: 300)

            case .Muerto:
            Image("Muerto").resizable().scaledToFit().frame(width: 300, height: 300)
                Text("ESTA MUERTOOOOO").fontWidth(.expanded).fontWeight(.heavy)
            
            case .Dormido:
                //Rectangle().foregroundStyle(Color.black)
                Image("Dormir").resizable().scaledToFit().frame(width: 300, height: 300)
            
            case .Paseando:
                //Rectangle().foregroundStyle(Color.brown)
                Image("Pasear").resizable().scaledToFit().frame(width: 300, height: 300)
            
            default :
                Text("Nose")
        }
        Text("El estado de tu mascota es: \(mascota.estado)")
    }
}

#Preview {
    MascotaEstado().environment(ControladorGeneral())
}

