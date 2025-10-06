import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	
	// ACCIONES
	method sembrarMaiz(){
		// HACER VALIDACIÓN SI YA HAY UNA PLANTA
		const maiz = new Maiz()
		maiz.position(self.position())
		game.addVisual(maiz)
	}

	method sembrarTrigo(){
		const trigo = new Trigo()
		trigo.position(self.position())
		game.addVisual(trigo)
	}

	method sembrarTomaco(){
		const tomaco = new Tomaco()
		tomaco.position(self.position())
		game.addVisual(tomaco)
	}
}