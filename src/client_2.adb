with Ada.Text_IO; use Ada.Text_IO;
with Example_2; use Example_2;

procedure Client_2 is
   My_Number : Number;
   My_Date   : Date;
   My_Rec    : Rec (100);

begin
   Reset (My_Number);
   Increment (My_Number, 50);
   Put_Line (To_Integer (My_Number)'Img);   

   Increment (My_Number);
   Put_Line (To_Integer (My_Number)'Img);   

   My_Date := Default_Date;
   Put_Line (To_String (My_Date));

   Save_Name (My_Rec, "Programacion III");
   Put_Line (To_String (My_Rec));
end Client_2;
