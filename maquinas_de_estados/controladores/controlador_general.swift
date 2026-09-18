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
            self.tamagotchi = Tamagotchi(nombre: "Fih", esta_vivo: true, edad: 0, hambre: 0, cansancio: 0, aburrido: 0)
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
    
    /*
     
     func revivirlo() -> Bool{
        if tamagotchi.esta_vivo == false{
            tamagotchi.esta_vivo = true
            return true
        }
        return false
    }
     
    */
    
    func actualizar_medidores() ->  Bool{
        tamagotchi.hambre += 1
        tamagotchi.aburrido += 1
        tamagotchi.cansancio += 1
        
        actualizar_estado()
        return true
    }
    
    private func actualizar_estado() {
        switch(estado){
            case.Feliz:
                if tamagotchi.hambre == 0 || tamagotchi.cansancio == 0 || tamagotchi.aburrido == 40 {
                    estado = .Feliz
                }
            case .Neutro:
                if tamagotchi.hambre > 40 || tamagotchi.cansancio > 40 || tamagotchi.aburrido > 40 {
                    estado = .Neutro
                }
            case .Comiendo:
                if tamagotchi.hambre > 80 {
                    estado = .Enojado
                }
                else if tamagotchi.hambre < 40{
                    estado = .Neutro
                }
            case .Enojado:
                if tamagotchi.hambre > 55 || tamagotchi.cansancio > 55 || tamagotchi.aburrido > 55 {
                    estado = .Enojado
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
    
    //---------------------------------------------------------------------------------------------------------
    func dormir() -> Bool{
        if tamagotchi.esta_vivo{
                return true
        }
        return false
    }
    
    func feliz() -> Bool{
        if tamagotchi.esta_vivo{
                return true
        }
        return false
    }
    
    func enojado() -> Bool{
        if tamagotchi.esta_vivo{
                return true
        }
        return false
    }
    
    func entretener() -> Bool{
        if tamagotchi.esta_vivo{
                return true
        }
        return false
    }
    //---------------------------------------------------------------------------------------------------------
}
