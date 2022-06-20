import UIKit

enum Sexo{
    case masculino
    case femenino
    case none
}

class PersonaBE{
    var persona_nombre              : String
    var persona_apellido_paterno    : String
    var persona_apellido_materno    : String
    var persona_fecha_nacimiento    : Date
    var persona_edad                : Int       = 0
    var persona_nro_documento       : String
    var persona_sexo                : Sexo      = .none
    var persona_correo              : String
    var persona_cantidad_hermano    : Int
    var persona_usuario             : String?
    
    init(persona_nombre: String, persona_apellido_paterno: String, persona_apellido_materno: String, persona_fecha_nacimiento: Date, persona_nro_documento: String, persona_sexo: Sexo, persona_correo: String, persona_cantidad_hermano: Int) {
        self.persona_nombre = persona_nombre
        self.persona_apellido_paterno = persona_apellido_paterno
        self.persona_apellido_materno = persona_apellido_materno
        self.persona_fecha_nacimiento = persona_fecha_nacimiento
        self.persona_nro_documento = persona_nro_documento
        self.persona_sexo = persona_sexo
        self.persona_correo = persona_correo
        self.persona_cantidad_hermano = persona_cantidad_hermano
    }
}

func getAge(_ fechaNacimiento: Date) -> Int{
    let yearComponent = Calendar.current.dateComponents([.year], from: fechaNacimiento, to: Date())
    let age = yearComponent.year!
    return age
}

func dateByFormat(_ fechaString: String, _ fechaFormat: String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "es_PE")
    dateFormatter.dateFormat = fechaFormat
    
    return dateFormatter.date(from: fechaString) ?? Date()
}

var arrayPerson : [PersonaBE] = [PersonaBE(persona_nombre: "CARLOS JOSÉ", persona_apellido_paterno: "ROBLES", persona_apellido_materno: "GOMES", persona_fecha_nacimiento: dateByFormat("06/08/1995", "dd/MM/yyyy"), persona_nro_documento: "78451245", persona_sexo: .masculino, persona_correo: "carlos.roblesg@hotmail.com", persona_cantidad_hermano: 2),PersonaBE(persona_nombre: "MIGUEL ANGEL", persona_apellido_paterno: "QUISPE", persona_apellido_materno: "OTERO", persona_fecha_nacimiento: dateByFormat("28/12/1995", "dd/MM/yyyy"), persona_nro_documento: "79451654", persona_sexo: .masculino, persona_correo: "miguel.anguel@gmail.com", persona_cantidad_hermano: 0),PersonaBE(persona_nombre: "KARLA ALEXANDRA", persona_apellido_paterno: "FLORES", persona_apellido_materno: "ROSAS", persona_fecha_nacimiento: dateByFormat("15/02/1997", "dd/MM/yyyy"), persona_nro_documento: "77485812", persona_sexo: .femenino, persona_correo: "Karla.alexandra@hotmail.com", persona_cantidad_hermano: 1),PersonaBE(persona_nombre: "NICOLAS", persona_apellido_paterno: "QUISPE", persona_apellido_materno: "ZEBALLOS", persona_fecha_nacimiento: dateByFormat("08/10/1990", "dd/MM/yyyy"), persona_nro_documento: "71748552", persona_sexo: .masculino, persona_correo: "nicolas123@gmail.com", persona_cantidad_hermano: 1),PersonaBE(persona_nombre: "PEDRO ANDRE", persona_apellido_paterno: "PICASSO", persona_apellido_materno: "BETANCUR", persona_fecha_nacimiento: dateByFormat("17/05/1994", "dd/MM/yyyy"), persona_nro_documento: "74823157", persona_sexo: .masculino, persona_correo: "pedroandrepicasso@gmail.com", persona_cantidad_hermano: 2),PersonaBE(persona_nombre: "FABIOLA MARIA", persona_apellido_paterno: "PALACIO", persona_apellido_materno: "VEGA", persona_fecha_nacimiento: dateByFormat("02/02/1992", "dd/MM/yyyy"), persona_nro_documento: "76758254", persona_sexo: .femenino, persona_correo: "fabi@hotmail.com", persona_cantidad_hermano: 0)]

func setAgePerson(_ array: [PersonaBE]){
    array.forEach { objPersona in
        objPersona.persona_edad = getAge(objPersona.persona_fecha_nacimiento)
    }
}

func getPersonMaxAndMinDate(_ arrayPersonas: [PersonaBE]){
    let personaMaxEdad = arrayPersonas.max(by: {$0.persona_edad < $1.persona_edad})
    let personaMinEdad = arrayPersonas.min(by: {$0.persona_edad < $1.persona_edad})
    
    print("Persona con mayor edad : \(personaMaxEdad?.persona_nombre ?? "") \(personaMaxEdad?.persona_edad ?? 0)")
    print("Persona con menor edad : \(personaMinEdad?.persona_nombre ?? "") \(personaMinEdad?.persona_edad ?? 0)")
}

func getSexByList(_ arrayPersons: [PersonaBE]){
    let arrayHombre = arrayPersons.filter({$0.persona_sexo == .masculino})
    let arrayMujer = arrayPersons.filter({$0.persona_sexo == .femenino})
    
    print("Cantidad de hombres : \(arrayHombre.count)")
    print("Cantidad de mujerres : \(arrayMujer.count)")
}

func getPeronsByBrothers(_ arrayPersons: [PersonaBE]){
    let arrayList = arrayPersons.filter({$0.persona_cantidad_hermano > 2})
    
    print("Cantidad de personas con mas de 2 hermanos: \(arrayList.count)")
}

func getFormatName(_ objPerson: PersonaBE) -> String{
//    let nameFormat = objPerson.persona_nombre.capitalized
    var nombreCapitalized = ""
    
    let primerNombre = objPerson.persona_nombre.split(separator: " ").first ?? ""
    let apellido = objPerson.persona_apellido_paterno
    let apellido2 = objPerson.persona_apellido_materno.prefix(1)
    
    nombreCapitalized = "\(primerNombre) \(apellido) \(apellido2).".capitalized
    
    return nombreCapitalized
}

func printNamePerson(_ arrayPerson: [PersonaBE]){
    arrayPerson.forEach { objPerson in
        print(getFormatName(objPerson))
    }
}

func parseUserName(_ objPerson: PersonaBE) -> String{
    
    let userName = objPerson.persona_correo.split(separator: "@").first ?? ""
    
    return String(userName)
}

func setUserName(_ arrayPerson: [PersonaBE]){
    arrayPerson.forEach { objPerson in
        objPerson.persona_usuario = parseUserName(objPerson)
        print(objPerson.persona_usuario ?? "")
    }
}

setAgePerson(arrayPerson)
getPersonMaxAndMinDate(arrayPerson)
getSexByList(arrayPerson)
getPeronsByBrothers(arrayPerson)
printNamePerson(arrayPerson)
setUserName(arrayPerson)
