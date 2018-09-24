package body Example_1 is

   ----------------------------------------------------------------------------
   --  Declaraciones de constantes y variables globales internas al paquete  --
   ----------------------------------------------------------------------------

   Max           : constant Positive := 100;
   Initial_Value : Positive := Max /2 * V1;

   --------------------
   -- Absolute_Value --
   --------------------

   function Absolute_Value (X : Integer) return Integer is
   begin
      if X >= 0 then
         return X;
      else
         return -X;
      end if;
   end Absolute_Value;

   ---------
   -- Add --
   ---------

   procedure Add (X : in out Integer; Value : Integer := 1) is
   begin
      X := X + Value;
   end Add;

   ---------
   -- Set --
   ---------

   procedure Set (X : out Integer; Value : Integer) is
   begin
      X := Value;
   end Set;

   -----------------
   -- Day_Message --
   -----------------

   function Day_Message (Day : Week_Day) return Text is
   begin
      case Day is
         when Monday =>
            return "First day";
            
         when Tuesday .. Friday =>
            return "Work day!";

         when others =>
            return "Week end!";
      end case;

   end Day_Message;
   
end Example_1;
