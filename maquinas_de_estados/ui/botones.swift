//
//  botones.swift
//  maquina_de_estados
//
//  Created by alumno on 10/9/26.
//

import SwiftUI

struct PantallaBotones: View {
    @Environment(ControladorGeneral.self) var  controlador_tamagotchi
    @State var vivo: String = "no"
    
    var body: some View {
        
        
        
        ZStack{
            Color.gray.ignoresSafeArea()
            
            VStack{
                Button("Actualizar tamagotchi"){
                    controlador_tamagotchi.actualizar_medidores()
                }.foregroundStyle(Color.white).padding().fontWeight(.heavy)
        
                HStack{
                    /*Button("Dale con la pala"){
                     controlador_tamagotchi.matarlo()
                     vivo = "no"
                     }*/
                    Button("Pasear"){
                        controlador_tamagotchi.pasear()
                    }.frame(width: 80, height: 50).background(Color.gray).border(Color.gris, width: 2).foregroundStyle(Color.white)

                    Spacer()
                    
                    Button("Alimentar"){
                        controlador_tamagotchi.alimentar()
                    }.frame(width: 80, height: 50).background(Color.gray).border(Color.gris, width: 2).foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    Button("Dormir"){
                        controlador_tamagotchi.dormir()
                    }.frame(width: 80, height: 50).background(Color.gray).border(Color.gris, width: 2).foregroundStyle(Color.white)
                    Spacer()
                    
                    Button("Resuitar") {
                        controlador_tamagotchi.revivirlo()
                        vivo = "si"
                    }.frame(width: 80, height: 50).background(Color.gray).border(Color.gris, width: 2).foregroundStyle(Color.white).fontWidth(.expanded)
                    
                }.padding(10)

                HStack{
                    Button("Darle un dulce"){
                        controlador_tamagotchi.procesar_comando(ComandosTamagotchi.darle_un_dulce)
                    }.foregroundStyle(Color.white).background(Color.gray    ).fontWeight(.heavy)
                    Spacer()
                    Button("Jugar"){
                        controlador_tamagotchi.procesar_comando(ComandosTamagotchi.jugar)
                    }.foregroundStyle(Color.white).background(Color.gray    ).fontWeight(.heavy)
                }.padding()
                
            }
        }.cornerRadius(50)
    }
}

    #Preview {
        PantallaBotones().environment(ControladorGeneral())
    }
