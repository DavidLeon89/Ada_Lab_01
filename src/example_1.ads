--  Los paquetes constan de dos partes: especificacion y cuerpo.

--  En la especificacion se pone la interfaz del paquete (todo
--  lo que quieres declarar para que sea visible a todos los
--  clientes del paquete)

--  Aqui tienes algunos ejemplos de declaraciones.

package Example_1 is

   ----------------------------------------------------------------
   --  Declaraciones de constantes y variables globales publicas --
   ----------------------------------------------------------------

   V1 : constant Natural := 1;
   V2 : constant Positive := 2 * V1;
   V3 : Integer := 3 * V2;
   V4 : Float   := 2.0 * Float (V3);  -- Lenguaje fuertemente tipado
   V5 : String (1 .. 100);
   V6 : Character := 'A';

   -------------------------------------------------------------
   -- Declaraciones de tipos de datos basicos y sus atributos --
   -------------------------------------------------------------

   type My_Int_Type       is new Integer range -1 .. 20;
   subtype My_Int_Subtype is Integer range -1 .. 20;
   --  Diferencia entre declarar un tipo y utilizar un subtipo?

   A : My_Int_Type    := My_Int_Type'First;   -- Ejemplo de atributo 'First
   B : My_Int_Subtype := My_Int_Subtype'Last; -- Ejemplo de atributo 'Last

   type Mod_Int is mod 10;
   --  Declaracion de un tipo unsigned (rango de valores?)

   type Week_Day is (Monday, Tuesday, Wednesday,
                     Thursday, Friday, Saturday, Sunday);
   --  Ejemplo de declaracion de un tipo enumerado

   First_Day : constant Week_Day := Week_Day'First;     -- Atributo 'First
   Last_Day  : constant Week_Day := Week_Day'Last;      -- Atributo 'Last
   Next_Day  : Week_Day := Week_Day'Succ (First_Day);   -- Atributo 'Succ

   Internal_Value   : Natural := Week_Day'Pos (Friday); -- Atributo 'Pos
   Last_Working_Day : Week_Day := Week_Day'Val (Internal_Value);
                                                        -- Atributo 'Val

   type Month_Type is (January, February, March, April, May, June,
                       July, August, September, October, November, December);
   --  Otro ejemplo de declaracion de un tipo enumerado

   ------------------------------------------------
   -- Declaraciones de tipos de datos compuestos --
   ------------------------------------------------

   --  1) Records

   type Date is record
      Day   : Positive range 1 .. 31  := 1;
      Month : Month_Type              := January;
      Year  : Integer range 1 .. 3000 := 2019;
      WDay  : Week_Day                := Tuesday;
   end record;

   --  Declaracion de una variable compuesta inicializada mediante un
   --  agregado en notacion posicional
   Default_Date    : Date := (1, February, 2019, Friday);

   --  Declaracion de una variable compuesta inicializada mediante un
   --  agregado en notacion nombrada
   First_Day_March : Date := (Day   => 1,
                              Month => March,
                              Year  => 2019,
                              WDay  => Friday);

   --  Declaracion de un record conteniendo una string. El tamano maximo
   --  de la string es 30 y esta inicializada a espacios en blanco.
   --  Utilizamos Name_Len para recordar el tamano real de la string.
   type Rec_1 is record
      Name        : String (1 .. 30) := (others => ' ');
      Name_Length : Natural := 0;
   end record;

   --  Declaracion de un record con un discriminante: en Ada se llama
   --  discriminante a un parametro del record que nos permite variar
   --  el tamano o el valor inicial de alguno de los componentes del
   --  record. En este ejemplo lo utilizamos para permitir declarar
   --  strings con diferentes tamanos maximos.
   type Rec_2 (Max_Length : Natural) is record
      Name        : String (1 .. Max_Length) := (others => ' ');
      Name_Length : Natural := 0;
   end record;

   Name_1 : Rec_1;       -- Su longitud maxima es 30
   Name_2 : Rec_2 (100); -- Su longitud maxima es 100


   --  2) Arrays

   type Table_1 is array (Positive range 1 .. 100) of Natural;
   type Table_2 is array (Positive range <>) of Natural;
   --  Table_2 es un array en el que no se ha fijado el rango del array;
   --  se fijara cuando se declaren las variables.

   --  Ejemplo en el que indicamos el tipo de dato del indice (no tiene
   --  que ser siempre un numero).
   type Table_3 is array (Week_Day) of Date;

   --  Ejemplo en el que declaramos un tipo de dato especifico para el indice
   --  de nuestro array.
   type T_Index is new Integer range -10 .. 10;
   type Table_4 is array (T_Index range -5 .. 5) of Date;

   My_Table_1 : Table_1;
   My_Table_2 : Table_2 (10 .. 15); -- Fijamos el rango del indice!
   My_Table_3 : Table_3;

   My_Table_4 : Table_4 := (First_Day_March, others => Default_Date);
   -- Ejemplo que inicializa el contenido del array utilizando un agregado

   -------------------
   --  Subprogramas --
   -------------------

   function Absolute_Value (X : in Integer) return Integer;
   --  Declaracion de una funcion; el cuerpo de esta funcion está en el
   --  cuerpo de este paquete (en el fichero example_1.adb).
   --  El modo del parametro puede ser: 'in', 'out' o 'in out'

   function Next_Value     (X :    Integer) return Integer is (X + 1);
   --  Ejemplo de funcion expresion: podemos utilizarlo cuando el cuerpo
   --  de la funcion es una expresion aritmetica o logica.

   procedure Set (X :    out Integer; Value : in Integer);
   procedure Add (X : in out Integer; Value :    Integer := 1);
   --  Ejemplos de procedimientos (subprogramas que no retornan ningun
   --  valor) con ejemplos los tres modos de parametros basicos ('in',
   --  'out', 'in out').
   --  En el segundo parametro de 'Add' estamos indicando que este segundo
   --  parametro es opcional; si no se utiliza en la llamada entonces tiene
   --  el valor 1. Ejemplos de posibles llamadas a este procedimiento son:
   --     Add (X, 10); 
   --     Add (X);     --  Equivalente a Add (X, 1)

   type Text is new String (1 .. 9);
   function Day_Message (Day : Week_Day) return Text;
   --  Ejemplo de funcion que retorna una string de 9 caracteres.

end Example_1;

