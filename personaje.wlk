import wollok.game.*
import cultivos.*

object personaje {

	// ATRIBUTOS

	var property position = game.center()
	const property image = "fplayer.png"
	
	// ACCIONES

	method sembrarMaiz(){
		self.validarSiSePuedeSembrar()
		const maiz = new Maiz()
		maiz.position(self.position())
		game.addVisual(maiz)
	}

	method sembrarTrigo(){
		self.validarSiSePuedeSembrar()
		const trigo = new Trigo()
		trigo.position(self.position())
		game.addVisual(trigo)
	}

	method sembrarTomaco(){
		self.validarSiSePuedeSembrar()
		const tomaco = new Tomaco()
		tomaco.position(self.position())
		game.addVisual(tomaco)
	}

	method regarPlanta(){
		self.validarSiHayPlantaParaRegar()
		const planta = game.uniqueCollider(self)
		planta.crecer()
	}

	// VALIDACIONES

	method validarSiSePuedeSembrar(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede sembrar acá")
		}
	}

	method validarSiHayPlantaParaRegar(){

	}
}