package body Example_2 is

   ------------
   -- Number --
   ------------

   procedure Reset (N : in out Number) is
   begin
      N := 0;
   end Reset;

   procedure Increment  (N : in out Number; Value : in Integer := 1) is
   begin
      N := N + Number (Value);
   end Increment;

   function To_Integer (N : Number) return Integer is
   begin
      return Integer (N);
   end To_Integer;

   ----------
   -- Date --
   ----------

   function Get_Date return Date is
   begin
      return Default_Date;
   end Get_Date;

   procedure Set_Date
     (D     : in out Date;
      Value :        Date := Default_Date) is
   begin
      D := Value;
   end Set_Date;

   function To_String (D : Date) return String is
   begin
      return D.Year'Img & ":" & D.Month'Img & ":" & D.Day'Img;
   end To_String;

   ---------
   -- Rec --
   ---------

   procedure Save_Name (R : in out Rec; Name : String) is
   begin
      if Name'Length <= R.Max_Length then
         R.Name (1 .. Name'Length) := Name;
         R.Name_Length := Name'Length;
      else
         R.Name := Name (Name'First .. R.Max_Length);
         R.Name_Length := R.Max_Length;
      end if;
   end Save_Name;

   function To_String (R : Rec) return String is
   begin
      return "Name : " & R.Name (1 .. R.Name_Length);
   end To_String;

end Example_2;
