{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program precioIva;

//const
  //Precio:real = 200;
  //Iva:real =21 ;
  //Precio_iva:real =42;

//listado de funciones

//function sumar(a,b: real): real;

//begin
//result:= a + b;
//end;

//function multiplicar(a,b,c: real): real;

//begin
//result:= a * b * c;
//end;


//programa principal
//begin
 
  //writeln ('el precio sin Iva es...');
  //writeln (Precio:0:2);
  
  //write(' Precio ', Precio:0:2);
  //writeln(' Iva ', multiplicar(Precio, 0.01 , Iva):0:0); //de aqui sale el valor de Precio_iva
  
  //write(' Precio con Iva ');
  //writeln(sumar(Precio,Precio_iva):0:2 );


procedure precio_con_iva(a,b: real;var sumar: real); // considero que es mas sencillo y adecuado usar una funcion porque es mas sencillo de realizar
  begin
     sumar := (a + b);
  end;
  
procedure valor_precio_iva(a,b,c: real;var multiplicar: real); // considero que es mas sencillo y adecuado usar una funcion porque es mas sencillo de realizar
  begin
    multiplicar := (a * 0.01 * c);
  end;
  
  var
  precio, iva, precio_iva: real;
  sumar: real;
  multiplicar: real;

//programa principal
begin
  precio := 200;
  iva := 21;
  precio_iva := 42;
  
  sumar := (precio + precio_iva);
  multiplicar := (precio * 0.01 * iva);
  
  write (' El precio sin Iva es: ');
  writeln (precio:0:2);
  
  write(' El precio con iva es: ');
  writeln(sumar:0:2);

  
  write(' El valor del iva es: ');
    writeln(multiplicar:0:2);

end.
