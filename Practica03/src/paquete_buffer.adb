with GNAT.IO; use GNAT.IO;

--AUTOR: JUAN ANTONIO SILVA LUJ�N
--SESION 03

package body paquete_buffer is
   -- Definir el cuerpo del objeto protegido Buffer_Acotado_t
   protected body Buffer_Acotado_t is
      -- A�adir la la entrada Pon (misma cabecera que en el fichero .ads)
      entry PON (Item : in Integer)
         -- A�adir la condici�n de acceso a la entrada (buffer no lleno)
           when Nr_En_Buffer < Tamanio_Buffer   is
      -- Comienzo del c�digo de la entrada Pon
      begin
         -- A�adir Item a la posici�n Ultimo de Buffer
         Buf (Ultimo) := Item;
         -- Mostrar un mensaje indicando que se ha a�adido el dato almacenado en la posici�n Ultimo de Buffer
         put_line("Dato INSERTADO ---> " & integer'Image(Buf(Ultimo)));
         -- Actualizar Ultimo
         Ultimo := Ultimo + 1;
         -- Actualizar Cuenta
         Nr_En_Buffer := Nr_En_Buffer + 1;
      --Fin del c�digo de la entrada Pon
      end;
      
      -- A�adir la la entrada Quita (misma cabecera que en el fichero .ads)
     entry QUITA (Item : out Integer)
         -- A�adir la condici�n de acceso a la entrada (buffer no vac�o)
         when Nr_En_Buffer > 0
      -- Comienzo del c�digo de la entrada Quita
      is begin
         -- Almacenar en Item el contenido de la posici�n Primero de Buffer
         Item := Buf (Primero);

         -- Actualizar Primero
         Primero := Primero + 1;
         -- Actualizar Cuenta
         Nr_En_Buffer := Nr_En_Buffer - 1;
		 -- Mostrar un mensaje indicando que se ha leido el dato Item
                 put_line("Dato LEIDO ---> " & integer'Image(Item));
         --Fin del c�digo de la entrada Quita 
         end;
      
      
      
   -- Fin del cuerpo del del objeto protegido Buffer_Acotado_t
   end Buffer_Acotado_t;
   end paquete_buffer;
