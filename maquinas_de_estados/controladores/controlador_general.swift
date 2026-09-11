//
//  controlador_general.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//
import Foundation

@Observable ///
class ControladorGeneral{
    var tamagotchi: Tamagotchi
    
    var estado: EstadosTamagotchi = .Neutro
    
    init(tamagotchi_a_cargar: Tamagotchi? = nil){
        if let tamagotchi_a_cargar = tamagotchi_a_cargar{
            self.tamagotchi = tamagotchi_a_cargar
        }
        else{
            self.tamagotchi = Tamagotchi(nombre: "Fih", esta_vivo: true, edad: 0, hambre: 150, cansancio: 150, limpio: 50, aburrido: 50)
        }
    }
    
    func camiar_nombre(_ nombre_nuevo: String) -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.nombre = nombre_nuevo
        }
        
        return tamagotchi.esta_vivo
    }
    
    func matarlo() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.esta_vivo = false
            return true
        }
        return false
    }
    
    func revivirlo() -> Bool{
        if tamagotchi.esta_vivo == false{
            tamagotchi.esta_vivo = true
            return true
        }
        return false
    }
    
    func actualizar_medidores() ->  Bool{
        tamagotchi.hambre += 1
        tamagotchi.aburrido += 1
        tamagotchi.cansancio += 1
        
        tamagotchi.limpio -= 1
        
        actualizar_estado()
    
        return true
        
    }
    
    private func actualizar_estado() {
        switch(estado){
            case .Neutro:
                if tamagotchi.hambre > 60 {
                    estado = .Hambriento
                }
                else if tamagotchi.cansancio > 80 {
                    estado = .Adormilado
                }
            

            case .Hambriento:
                if tamagotchi.hambre > 80 {
                    estado = .Inanicion
                }
                else if tamagotchi.hambre < 40{
                    estado = .Neutro
                }
            
            case .Inanicion:
                if tamagotchi.hambre > 100 {
                    estado = .Muerto
                }
            
            default :
                return
        }
    }
    
    func alimentar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.hambre -= 20
            return true
        }
        
        return false
    }
}
