with GNAT.IO; use GNAT.IO;

--AUTOR: JUAN ANTONIO SILVA LUJ�N
--SESION 03

-- Incluir el paquete paquete_buffer (con with y use)
with paquete_buffer; use paquete_buffer;

procedure Main is
   -- Definir una variable de tipo buffer_acotado_t permitiendo el acceso a su direcci�n de memoria (usar la palabra reservada aliased delante del tipo)
   b : Aliased Buffer_Acotado_t;
   -- Definir un tipo PBuffer_Acotado_t de tipo puntero a Buffer_Acotado_t de la forma type TipoPuntero is access all TipoNoPuntero;
  type PBuffer_Acotado_t is access all Buffer_Acotado_t;
   -- Definir un tipo tarea TProductor con un par�metro B de tipo PBuffer_Acotado_t
   task type TProductor (B: PBuffer_Acotado_t);
   -- Implementar el cuerpo del tipo tarea TProductor
   task body TProductor is
   --Comienzo del c�digo de la tarea TProductor
   begin
      -- Desde i igual 1 hasta 50
      for i in 1..50 loop
         -- Llamar al m�todo Pon del objeto B con el par�metro i
            B.PON(i);
         -- Fin para
           end loop;
      -- Fin cuerpo de Tproductor
     end TProductor;

   -- Definir un tipo tarea Tconsumidorl con un par�metro B de tipo PBuffer_Acotado_t
  task type Tconsumidorl (B: PBuffer_Acotado_t);
   -- Implementar el cuerpo del tipo tarea Tproductor
 task body Tconsumidorl is
   -- Definir una variable entera para almacenar el dato le�do
  dato : Integer := 0;
      -- Comienzo del c�digo de la tarea Tconsumidorl
      begin
      -- Desde i igual 1 hasta 50
 for i in 1..50 loop
         -- Llamar al m�todo Quita del objeto B con el par�metro d
 B.QUITA(dato);
      -- Fin para
 end loop;
   -- Fin cuerpo de Tconsumidor
 end;
   -- Definir una variable P de tipo array de 1 hasta 5 de tipo TProductor. Usar la direcci�n de Buffer como par�metro de entrada (atributo Access de Buffer)
  p : array (1..5) of TProductor (b'Access);
   -- Definir una variable C de tipo array de 1 hasta 5 de tipo TConsumidor. Usar la direcci�n de Buffer como par�metro de entrada (atributo Access de Buffer)
   c : array (1..5) of Tconsumidorl (b'Access);
   
   
begin
   null;
end Main;
