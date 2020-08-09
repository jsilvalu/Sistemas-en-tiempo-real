with GNAT.IO; use GNAT.IO;

--AUTOR: JUAN ANTONIO SILVA LUJÁN
--SESION 03

package body paquete_buffer is
   -- Definir el cuerpo del objeto protegido Buffer_Acotado_t
   protected body Buffer_Acotado_t is
      -- Añadir la la entrada Pon (misma cabecera que en el fichero .ads)
      entry PON (Item : in Integer)
         -- Añadir la condición de acceso a la entrada (buffer no lleno)
           when Nr_En_Buffer < Tamanio_Buffer   is
      -- Comienzo del código de la entrada Pon
      begin
         -- Añadir Item a la posición Ultimo de Buffer
         Buf (Ultimo) := Item;
         -- Mostrar un mensaje indicando que se ha añadido el dato almacenado en la posición Ultimo de Buffer
         put_line("Dato INSERTADO ---> " & integer'Image(Buf(Ultimo)));
         -- Actualizar Ultimo
         Ultimo := Ultimo + 1;
         -- Actualizar Cuenta
         Nr_En_Buffer := Nr_En_Buffer + 1;
      --Fin del código de la entrada Pon
      end;
      
      -- Añadir la la entrada Quita (misma cabecera que en el fichero .ads)
     entry QUITA (Item : out Integer)
         -- Añadir la condición de acceso a la entrada (buffer no vacío)
         when Nr_En_Buffer > 0
      -- Comienzo del código de la entrada Quita
      is begin
         -- Almacenar en Item el contenido de la posición Primero de Buffer
         Item := Buf (Primero);

         -- Actualizar Primero
         Primero := Primero + 1;
         -- Actualizar Cuenta
         Nr_En_Buffer := Nr_En_Buffer - 1;
		 -- Mostrar un mensaje indicando que se ha leido el dato Item
                 put_line("Dato LEIDO ---> " & integer'Image(Item));
         --Fin del código de la entrada Quita 
         end;
      
      
      
   -- Fin del cuerpo del del objeto protegido Buffer_Acotado_t
   end Buffer_Acotado_t;
   end paquete_buffer;
