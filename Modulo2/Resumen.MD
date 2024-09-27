# MODULO 2

## JAVA
___

- Lenguaje de proposito gral. Paradigmas: Immperativo/OO
- Permite generar aplicaciones multiplataforma
- Plataforma Java:
  - Plataforma de desarrollo (JDK: Java Development Kit): Incluye compilador, depurador, generador de documentacion
  - Plataforma de ejecución (JRE: Java Runtime Enviroment): Inlcuye componentes requeridas para ejecutar aplicaciones Java, entre ellas la JVM (Java Virtual Machine)
____

### **El "Programa principal"**: tratando de relaiconarlo con la modalidad de lo conocido en Pascal

Asi como en Pascal el programa principal está delimitado por:
```
begin
end.
```

Acá se tiene una clase publica NOMBER, donde dentro tiene el MAIN (Lo que vendria a ser el programa principal)
La estructura es la siguiente:

```
public class NombreAplicacion {
    public static void main (String[] args) {
        /* Codigo */
    }
}
```
- Main = 'Programa principal'. {} deliita el cuerpo
- Setencias de codigo separadas por punto y coma(;)
- Se recomienda identar el codigo pra facilitar la lectura
- Comentarios:
  - De lineas multiples: /* comentario */
  - De linea unica: // comentario
- CASE SENSITIVE (sensible a las mayusculas y minusculas)
____

### **Declaracion de variables locales a método (main u otro)**

- Se declaran en zona de codigo (no toman valor por defecto)
```
    tipo_de_variable Nombre_de_Variable; (Opcional: dar valor inicial)
```

- Convencion de nombres: comenzar con minuscula, luego cada palabra en mayuscula
- Asignacion: nombre_variable = valor
- Tipos primitivos: La variable almacena un valor 
  - **boolean**: True - False
  - **char**: 'a' - '0' - '*'
  - **int**: 102
  - **double**: 123.4
- **String** para manipular cadenas: "Esto es un string"

### **Manipulacion de variables**

#### **Operadores aritmeticos**
  - '+' Operador suma;  con ++ incrementa el valor en 1
  - '-' Operador resta; con -- decrementa el valor en 1
  - '*' Operador de multiplicacion
  - '/' Operador division
  - '%' Operador resto

#### **Operadores relacionales**
- == Igual
- != Distinto
- '>' Mayor
- '>=' mayor o igual
- '<'  Menor
- '<=' Menor o igual
- && AND
- || OR
- ! NOT

- '+' para concatenar

### Ejemplos de declaracion de variables


```
public class Demo10DeclaracionVariables {
public static void main (String[] args){
  boolean encontre = false;
  int miDNI = 11222333, tuDNI=33222111;
  char sexo, inicial = 'C';
  sexo = 'F';
  double miSueldo = 1000.30;
  String miNombre = 'Pepe';
}
}

piblic class Demo02OperadoresUnarios{
  public static void main (String[] args){
    int i= 3;
    i++;
    i..;
  }
}


public class Demo03CalculoAritmeticoA{
  public static void main (String[] args){
    int result = 1+2;
    result = result -1;
    result = result * 2;
    result = result /2;
    result = result % 2;
  }
}

public class Demo04CalculoAritmeticoB{
  public static void main (String[] args){
    int i=4/3;
    double d1 = 4.0/3.0;
    double d2 =  4/3;
    double d3 = (double) 4/3; // Conversion explicita del op1 a double
  }
}

```

### **Mostrar datos en salida estándar**

Sentencias que permiten mostrar datos en consola:
- System.out.print(...) -> NO realisa salto de linea
- System.out.println(...) -> SI realiza salto de linea

```
//Ejemplo

public class Demo05Salida{
  public static void main(String[] args){
    System.out.print("Hola mundo!");
    System.out.println("Hola mundo!");
    System.out.print(1234);
    System.out.println(true);

    //Para mostrar varios datos, unir con +

    int año = 2024;
    System.out.println("Hola mundo, estamos en el año "+ año + "!");
  }
}
```


### **Uso del lector (funcionalidad definida en PaqueteLectura.Lector)**

```
import PaqueteLectura.Lector;
public class Demo05Entrada
{
  public static void main (String[] args){
    System.out.println("Ingrese nombre: ");
    String.nombre = Lector.leerString(); //Lee y devuelve el string ingresado antes del enter
    System.out.println("Ingrese si trabaja (true/false): ");
    boolean trabaja = Lector.leerBoolean();
    System.out.println("Ingrese edad: ");
    int edad = Lector.leerInt();
    System.out.println("Ingrese sueldo: ");
    double sueldo = Lector.leerDouble(); //Lee y devuelve el double ingresado

    System.out.println("N: "+nombre + " T:-" + trabaja + " E: "+edad+" S: " + sueldo);
  }
}
```

### **Generacion aleatoria**
 Uso de GeneradorAleatorio (funcionalidad definida en PaqueteLectura.generadorAleatorio)

```
import PaqueteLectura.GeneradorAleatorio;
public class Demo05Generador{
  public static void main(String[] args){
    GeneradorAleatorio.iniciar();
    System.out.println(GeneradorAleatorio.generarInt(19));
    System.out.println(GeneradorAleatorio.generarDouble(10));
    System.out.println(GeneradorAleatorio.generarBoolean());
    System.out.println(GeneradorAleatorio.generarString(4));
  }
}
```

## ESTRUCTURAS DE CONTROL

### **Seleccion**

```
if (condicion)
  accion(es) a realizar cuando la condicion es true
else
  accion(es) a realizar cuando la condicion es false

Encerrar entre {} en caso de incluir varias sentencias.
Cuando solo incluye una sentencia finalizar con ;


Switch statement:

int month = 8
string monthString;
switch (month) {
  case 1: monthString = "Enero";
    break;
  case 2: monthString = "Febrero";
    break;
  case N; monthString = "Mes N";
    break;
  default: monthString = "Invalid month";
    break;
}

```

### **Repeticion**

```
for (inicializacion; condicion; expresion)
  accion(es)


int i;

for (i=1, i<=10; i++)
  System.out.println(i);


for (i=10; i>0; i=i-1)
  System.out.println(i);
```

### **Arreglos**

- Almacenan un numero fijo de valores primitivos // objetos (del mismo tipo)
- Acceso en forma directa a las posiciones
- Diension fisica: se establece al crearlo
- Indice: entero, comienza desde 0


- Declaracion
```
TipoElemento[] nombreVariable;
```

- Creación:
```
nombreVariable = new TipoElemento[DIMF];
```

- Acceso a elemento
```
nombreVariable[posicion]
```

-Ejemplo:
```
int [] contador = new int[10];

for (i=0; i<10; i++) contador [i] = i;
...
System.out.println("La Pos. 1 tiene " + ontador[1]);

```

### ** Arreglos bidimencionales**
- Coleccion ordenada e indexada de elmentos.
- Esta estructura de datos compuesta permite acceder a cada componente utilizando dos indices (fila y columna) que permiten ubicar el elemento dentro de la estructura.

- Caracteristicas:
  - Homogenea
  - Estátca
  - Indezada
  - Lineal
  
En java, cada indice es entero y comienza desde 0

Los elementos de la matriz pueden ser int, double, char, boolean, u objetos (mismo tipo)

#### Ejemplo de situaciones de uso
- Representar sala de un teatro (30 filas, 20 butacas por fila)
- Representar una tabla que indique la cantidad de lluvia caida para cada provincia de Argentina y cada mes del año actual.
- Representar un cartón de Bingo
- ...
___

- Declaracion:
  ```
  TipoElemento[][] nombreVariable;
  ```

- Creacion
```
 nombreVariable = new TipoElemento[DIMF][DIMC];
```

- Acceso a elemento
```
nombreVariable[PosFil][PosCol]
```

- Ejemplo
  ```
int [][] tabla = new int[3][4];
  int i, j;
  for (i=0, i<3, i++)
    for (j=0, j<3, j++)
      tabla[i][j] = GeneradorAleatorio.generarInt(10);
  System.out.println("La pos. 1,2 tiene " + tabla[1][2]);
  ```
  