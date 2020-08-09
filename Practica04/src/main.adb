with GNAT.IO;  use GNAT.IO;
with paquetebarrera;  use paquetebarrera;
------------------------------------------------------------------------------
-- Juan Antonio Silva Lujan - Entrega P4
-------------------------------------------------------------------------------
procedure Main is
   -- Definir una constante NumTareas para indicar el n�mero de tareas que se bloquear�n en la barrera
   NumTareas : constant Natural := 10;
   -- Definir el tipo PBarrera_t de tipo puntero a Barrera_t
   type PBarrera_t is access all Barrera_t;
   -- Definir una variable B de tipo Barrera_t permitiendo que se acceda a su direcci�n de memoria (aliased). Usaremos NumTareas como par�metro constructor
   B : aliased Barrera_t (NumTareas);
   -- Dejinir el tipo tarea EntrandoEnBarrera con un par�metro B de tipo PBarrera_t
   task type EntrandoEnBarrera (B:PBarrera_t);
   -- Implementar el cuerpo del tipo tarea
   task body EntrandoEnBarrera
   is begin
      Put_Line("_Entrando en la barrera");
      -- Invocar al procedimiento SincronizarEnBarrera pasando B.all como par�metro (B es un puntero a Barrera_t y el procedimiento recibe un Barrera_t)
      SincronizarEnBarrera(B.all);

      Put_Line(" Saliendo de la barrera");
   end;
   -- Definir un array de tipo EntrandoEnBarrera con NumTareas elementos. Usar la direcci�n de B ('Access) como par�metro de EntrandoEnBarrera
   arrayTareas: array(1..NumTareas) of EntrandoEnBarrera (B'Access);
begin
   null;
end Main;
