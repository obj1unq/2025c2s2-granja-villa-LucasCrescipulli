import wollok.game.*
import randomizer.*

class Mercado{
    var property position = game.at(1,1)
    var property oro = 0
    var property mercaderia = []

    method image(){
        return "market.png"
    }
}

object mercadoFactory{
    const mercados = []
    method crear(){
        const mercado = new Mercado(position = randomizer.emptyPosition())
        mercados.add(mercado)
    }
}