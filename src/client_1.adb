with Ada.Text_IO; use Ada.Text_IO;
with Example_1;

procedure Client_1 is
   Tmp_1 : Integer := Example_1.V1;
   Tmp_2 : Integer := (if Tmp_1 > 0 then Example_1.V2 else Example_1.V3);

   use Example_1;
   Tmp_3 : My_Int_Type := -1;

begin
   Put_Line ("*** Mod_Int'Range");

   for J in Mod_Int'Range loop
      Put (J'Img);
   end loop;
   New_Line;

   Put_Line ("*** Week_Day'Range (shown in reverse order)");

   for J in reverse Week_Day'First .. Week_Day'Last loop
      Put (J'Img);
      Put (' ');
   end loop;
   New_Line;

   declare
      Some_Day : Example_1.Date := Example_1.Default_Date;
   begin
      if Some_Day.Year /= 2018 then
         Some_Day := (10, September, 2018, Monday);
      end if;
   end;

   declare
      Name   : constant String := "Programacion III";
      My_Rec : Rec_2 (Max_Length => Name'Length);
   begin
      My_Rec.Name := Name;
      My_Rec.Name_Length := Name'Length;
      Put_Line (My_Rec.Name (1 .. My_Rec.Name_Length));

      My_Rec.Name_Length := My_Rec.Name_Length - 3;
      Put_Line (My_Rec.Name (1 .. My_Rec.Name_Length));
   end;

   declare
      My_Table : Table_2 (1 .. 10);
   begin
      for J in My_Table'Range loop
         My_Table (J) := 2 * J;
      end loop;
   end;

   declare
      X      : constant Integer := -100;
      Y      : Integer;
      Result : Integer := 0;
   begin
      Y := Absolute_Value (X);

      while Y < 120 loop
         Result := Result + Y;
         Y := Next_Value (Y);
      end loop;
      Put_Line (Result'Img);
   end;

end Client_1;
