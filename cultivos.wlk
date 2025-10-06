import wollok.game.*

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
}

class Tomaco {
	var property position = game.at(1,1)
	var property image = "tomaco_baby.png"

	method image(_image){
		image = _image
	}

	method crecer(){
		self.image("tomaco.png")

		if (position.y() != game.height() - 1){
			position = position.up(1)
		}
		else {
			position = game.at(position.x(), 0)
		}
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
}

object maizBebe{
	method image(){
		return "corn_baby.png"
	}
	method siguiente(){
		return maizAdulto
	}
}

object trigo0{
	method image(){
		return "wheat_0.png"
	}
	method siguiente(){
		return trigo1
	}
}

object trigo1{
	method image(){
		return "wheat_1.png"
	}
	method siguiente(){
		return trigo2
	}
}

object trigo2{
	method image(){
		return "wheat_2.png"
	}
	method siguiente(){
		return trigo3
	}
}

object trigo3{
	method image(){
		return "wheat_3.png"
	}
	method siguiente(){
		return trigo0
	}
}