--  Aqui tienes algunos ejemplos de declaraciones privadas (declaraciones
--  en las que dejamos visible el nombre del tipo de dato pero mantenemos
--  privado todos los detalles de su contenido).

package Example_2 is

   ------------
   -- Number -- (Ejemplo de declaracion de un tipo numerico privado)
   ------------

   type Number is private;

   procedure Reset      (N : in out Number);
   procedure Increment  (N : in out Number; Value : in Integer := 1);
   function  To_Integer (N : Number) return Integer;

   ----------
   -- Date -- (Ejemplo de declaracion de un record privado)
   ----------

   type Date   is private;
   Default_Date : constant Date;   -- Ejemplo de constante privada

   function Get_Date return Date;

   procedure Set_Date
     (D     : in out Date;
      Value :        Date := Default_Date);

   function To_String (D : Date) return String;

   ---------
   -- Rec --  (Ejemplo de declaracion de un record privado con discriminante)
   ---------

   type Rec (Max_Length : Natural) is limited private;

   procedure Save_Name (R : in out Rec; Name : String);
   function To_String  (R : Rec) return String;

private

   --  Despues de la palabra reservada 'private' completamos la declaracion
   --  de todos los tipos privados del paquete.

   type Number is new Integer range -100 .. 200;

   type Month_Type is (January, February, March, April, May, June);

   type Date is record
      Day   : Positive range 1 .. 31  := 1;
      Month : Month_Type              := January;
      Year  : Integer range 1 .. 3000 := 2019;
   end record;

   Default_Date    : constant Date := (1, January, 2000);

   First_Day_March : Date := (Day   => 1,
                              Month => March,
                              Year  => 2019);

   type Rec (Max_Length : Natural) is record
      Name        : String (1 .. Max_Length) := (others => ' ');
      Name_Length : Natural := 0;
   end record;

end Example_2;
