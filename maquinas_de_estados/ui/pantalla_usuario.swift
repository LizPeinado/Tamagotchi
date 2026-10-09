//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {
    @Environment(ControladorGeneral.self) var  controlador_tamagotchi
    
    
    var body: some View {
        //matarlo
        //revivirlo
       
        //Text("Lo revivimos: \(vivo)")
        /*Button("matar"){
            controlador_tamagotchi.matarlo()
            vivo = "no"
        }*/
        ZStack{
            Image("fondo").resizable().scaledToFill().ignoresSafeArea().frame(width: 100, height: 600)
            VStack{
                SeccionNombre()
                  
                  //Text("Edad: \(controlador_tamagotchi.tamagotchi.edad)")
                  //Text("Esta vivo: \(controlador_tamagotchi.tamagotchi.esta_vivo)")
                  
                  HStack(){
                      Text("🍅   \(controlador_tamagotchi.tamagotchi.hambre)").shadow(color: Color.blue, radius: 10)
                      Text("💤   \(controlador_tamagotchi.tamagotchi.cansancio)").shadow(color: Color.blue, radius: 10)
                      Text("🥱   \(controlador_tamagotchi.tamagotchi.aburrido)").shadow(color: Color.blue, radius: 10)
                  }.padding(12).background(Color.azul).cornerRadius(100).fontWeight(.heavy)
                  
                  MascotaEstado()
                  PantallaBotones()
            }
        }
        
    }
}

#Preview {
    PantallaInicial().environment(ControladorGeneral())
}
