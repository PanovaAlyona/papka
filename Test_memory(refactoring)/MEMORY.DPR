program memory;

uses
  Forms,
  memory_ in '..\..\Панова\Тест памяти - новый вариант\MEMORY_.PAS' {Form1},
  memory2 in '..\..\Панова\Тест памяти - новый вариант\memory2.pas' {Form2},
  memory3 in '..\..\Панова\Тест памяти - новый вариант\memory3.pas' {Form3},
  Unit4 in '..\..\Панова\Тест памяти - новый вариант\Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
