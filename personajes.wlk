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

    method esGroso() = self.esInteligente() or self.esGrosoEnSuRol()

    method esInteligente()
    /* 
        el metood es abstracto, no responde nada porque 
        seria una clase de vacio en otros aspectos

    */
    method esGrosoEnSuRol() = rol.esGroso(self)
    /* 
         le pregunta a cada rol si es inteligente
         en este caso ellos mismos (self) o no.
    */
}
class Orcos inherits Personajes{
    // a cada personaje hay que asignarle un rol
    // al rol no lo haga como string porque por ej cazador
    // tambien tiene mas objetos que deben conocer mensajes
    override method potencialOfensivo(){
        return
        if(rol == brujo) super() * 1.1 else super()
        /*
             super() es cuando volvemos a escribir
             el metodo, osea lo sobreescribimos
        */
    }
    override method esInteligente() = false
}
class Humanos inherits Personajes{
    // hereda los atributos de personajes
    override method esInteligente() = inteligencia > 50
}
// los roles son objetos ---- porque conocen mensajes
// < >  
object guerrero {
    method extra() = 100 // siempre da lo mismo

    method esGroso(unPersonaje) = unPersonaje.fuerza()
    /*
        necesito un personaje si o si como parametro
        porque la consigna dice que es groso solo si la
        fuerza del personaje es mayor a 50
    */
}
class Cazador {
    /* 
        cazador es una clase porque se puede crear
        varios tipos de rol de cazador por eso es una
        clase donde le podemos poner si o no tiene mascota
    */

    /*
        puede tener diferentes mascotas
        por eso es una clase
    */
    const property mascota  
    method extra() = mascota.extra()

    method esGroso(unPersonaje) = mascota.esLongeva()
}
object brujo {
    method extra() = 0 // le sumo cero porque no da ningun extra

    method esGroso(unPersonaje) = true
    /*
        siempre le debo de pasar el parametro
        porque asi el mismo sera polimorfico
    */
}
class Mascota{
    const property fuerza 
    var edad
    const property tieneGarras  
    method cumplirAños(){edad += 1}
    method extra() = if(tieneGarras) fuerza * 2 else fuerza
    // porque duplican su valor cuando tienen garras
    method esLongeva() = edad > 10
    // es solo si su edad (que es una variable) es mayor a diez
}


// ---------- TERCERA PARTE  ----------
class Localidad{
    var ejercito 
    method ejercito() = ejercito   
    method poderDefensivo() = ejercito.poderOfensivo()
}
class Aldea inherits Localidad{
    var cantHabitantes 
    const cantidadMaxima 
    /*
        la suma ya esta hecha en la parte de clases
        de ejercito entonces lo que hacemos es llamarla
        en el metodo
    */
    method serOcupada()
}
class Ciudad inherits Localidad {
    override method poderDefensivo() = super() + 300
}
class Ejercito{
    const personaje = []

    method invadir(unaLocalidad){
        // una localidad --- aldea --- una ciudad
        if(self.puedeInvadir(unaLocalidad)){
            // tenemos que desalojar en la localidad
            // al ejercito, osea ponerlo como nuevo
            unaLocalidad.serOcupada(self)
        }

    }
    method poderOfensivo() = personaje.sum({p => p.potencialOfensivo()})

    method puedeInvadir(unaLocalidad) {
        return
        self.poderOfensivo() > unaLocalidad.poderDefensivo() 
    } 
}