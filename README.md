# HeroesApp

## Descripción
HeroesApp es una aplicación que utiliza datos estructurados en formato JSON para mostrar información sobre distintos héroes. Cada héroe tiene atributos únicos que incluyen identificación, nombre real, apodo, descripción, edad, poderes e imágenes asociadas.

## Estructura JSON
La aplicación consume datos desde un archivo `.json`  local que incluye registros detallados de varios héroes. 

Se facilita un ejemplo de cómo se estructura cada héroe en el archivo:

```json
{
    "id": "f0c6b58f-4d8a-4b8c-8d2a-12b4834e0a98",
    "nombreReal": "Juan Martínez",
    "apodo": "TeleMente",
    "descripcion": "Después de un accidente en un laboratorio de neurociencia, Juan adquirió la capacidad de leer y manipular pensamientos.",
    "edad": 32,
    "poderes": [
        "Telepatía"
    ],
    "imagen": "telemente"
}
```
[Aquí puedes ver el archivo de enumeraciones de poderes](/HeroesAppSwiftUI/Enums.swift)

###En el .json existen dos problemas:

1. El campo "descripcion" a veces no viene y en su lugar aparece "historia". Esto se ha soluciando de la siguiente manera:
En el modeloDTO se generan los dos campos descripcion e historia, de tal manera que siempre se leera alguno de ellos. 
tambien se crea el campo descripcionHistoria, y se le adjudica el valor de alguno de ellos:
```swift
        self.descripcionHistoria = self.descripcion == nil ? self.historia : self.descripcion
```        

2. La lectura de los poderes se hace gracias a que el rawvalue String de la enum Poderes coincide con el nombre de los poderes que utiliza el .json. Pero en algunos casos, en el .json, no se respetan las mayusculas. Para solucinar este problema, una vez capturada la lista de poderes, de un heroe, se intenta en un ambito "do" la lectura como si se respetase las mayusculas, si esto falla, en el ambito catch se hace un .lowercased de cada uno de estos poderes y con la lista de todos los poderes de la enum (para obtener esta lista acudimos al metodo .allcases), se filtra por coincididencias de minusculas:


## Navegación y Funcionalidades Clave en HeroesApp


Cuando el usuario abre la app la primera vista con la que se encuentra es la lista de Heroes. Esta vista pertenece a un Tab View que conecta con una lista de Poderes y una lista de Equipos.

### Heroes
En la lista de Heroes podemos seleccionar un heroe y se mostrara en detalle de este. 

| | |
|:---:|:---:|
| ![ListaHeroes](/Imagenes/CapturaListaHeroes.png) | ![DetalleHeroe](/Imagenes/CapturaDetalleHeroe.png) |

Ademas, se ha incorporado la opcion _Comparar_, para que se pueda comparar el heroe del detalle con cualquier otro heroe. 

<img src="/Imagenes/VideoComparar.gif" width="350" height="800" alt="DetalleHeroe">
