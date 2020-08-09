package body controlador is
   -- Implementaci�n del cuerpo del objeto protegido ControladorSigInt
   protected body ControladorSigInt is
      -- Implementaci�n del procedimiento Interrupcion que lo �nico que hace es poner Ocurrencia a verdadero (se ejecutar� cuando ocurra la interrupci�n)
      procedure Interrupcion is begin
         Ocurrencia := True;
      end;
      -- Implementaci�n de la entrada Wait que esperar� a que Ocurrencia sea verdadera y lo �nico que hace es volver a ponerla a falso
      entry Wait when Ocurrencia = True is
      begin
         Ocurrencia := False;
      end;
   -- Fin del objeto protegido ControladorSigInt
   end ControladorSigInt;
end controlador;
