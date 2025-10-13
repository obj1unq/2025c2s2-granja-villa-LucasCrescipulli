import wollok.game.*
import cultivos.*

object personaje {

	// ATRIBUTOS

	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = []
	var property oro = 0
	
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
		if (game.colliders(self).isEmpty()){
			plantasCosechadas.add(planta)
		}
	}

	method venderPlantas(){
		oro += plantasCosechadas.sum({planta => planta.oroQueOtorga()})
		plantasCosechadas.clear()
	}

	method mostrarOroYPlantas(){
		game.say(self, "tengo " + plantasCosechadas.size() + " plantas y " + oro + " monedas de oro")
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