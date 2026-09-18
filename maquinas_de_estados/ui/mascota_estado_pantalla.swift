//
//  mascota_estado_panttalla.swift
//  maquina_de_estados
//
//  Created by alumno on 9/11/26.
//
import SwiftUI

struct MascotaEstado: View {
    @Environment(ControladorGeneral.self) var mascota
    
    var body: some View {
        switch mascota.estado {
            case .Neutro:
                Rectangle().foregroundStyle(Color.gray)
            
            case .Hambriento:
                Rectangle().foregroundStyle(Color.orange)
            
            case .Muerto:
                Text("ESTA MUERTOOOOO").fontWidth(.expanded).fontWeight(.heavy)
            
            default :
                Text("Nose")
        }
        Text("El estado de tu mascota es: \(mascota.estado)")
    }
}

#Preview {
    MascotaEstado().environment(ControladorGeneral())
}

