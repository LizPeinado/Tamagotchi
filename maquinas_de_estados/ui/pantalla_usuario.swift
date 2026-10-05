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
       
        //Text("Lo revivimos: \(vivo)")
        /*Button("matar"){
            controlador_tamagotchi.matarlo()
            vivo = "no"
        }*/
        
        Text("Su nombre: \(controlador_tamagotchi.tamagotchi.nombre)")
        
        TextField("Place holder: Nombre de tu tamagotchi", text: $nombre_nuevo)
        Button("cambiar nombre"){
            //controlador_tamagotchi.tamagotchi.esta_vivo = true
            controlador_tamagotchi.camiar_nombre(nombre_nuevo)
        }
        
        //Text("Edad: \(controlador_tamagotchi.tamagotchi.edad)")
        //Text("Esta vivo: \(controlador_tamagotchi.tamagotchi.esta_vivo)")
        
        HStack(){
            Text("Hambre: \(controlador_tamagotchi.tamagotchi.hambre)")
            Text("Cansancio: \(controlador_tamagotchi.tamagotchi.cansancio)")
            Text("Aburrimiento: \(controlador_tamagotchi.tamagotchi.aburrido)")
        }
        
        MascotaEstado()

        if(controlador_tamagotchi.tamagotchi.esta_vivo){
            Text("Tu tamagotchi esta vivo")
        }else {
            Text("Esta muerto :(")
        }
        
        
        Button("Actualizar tamagotchi"){
            controlador_tamagotchi.actualizar_medidores()
        }
        
        HStack{
            /*Button("Dale con la pala"){
                controlador_tamagotchi.matarlo()
                vivo = "no"
            }*/
            Button("Pasear"){
                controlador_tamagotchi.pasear()
            }
            
            Spacer()
            
            Button("Alimentar"){
                controlador_tamagotchi.alimentar()
            }
            
            Spacer()
            
            Button("Dormir"){
                controlador_tamagotchi.dormir()
            }
        }
        
        Button("Resuitar") {
            controlador_tamagotchi.revivirlo()
            vivo = "si"
        }
        
        Button("Darle un dulce"){
            controlador_tamagotchi.procesar_comando(ComandosTamagotchi.darle_un_dulce)
            
            
        }
    }
}

#Preview {
    PantallaInicial().environment(ControladorGeneral())
}
