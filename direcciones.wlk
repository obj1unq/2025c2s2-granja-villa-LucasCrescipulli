import wollok.game.*
import mercados.*
import randomizer.*

object norte{
    method position(position){
        return position.up(1)
    }
}

object sur{
    method position(position){
        return position.down(1)
    }
}

object este{
    method position(position){
        return position.right(1)
    }
}

object oeste{
    method position(position){
        return position.left(1)
    }
}

object noreste{
    method position(position){
        return position.up(1).right(1)
    }
}

object sureste{
    method position(position){
        return position.down(1).right(1)
    }
}

object suroeste{
    method position(position){
        return position.down(1).left(1)
    }
}

object noroeste{
    method position(position){
        return position.up(1).left(1)
    }
}

object gestorPosiciones{

    var mercadosEnElTablero = []

    method mercadosEnElTablero(){
        return 
    }

    method direcciones(){
        // retorna un set con todas las direcciones lindantes (ortogonales y diagonales)
        return #{norte, este, sur, oeste, noreste, sureste, suroeste, noroeste}
    }

    method lindantes(position){
        // retorna un set con los positions (game.at(x,y)) específicos de las lindantes
        return self.direcciones().map({direccion => direccion.position(position)})
    }

    method hayPlantaEn(position){
        /*  Retorna un booleano para determinar si hay una planta en la posición dada.
            Primero se obtienen los objetos de una posición, para luego filtrarlos en función de si
            alguno es una planta. Si esa colección está vacía, entonces se la niega para concluir QUE SÍ. */

        return not game.getObjectsIn(position).filter({objeto => objeto.esPlanta()}).isEmpty()
    }

    method lindantesConPlantas(position){
        // retorna un set con las posiciones lindantes en las cuales hay una planta
        return self.lindantes(position).filter({posicion => self.hayPlantaEn(posicion)})
    }

    method plantasEn(position){
        /*  retorna un set con las instancias específicas de plantas que hay en las posiciones lindantes.
            el flatten es necesario para reducir una lista de listas a una colección con las instancias */
        
        return self.lindantesConPlantas(position).map({posicion => game.getObjectsIn(posicion)}).flatten()
    }

    method crearMercados(cantidad){
        var mercadosPendientes = cantidad
        if (mercadosPendientes != 0){
            mercadoFactory.crear()
            mercadosPendientes -= 1
            self.crearMercados(mercadosPendientes)
        }
    }

    method hayMercadoEn(position){
        return 
    }
}
