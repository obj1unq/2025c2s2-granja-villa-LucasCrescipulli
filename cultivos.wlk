import wollok.game.*

class Maiz {
	// ATRIBUTOS

	var property position = game.at(1, 1)
	var property estado = bebe

	// COMPORTAMIENTOS

	method image() {
		return estado.image()
	}

	method crecer(){
		estado = estado.siguiente()
	}
}

class Trigo {
	var property position = game.at(1,1)
	method image(){
		return "wheat_0.png"
	}
}

class Tomaco {
	var property position = game.at(1,1)
	method image(){
		return "tomaco_baby.png"
	}
}

// ESTADOS

object adulta{
	method image(){
		return "corn_adult.png"
	}
	method siguiente(){
		return self
	}
}

object bebe{
	method image(){
		return "corn_baby.png"
	}
	method siguiente(){
		return adulta
	}
}