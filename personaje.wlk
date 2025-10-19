import mercados.*
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
		cultivosDeLaGranja.nuevoCultivo(maiz)
	}

	method sembrarTrigo(){
		self.validarSiSePuedeSembrar()
		const trigo = new Trigo()
		trigo.position(self.position())
		game.addVisual(trigo)
		cultivosDeLaGranja.nuevoCultivo(trigo)
	}

	method sembrarTomaco(){
		self.validarSiSePuedeSembrar()
		const tomaco = new Tomaco()
		tomaco.position(self.position())
		game.addVisual(tomaco)
		cultivosDeLaGranja.nuevoCultivo(tomaco)
	}

	method regarPlanta(){
		self.validarSiHayPlantaParaRegar()
		const planta = cultivosDeLaGranja.plantaEn(self.position())
		planta.crecer()
	}

	method cosecharPlanta(){
		self.validarSiHayPlantaParaCosechar()
		const planta = cultivosDeLaGranja.plantaEn(self.position())
		planta.cosechar()
		if (game.colliders(self).isEmpty()){
			plantasCosechadas.add(planta)
		}
	}

	method venderPlantas(){
		self.validarSiTienePlantasParaVender()
		self.validarSiEstoyEnElMercado()
		self.validarSiElMercadoTieneOro()
		self.venderlePlantasAlMercado(mercadosDeLaGranja.mercadoEn(self.position()))
		oro += self.cantidadDeOroSegunPlantasCosechadas()
		plantasCosechadas.clear()
	}

	method cantidadDeOroSegunPlantasCosechadas(){
		return plantasCosechadas.sum({planta => planta.oroQueOtorga()})
	}

	method mostrarOroYPlantas(){
		game.say(self, "tengo " + plantasCosechadas.size() + " plantas y " + oro + " monedas de oro")
	}

	method venderlePlantasAlMercado(mercado){
		mercado.oro(self.cantidadDeOroSegunPlantasCosechadas())
		mercado.mercaderia(self.plantasCosechadas())
	}

	method dejarAspersor(){
		self.validarSiSePuedeDejarAspersor()
		const aspersor = new Aspersor()
		aspersor.position(self.position())
		game.addVisual(aspersor)
		game.onTick(1000, "Aspersor", {aspersor.regar()})
		aspersoresDeLaGranja.nuevoAspersor(aspersor)
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
		if (not cultivosDeLaGranja.hayPlanta(position)){
			self.error("No hay plantas para regar acá")
		}
	}

	method validarSiHayPlantaParaCosechar(){
		if (not cultivosDeLaGranja.hayPlanta(position)){
			self.error("No hay plantas para cosechar acá")
		}
	}

	method validarSiSePuedeDejarAspersor(){
		if (not game.colliders(self).isEmpty()){
			self.error("No se puede dejar un aspersor acá")
		}
	}

	method validarSiEstoyEnElMercado(){
		if (not mercadosDeLaGranja.hayMercado(position)){
			self.error("No puedo vender si no estoy en un mercado")
		}
	}

	method validarSiElMercadoTieneOro(){
		/* 	Validar si el mercado que está en la misma posición que el personaje tiene oro suficiente para
			comprar todas las plantas que lleva el personaje. */
		if (mercadosDeLaGranja.mercadoEn(position).oro() < self.cantidadDeOroSegunPlantasCosechadas()){
			self.error("El mercado no tiene suficiente oro para comprar mis plantas")
		}
	}

	method validarSiTienePlantasParaVender(){
		if (self.plantasCosechadas().isEmpty()){
			self.error("No tengo nada para vender")
		}
	}
}

