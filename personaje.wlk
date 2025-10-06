import wollok.game.*
import cultivos.*

object personaje {

	// ATRIBUTOS

	var property position = game.center()
	const property image = "fplayer.png"
	
	// ACCIONES

	method sembrarMaiz(){
		self.validarSiHayCultivo()
		const maiz = new Maiz()
		maiz.position(self.position())
		game.addVisual(maiz)
	}

	method sembrarTrigo(){
		self.validarSiHayCultivo()
		const trigo = new Trigo()
		trigo.position(self.position())
		game.addVisual(trigo)
	}

	method sembrarTomaco(){
		self.validarSiHayCultivo()
		const tomaco = new Tomaco()
		tomaco.position(self.position())
		game.addVisual(tomaco)
	}

	// VALIDACIONES

	method validarSiHayCultivo(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede sembrar acá")
		}
	}
}