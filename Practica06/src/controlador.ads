-- A�adir el paquete  de interrupciones de ADA
with Ada.Interrupts; use Ada.Interrupts;
-- A�adir el paquete  de nombres de interrupciones de ADA
with Ada.Interrupts.Names; use Ada.Interrupts.Names;
package controlador is
   -- Crear un objeto protegido (sin el type) de nombre ControladorSigInt
   protected ControladorSigInt is
      -- Definir un procedimiento Interrupcion sin par�metros
      procedure Interrupcion;
      -- Definir una entrada Wait sin par�metros
      entry Wait;
      -- Incluir el pragma Interrupt_Handler con Interrupcion como par�metro (indica que Interrupcion ser� un manejador de interrupci�n)
      pragma Interrupt_Handler(Interrupcion);
      -- Incluir el pragma Attach_Handler con Interrupcion y Sigint como par�metros (indicar� que Interrupcion manejar� la se�al Sigint)
      pragma Attach_Handler(Interrupcion, Sigint);
      -- Incluir el pragma Unreserve_All_Interrupts sin par�metros (necesario para que se puedan manejar las interrupciones)
      pragma Unreserve_All_Interrupts;
     -- Zona privada del objeto
      private
      --Definir el atributo Ocurrencia como booleano e inicializarlo a falso
      Ocurrencia : Boolean := False;
   --Fin de ControladorSigInt
   end;
end controlador;
