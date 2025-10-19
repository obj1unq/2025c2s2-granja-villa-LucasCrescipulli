import wollok.game.*
import direcciones.*

class Maiz {
	// ATRIBUTOS

	var property position = game.at(1, 1)
	var property estado = maizBebe

	// COMPORTAMIENTOS

	method image() {
		return estado.image()
	}

	method crecer(){
		estado = estado.siguiente()
	}
	
	method cosechar(){
		if (self.sePuedeCosechar()){
			game.removeVisual(self)
		}
		else {
			self.error("No está listo para cosechar")
		}
	}

	method sePuedeCosechar(){
		return estado.sePuedeCosechar()
	}

	method oroQueOtorga(){
		return 150
	}
}

class Trigo {
	var property position = game.at(1,1)
	var property estado = trigo0

	method image() {
		return estado.image()
	}

	method crecer(){
		estado = estado.siguiente()
	}

	method cosechar(){
		if (self.sePuedeCosechar()){
			game.removeVisual(self)
		}
	}

	method sePuedeCosechar(){
		return estado.sePuedeCosechar()
	}

	method oroQueOtorga(){
		return estado.oroQueOtorga()
	}
}

class Tomaco {
	var property position = game.at(1,1)
	var property estado = tomacoBaby

	method image(){
		return estado.image()
	}

	method crecer(){
		self.validarMovimiento()
		self.validarCrecimiento()
		estado = estado.siguiente()
		if (position.y() != game.height() - 1){
			position = position.up(1)
		}
		else {
			position = game.at(position.x(), 0)
		}
	}
	method cosechar(){
		game.removeVisual(self)
	}
	method oroQueOtorga(){
		return 80
	}
	method validarMovimiento(){
		if (not game.getObjectsIn(position.up(1)).isEmpty()){
			self.error("No puede crecer hacia arriba")
		}
	}
	method validarCrecimiento(){
		if (not estado.puedeCrecer()){
			self.error("No puede crecer más")
		}
	}
}

class Aspersor{
	var property position = game.at(1,1)
	const gestor = gestorPosiciones
	method image(){
		return "aspersor.png"
	}
	method plantasAlrededor(){
		return gestor.plantasEn(self.position())
	}
	method regar(){
		self.plantasAlrededor().forEach({planta => planta.crecer()})
	}
	method esPlanta(){
		return false
	}
	method crecer(){}
}

object aspersoresDeLaGranja{
	const aspersores = []
	method nuevoAspersor(aspersor){
		aspersores.add(aspersor)
	}
	method hayAspersor(posicion){
		return aspersores.any({aspersor => aspersor.position()==posicion})
	}
	method aspersorEn(posicion){
		return aspersores.find({aspersor => aspersor.position()==posicion})
	}
}

// ESTADOS
object maizAdulto{
	method image(){
		return "corn_adult.png"
	}
	method siguiente(){
		return self
	}
	method sePuedeCosechar(){
		return true
	}
}

object maizBebe{
	method image(){
		return "corn_baby.png"
	}
	method siguiente(){
		return maizAdulto
	}
	method sePuedeCosechar(){
		return false
	}
}

object tomacoBaby{
	method image(){
		return "tomaco_baby.png"
	}
	method siguiente(){
		return tomacoAdulto
	}
	method sePuedeCosechar(){
		return false
	}
	method puedeCrecer(){
		return true
	}
}

object tomacoAdulto{
	method image(){
		return "tomaco.png"
	}
	method siguiente(){}
	method sePuedeCosechar(){
		return true
	}
	method puedeCrecer(){
		return false
	}
}

object trigo0{
	method image(){
		return "wheat_0.png"
	}
	method siguiente(){
		return trigo1
	}
	method sePuedeCosechar(){
		return false
	}
}

object trigo1{
	method image(){
		return "wheat_1.png"
	}
	method siguiente(){
		return trigo2
	}
	method sePuedeCosechar(){
		return false
	}
}

object trigo2{
	method image(){
		return "wheat_2.png"
	}
	method siguiente(){
		return trigo3
	}
	method sePuedeCosechar(){
		return true
	}
	method oroQueOtorga(){
		return 100
	}
}

object trigo3{
	method image(){
		return "wheat_3.png"
	}
	method siguiente(){
		return trigo0
	}
	method sePuedeCosechar(){
		return true
	}
	method oroQueOtorga(){
		return 200
	}
}

object cultivosDeLaGranja{
	const cultivos = []
	method nuevoCultivo(cultivo){
		cultivos.add(cultivo)
	}
	method hayPlanta(posicion){
		return cultivos.any({cultivo => cultivo.position()==posicion})
	}
	method plantaEn(posicion){
		return cultivos.find({cultivo => cultivo.position()==posicion})
	}
}