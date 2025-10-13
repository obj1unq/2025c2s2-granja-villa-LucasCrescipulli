import wollok.game.*

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

    method direcciones(){
        return #{norte, este, sur, oeste, noreste, sureste, suroeste, noroeste}
    }

    method lindantes(position){
        return self.direcciones().map({direccion => direccion.position(position)})
    }

    method lindantesConPlantas(position){
        return self.lindantes(position).filter({posicion => self.hayPlantaEn(posicion)})
    }

    method hayPlantaEn(position){
        return not game.getObjectsIn(position).filter({objeto => objeto.esPlanta()}).isEmpty()
    }

    method plantasEn(position){
        return self.lindantesConPlantas(position).map({posicion => game.getObjectsIn(posicion)}).flatten()
    }
}
