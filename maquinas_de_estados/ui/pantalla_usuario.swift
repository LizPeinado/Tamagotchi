//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {
    @Environment(ControladorGeneral.self) var  controlador_tamagotchi
    
    @State var nombre_nuevo = ""
    
    @State var vivo: String = "no"
    
    var body: some View {
        //matarlo
        //revivirlo
       
        Text("Lo revivimos: \(vivo)")
        /*Button("matar"){
            controlador_tamagotchi.matarlo()
            vivo = "no"
        }*/
        
        Text("Su nombre: \(controlador_tamagotchi.tamagotchi.nombre)")
        //Text("Esta vivo: \(controlador_tamagotchi.tamagotchi.esta_vivo)")
        
        Text("Hambre Actual: \(controlador_tamagotchi.tamagotchi.hambre)")
        Text("Cansancio: \(controlador_tamagotchi.tamagotchi.cansancio)")
        Text("Limpio: \(controlador_tamagotchi.tamagotchi.limpio)")
        Text("Edad: \(controlador_tamagotchi.tamagotchi.edad)")
        
        MascotaEstado()

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
                controlador_tamagotchi.revivirlo()
                vivo = "si"
            }
        }
        
        Button("Actualizar tamagotchi"){
            controlador_tamagotchi.actualizar_medidores()
        }
        
        Button("Alimentar"){
            controlador_tamagotchi.alimentar()
        }
    }
}

#Preview {
    PantallaInicial().environment(ControladorGeneral())
}
