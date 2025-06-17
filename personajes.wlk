// tenemos dos razas distintas --- orcos -- humanos
class Personajes{
    var property rol // variable porque puede cambiar
    // nos interesa saber su fuerza, inteligencia y rol
    const fuerza // es constante porque nunca va a cambiar
    // el enunciado no dice que puede aumentar o restar en algun momento
    const inteligencia

    method potencialOfensivo() = fuerza * 10 + rol.extra()
    // le pido al extra de cada rol esto lo hacemos aca
    // porque todos los personajes lo tienen

}
class Orcos inherits Personajes{
    // a cada personaje hay que asignarle un rol
    // al rol no lo haga como string porque por ej cazador
    // tambien tiene mas objetos que deben conocer mensajes

}
class Humanos inherits Personajes{
    // hereda los atributos de personajes

}
// los roles son objetos ---- porque conocen mensajes
// < >  
object guerrero {
    method extra() = 100 // siempre da lo mismo
}
object cazador {
    // el extra depende de el potencial ofensivo de la mascota
    

    method extra(){}
}
object brujo {
    method extra() = 0 // le sumo cero porque no da ningun extra
}
class Macota{
    
}