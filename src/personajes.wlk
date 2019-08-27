import wollok.game.*

// Este objeto esta para cargar mas facil la config en la consola
object pelicula
{
	method inicio()
	{
		game.title("TitanicGame")
		game.height(7)
		game.width(7)
		game.ground("blue.jpg")

		game.addVisual(titanic)
		game.addVisual(iceberg)
		
		game.start()
	}
}

object titanic{
	var imagen = "titanic.png"
	var position = game.at(2,2)
	
	method image() { return imagen}
	method position() { return position}
	
	method hundite(){
		imagen = "titanic-hundiendo.jpg"
	}
	method flotas(){
		return iceberg.obtenerDistancia()>0
	}
}	

object iceberg{
	var distancia = 2
	
	method image() {return "iceberg.jpeg"}
	method position() {return titanic.position().right(distancia)}
	
	method acercarse(){
		distancia = distancia - 1
	}
	method alejarse(){
		distancia = distancia + 1
	}
	
	method chocar(algo){
		algo.hundite()
		game.addVisual(puerta)
	}
	method obtenerDistancia(){
		return distancia
	}
}

object puerta {
	var ocupante = jack
	var position = game.at(2,5)
	var imagen = ocupante.image()
	method position() { return position}
	method image() {return imagen}
	
	method salva() {
		return ocupante.sobrevivi()
	}
	method ocupante() { return ocupante}
	
	method serOcupadaPor(alguien){
		ocupante = alguien
	}
	method hundite(){
		imagen = "door.png"
	}
}

object capitan {
	method image() = "suelo.png"
	method nosHundimos(){
		return titanic.flotas().negate()
	}
	method sobrevivi(){
		return "bien ahi"
	}
}

object jack {
	var dibujo
	method image() = "jack.png"
	
	method sobrevivi(){
		dibujo = "naufragio"
	}
}

object rose {
	var nombre = "rosa"

	method image() = "rose.jpeg"

	method sobrevivi(){
		nombre = "marina"
	}
	method comoTeLlamas(){
		return nombre
	}
}