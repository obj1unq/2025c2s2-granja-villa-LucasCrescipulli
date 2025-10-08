import wollok.game.*
import cultivos.*

object personaje {

	// ATRIBUTOS

	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = #{}
	
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

	method cosecharPlanta(){
		self.validarSiHayPlantaParaCosechar()
		const planta = game.uniqueCollider(self)
		planta.cosechar()
		// cuidado con esto plantasCosechadas.add(planta)
		// si la planta no está madura, la voy a contar igual
		// porque hay planta, pero no está lista.
	}

	// VALIDACIONES

	method validarSiSePuedeSembrar(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede sembrar acá")
		}
	}

	method validarSiHayPlantaParaRegar(){
		if (game.colliders(self).isEmpty()){
			self.error("No hay plantas para regar acá")
		}
	}

	method validarSiHayPlantaParaCosechar(){
		if (game.colliders(self).isEmpty()){
			self.error("No hay plantas para cosechar acá")
		}
	}
}