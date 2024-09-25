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