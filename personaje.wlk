import direcciones.*
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
		// self.validarSiEstoyEnElMercado()
		// self.validarSiElMercadoTieneOro()
		oro += self.cantidadDeOroSegunPlantasCosechadas()
		plantasCosechadas.clear()
	}

	method cantidadDeOroSegunPlantasCosechadas(){
		return plantasCosechadas.sum({planta => planta.oroQueOtorga()})
	}

	method mostrarOroYPlantas(){
		game.say(self, "tengo " + plantasCosechadas.size() + " plantas y " + oro + " monedas de oro")
	}

	method dejarAspersor(){
		self.validarSiSePuedeDejarAspersor()
		const aspersor = new Aspersor()
		aspersor.position(self.position())
		game.addVisual(aspersor)
		game.onTick(1000, "Aspersor", {aspersor.regar()})
	}

	method esPlanta(){
		return false
	}

	method esMercado(){
		return false
	}

	method crecer(){}

	// GETTERS

	method plantasCosechadas(){
		return plantasCosechadas
	}

	// VALIDACIONES

	method validarSiSePuedeSembrar(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede sembrar acá")
		}
	}

	method validarSiHayPlantaParaRegar(){
		if (not gestorPosiciones.hayPlantaEn(self.position())){
			self.error("No hay plantas para regar acá")
		}
	}

	method validarSiHayPlantaParaCosechar(){
		if (game.colliders(self).isEmpty()){
			self.error("No hay plantas para cosechar acá")
		}
	}

	method validarSiSePuedeDejarAspersor(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede dejar un aspersor acá")
		}
	}

	method validarSiEstoyEnElMercado(){
		if (not gestorPosiciones.hayMercadoEn(self.position())){
			self.error("No puedo vender si no estoy en un mercado")
		}
	}

	method validarSiElMercadoTieneOro(){
		/* 	Validar si el mercado que está en la misma posición que el personaje tiene oro suficiente para
			comprar todas las plantas que lleva el personaje. */
		// if ()
	}
}

