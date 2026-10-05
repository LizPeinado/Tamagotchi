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
    
    var estado: EstadosTamagotchi = .Feliz
    
    init(tamagotchi_a_cargar: Tamagotchi? = nil){
        if let tamagotchi_a_cargar = tamagotchi_a_cargar{
            self.tamagotchi = tamagotchi_a_cargar
        }
        else{
            self.tamagotchi = Tamagotchi(nombre: "Fih", esta_vivo: true, edad: 0, hambre: 0, cansancio: 0, aburrido: 0)
        }
    }
    
    func camiar_nombre(_ nombre_nuevo: String) -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.nombre = nombre_nuevo
            return true
        }
        
        return false
    }
    
    func matarlo() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.esta_vivo = false
            estado = .Muerto
            
            return true
        }
        
        return false
    }
     
     func revivirlo() -> Bool{
        if tamagotchi.esta_vivo == false{
            tamagotchi.esta_vivo = true
            estado = .Neutro
            
            return true
        }
        return false
    }
     
    
    func actualizar_medidores() ->  Bool{
        if tamagotchi.esta_vivo == false{
            return false
        }
        
        tamagotchi.hambre += 10
        tamagotchi.aburrido += 10
        tamagotchi.cansancio += 10
        
        actualizar_estado()
        return true
    }
    
    private func actualizar_estado() {
        if tamagotchi.esta_vivo == false{
            estado = .Muerto
            return
        }
        
        if tamagotchi.hambre <= 40 && tamagotchi.cansancio <= 40 {
            estado = .Feliz
        }
        else if ((tamagotchi.hambre >= 41 || tamagotchi.cansancio >= 41) && (tamagotchi.hambre == 59 || tamagotchi.cansancio == 59)){
            estado = .Neutro
        }
        else if (tamagotchi.hambre >= 100 || tamagotchi.cansancio >= 100){
            estado = .Muerto
            tamagotchi.esta_vivo = false
        }
        else if tamagotchi.aburrido >= 41 && tamagotchi.aburrido <= 60{
            estado = .Aburrido
        }
        else if ((tamagotchi.hambre >= 60 || tamagotchi.cansancio >= 60 || tamagotchi.aburrido >= 60) && (tamagotchi.hambre <= 95 || tamagotchi.cansancio <= 95 || tamagotchi.aburrido <= 95)){
            estado = .Enojado
        }
        /*else if tamagotchi.hambre > 95 && tamagotchi.hambre <= 100{
            estado = .Comiendo
        }*/
        /*else if tamagotchi.cansancio > 95 && tamagotchi.cansancio <= 100{
            estado = .Dormido
        }*/
        /*else if tamagotchi.aburrido > 95 && tamagotchi.aburrido <= 100{
            estado = .Paseando
        }*/
        
    }
    
    //-----------------------------------------------------------------------------------------------------
    func alimentar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.hambre -= 20
            
            if tamagotchi.hambre < 0 {
                tamagotchi.hambre = 0
            }
            
            estado = .Comiendo
            
            return true
        }
        
        return false
    }
    
    func dormir() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.cansancio -= 20
            
            if tamagotchi.cansancio < 0 {
                tamagotchi.cansancio = 0
            }
            
            estado = .Dormido
            
            return true
        }
        return false
    }
    
    func feliz() -> Bool{
        if tamagotchi.esta_vivo{
            estado = .Feliz
            return true
        }
        return false
    }
    
    func enojado() -> Bool{
        if tamagotchi.esta_vivo{
            estado = .Enojado
            return true
        }
        return false
    }
    
    func pasear() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.aburrido -= 20
            
            if tamagotchi.aburrido < 0 {
                tamagotchi.aburrido = 0
            }
            
            estado = .Paseando
                return true
        }
        return false
    }
    //---------------------------------------------------------------------------------------------------------
}
