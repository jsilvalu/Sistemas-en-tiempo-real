package body paquetebarrera is
   ------------------------------------------------------------------------------
-- Juan Antonio Silva Lujan - Entrega P4
-------------------------------------------------------------------------------
   -- Definir el cuerpo del objeto Barrera_t
   protected body Barrera_t is
      -- Implementar el procedimiento Entrando del objeto protegido que se encargará de incrementar el contador
      procedure Entrando is
      begin
      Contador := Contador+ 1;
      end;

      -- Implementar la entrada Wait incluyendo la condición de paso (no han llegado a la barrera el número de tareas indicado). En el código, no hace nada, sólo bloquea.
      entry Wait
            when Contador = Tareas is
            begin
         null;
            end;

      -- Implementar el procedimiento Resetear que pone el contador a 0
      procedure Resetear is
            begin
            Contador := 0;
   -- Fin del objeto protegido
      end;
      end Barrera_t;

   -- Implementación del procedimiento SincronizarEnBarrera
      procedure SincronizarEnBarrera(B: in out Barrera_t) is
      begin
      -- Invoca al procedimiento Entrando de la barrera
      B.Entrando;
      -- Invoca a la entrada Wait de la barrera
      B.Wait;
   -- Fin del procedimiento SincronizarEnBarrera
   end;

   -- Implementación del procedimiento SincronizarEnBarrera
      procedure ResetearBarrera (B: in out Barrera_t) is
            begin
      -- Invoca al procedimiento Resetear de la barrera
            B.Resetear;
   -- Fin del procedimiento ResetearBarrera
            end;
end paquetebarrera;
