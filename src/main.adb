with Ada.Text_IO;
with Client_1;
with Client_2;

procedure Main is

   --  En Ada podemos declarar procedimientos y funciones dentro de
   --  procedimientos y funciones. Aqui tienes un ejemplo!

   procedure Ejemplo_De_Procedimiento_Anidado is
   begin
      Ada.Text_IO.Put_Line ("======================== Client_1");
      Client_1;

      Ada.Text_IO.Put_Line ("======================== Client_2");
      Client_2;
   end Ejemplo_De_Procedimiento_Anidado;

begin
   --  Si al realizar la practica te molesta la salida inicial de los
   --  ejemplos, elimina o comenta la siguiente linea (que se encarga
   --  de llamar a los procedimientos client_1 y client_2).
   Ejemplo_De_Procedimiento_Anidado;

   --  Anade aqui llamadas a los procedimientos y funciones que anadas
   --  al paquete Lab (ficheros lab.ads y lab.adb).
   --  ...

end Main;
