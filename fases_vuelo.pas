{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program fase_vuelo;

//comprobar si la medida de la velocidad es correcta
function verificar_velocidad (unidad: string): boolean;
begin
  result := (unidad = 'm/s') or (unidad = 'km/h') or (unidad = 'kn');
end;


//pasar unidades a nudos
function cambiar_nudos(a: integer; b: string): real;
begin
    if b = 'm/s' then
       result := (a * 1.944)
    else if b = 'km/h' then
       result := (a * 0.54)
    else if b = 'kn' then
       result := a ;
end;

//velocidad en m/ y km/h
function cambiar_ms(a: integer; b: string): real;
begin
    if b = 'm/s' then
       result := a 
    else if b = 'km/h' then
       result := (a / 3.6)
    else if b = 'kn' then
       result := (a / 1.944);
end;

function cambiar_kmh(a: integer; b: string): real;
begin
    if b = 'km/h' then
       result := a
    else if b = 'm/s' then
       result := (a * 3.6)
    else if b = 'kn' then
       result := (a / 0.54);
end;

//ver en que fase se encuentra
function ver_fase (a:real; S:boolean): string;

begin

  if (a = 0) then
     result := 'Estacionado'
  else if (a < 150) and (S = TRUE) then
     result := 'Despegando'
  else if (a > 150) and (a < 240) and (S = TRUE) then
     result := 'Inicia ascenso'
  else if (a > 240) and ( a <= 520) and (S = TRUE) then
     result := 'Finalizando ascenso'
  else if (a > 520) then
     result := 'Velocidad crucero'
  else if (a > 300) and (a <= 520) and (S = FALSE) then
     result := 'Iniciando descenso'
  else if (a >= 140) and (a <= 300) and (S = FALSE) then
     result := 'Finalizando descenso'
  else if not (a = 0) and (a < 140) and (S = FALSE) then
     result := 'Ha aterrizado';
end;

//establecemos unas variables
var
    unidades: string;
    velocidad: integer;
    aceleracion: boolean;
    
    valor_nudos: real;
    valor_ms: real;
    valor_kmh: real;
    fases_vuelo: string;
    

//Funcion principal

begin
  
    unidades := 'm/s';
    velocidad := 200;
    aceleracion := TRUE;
    
    valor_nudos := cambiar_nudos(velocidad, unidades);
    valor_ms := cambiar_ms(velocidad, unidades);
    valor_kmh := cambiar_kmh(velocidad, unidades);
    fases_vuelo := ver_fase(cambiar_nudos(velocidad, unidades), aceleracion);
    
    writeln(' Calculando velocidad... ');
    write(' La velocidad es: ');
    writeln(velocidad);
    
    write(' La unidad que posee la velocidad es: ');
    writeln(unidades);
    
    write(' El valor de la aceleracion es: ');
    writeln(aceleracion);
    
    writeln(' comprobando si la unidad es valida... ');
    if (verificar_velocidad (unidades)) then
    
    begin
       writeln(' La unidad es correcta ');
       write(' La velocidad es: ');
       write(valor_nudos:0:2);
       write(' kn ');
       write(' Tambien: ');
       write(valor_ms:0:2);
       writeln('m/s ');
       write(' Y ademas: ');
       write(valor_kmh:0:2);
       writeln('km/h ');
       writeln(fases_vuelo);
    end
    else
       writeln(' Unidad no valida ');
end.
