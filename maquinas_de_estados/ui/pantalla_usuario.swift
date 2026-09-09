//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {
    @State var  controlador_tamagotchi: ControladorGeneral = ControladorGeneral()
    
    @State var nombre_nuevo = ""
    
    @State var vivo: String = "no"
    
    var body: some View {
        //matarlo
        //revivirlo
        Button("revivir"){
            controlador_tamagotchi.revivirlo()
            vivo = "si"
        }
        Text("Lo revivimos: \(vivo)")
        /*Button("matar"){
            controlador_tamagotchi.matarlo()
            vivo = "no"
        }*/
        
        Text("Su nombre: \(controlador_tamagotchi.tamagotchi.nombre)")
        //Text("Esta vivo: \(controlador_tamagotchi.tamagotchi.esta_vivo)")
        
        if(controlador_tamagotchi.tamagotchi.esta_vivo){
            Text("Tu tamagotchi esta vivo")
        }else {
            Text("Esta muerto :(")
        }
        
        TextField("Place holder: Nombre de tu tamagotchi", text: $nombre_nuevo)
        Button("cambiar nombre"){
            //controlador_tamagotchi.tamagotchi.esta_vivo = true
            controlador_tamagotchi.camiar_nombre(nombre_nuevo)
        }
        
        HStack{
            Button("Dale con la pala"){
                controlador_tamagotchi.matarlo()
                vivo = "no"
            }
            
            Spacer()
            
            Button("Resuitar") {
                
            }
        }
    }
}

#Preview {
    PantallaInicial()
}
