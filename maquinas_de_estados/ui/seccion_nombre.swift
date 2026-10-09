//
//  seccion_nombre.swift
//  maquina_de_estados
//
//  Created by alumno on 10/9/26.
//

import SwiftUI

struct SeccionNombre: View {
    @Environment(ControladorGeneral.self) var  controlador_tamagotchi
    
    @State var nombre_nuevo = ""
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                   
                    Text("Su nombre: ").fontWeight(.heavy)
                    Text("\(controlador_tamagotchi.tamagotchi.nombre)").padding()
                    VStack{
                        if(controlador_tamagotchi.tamagotchi.esta_vivo){
                            Circle().frame(width: 25).foregroundStyle(Color.green)
                            //Text("vivo").foregroundStyle(Color.green)
                        }else {
                            Circle().frame(width: 25).foregroundStyle(Color.red)
                            
                        }
                    }
                }.padding(8).background(Color.white).cornerRadius(5)
                
                
                TextField("Nombra tu tamagotchi", text: $nombre_nuevo).background().cornerRadius(10).padding()
                Button("cambiar nombre"){
                    //controlador_tamagotchi.tamagotchi.esta_vivo = true
                    controlador_tamagotchi.camiar_nombre(nombre_nuevo)
                }.frame(width: 150, height: 50).background(Color.gray).border(Color.gris, width: 2).foregroundStyle(Color.white).padding(10)
            }
            
        }.cornerRadius(50)
        
    }
}

#Preview {
    SeccionNombre().environment(ControladorGeneral())
}

