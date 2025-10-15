import wollok.game.*
import randomizer.*

class Mercado{
    var property position = game.at(1,1)
    var oro = 0
    const mercaderia = []

    method image(){
        return "market.png"
    }

    method oro(_oro){
        oro += _oro
    }

    method oro(){
        return oro
    }

    method mercaderia(_mercaderia){
        mercaderia.addAll(_mercaderia)
    }

    method esPlanta(){
        return false
    }

    method esMercado(){
        return true
    }
}

object mercadoFactory{
    const mercados = []
    method crear(){
        const mercado = new Mercado(position = randomizer.emptyPosition())
        game.addVisual(mercado)
        mercados.add(mercado)
    }
}