unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm4 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    tmr1: TTimer;
    lbl1: TLabel;
    img12: TImage;
    tmr2: TTimer;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    img17: TImage;
    img18: TImage;
    img19: TImage;
    img20: TImage;
    img21: TImage;
    img22: TImage;
    img23: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure img14Click(Sender: TObject);
    procedure img15Click(Sender: TObject);
    procedure img16Click(Sender: TObject);
    procedure img17Click(Sender: TObject);
    procedure img18Click(Sender: TObject);
    procedure img19Click(Sender: TObject);
    procedure img20Click(Sender: TObject);
    procedure img21Click(Sender: TObject);
    procedure img22Click(Sender: TObject);
    procedure img23Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
var
  a:array[1..10] of Integer; //массив номеров jpg картинок открытых на форме
  right2:Integer; //кол-во угаданных картинок
  n:Integer=0; //количество показанных картинок
  MV:Integer = 10;
  k:Integer; //номер картинки которую заменяем
  str:string; //имя открываемой картинки
  Krt:Integer; //номер выбранной пользователем картинки
  i,j:Integer;
  Vay, vayline:string;

function GetTorF(d,f: integer) : Boolean;
begin
  if d=f then
    GetTorF := True;
end;

procedure TForm4.btn2Click(Sender: TObject);
var
  k:Integer;
begin
  n:=0;
  right2:=0;
  if edt1.text='2' then
  Vay:=ExtractFilePath(Application.Exename) +'карточки\';
  if edt1.text='1' then
  Vay:=ExtractFilePath(Application.Exename) +'фигуры\';
  if edt1.text='3' then
  Vay:=ExtractFilePath(Application.Exename) +'смайлы\';
  if edt1.text='4' then
  Vay:=ExtractFilePath(Application.Exename)+ 'линии\';

  vayline:= ExtractFilePath(Application.Exename)+'line\';

  img12.Picture.LoadFromFile(vayline+'0.jpg');
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay +Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    img23.Picture.LoadFromFile(Vay+Str);
  end;
  Tmr1.Enabled:=True;
  btn2.Visible:=False;
  btn1.Visible:=True;
end;

procedure TForm4.tmr1Timer(Sender: TObject);
var
  c:Integer;
  st:string;
begin
  tmr1.Enabled:=False;
  tmr2.Enabled:=True;
  k:=1+Random(10);
  c:=1+Random(15);

    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;

  while c=a[k] do
  begin
    c:=1+Random(15);
  end;
  //ShowMessage('k = '+IntToStr(k)+' a[k] = '+inttostr(a[k])+' c = '+inttostr(c));

  st:=inttostr(c)+'.jpg';
 
  if k=1 then
    img14.Picture.LoadFromFile(Vay+St);
  if k=2 then
    img15.Picture.LoadFromFile(Vay+St);
  if k=3 then
    img16.Picture.LoadFromFile(Vay+St);
  if k=4 then
    img17.Picture.LoadFromFile(Vay+St);
  if k=5 then
    img18.Picture.LoadFromFile(Vay+St);
  if k=6 then
    img19.Picture.LoadFromFile(Vay+St);
  if k=7 then
    img20.Picture.LoadFromFile(Vay+St);
  if k=8 then
    img21.Picture.LoadFromFile(Vay+St);
  if k=9 then
    img22.Picture.LoadFromFile(Vay+St);
  if k=10 then
    Img23.Picture.LoadFromFile(Vay+St);

end;

procedure TForm4.tmr2Timer(Sender: TObject);
begin
  tmr2.Enabled:=False;

    img14.Visible:=True;
    img15.Visible:=True;
    img16.Visible:=True;
    img17.Visible:=True;
    img18.Visible:=True;
    img19.Visible:=True;
    img20.Visible:=True;
    img21.Visible:=True;
    img22.Visible:=True;
    img23.Visible:=True;
end;

procedure TForm4.btn1Click(Sender: TObject);
var
  intxt2:string;
  today2: TDateTime;
  fn:TextFile;
begin
  AssignFile(fn,'information2.txt');
      Append(fn);
      today2 := Now;
      intxt2 := 'Дата теста: ' + DateToStr(today2) + #9+' Время: ' + TimeToStr(today2) +
        #13#10 +'Сложность: уровень '+edt1.text + #9+ ' Итог : '+inttostr(right2)+
        ' из 10' +#13;
      Writeln(fn,intxt2);
      CloseFile(fn);
      Form4.Close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
var
  line:string;
  f:TextFile;
begin
   if n=10 then begin
    AssignFile(f,'information2.txt');
    Append(f);
    line := '-------------------------------';
    Writeln(f,line);
    CloseFile(f);
    end;
end;



procedure TForm4.img14Click(Sender: TObject);
begin
  Krt:=1;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
    for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img15Click(Sender: TObject);
begin
Krt:=2;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
    for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img16Click(Sender: TObject);
begin
Krt:=3;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img17Click(Sender: TObject);
begin
Krt:=4;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img18Click(Sender: TObject);
begin
Krt:=5;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img19Click(Sender: TObject);
begin
Krt:=6;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img20Click(Sender: TObject);
begin
Krt:=7;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then  begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img21Click(Sender: TObject);
begin
Krt:=8;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then begin
   for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img22Click(Sender: TObject);
begin
Krt:=9;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then
  begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

procedure TForm4.img23Click(Sender: TObject);
begin
Krt:=10;
  if GetTorF(krt,k) then
    right2:=right2+1;
  n:=n+1;
  img12.Picture.LoadFromFile(vayline+inttostr(n)+'.jpg');
  if n<MV then
  begin
  for i:=1 to 10 do begin
  j:=1+random(15);
  a[i]:=j;
  //ShowMessage(IntToStr(j));
  str:=inttostr(j)+'.jpg';
  if i=1 then
    Img14.Picture.LoadFromFile(Vay+Str);
  if i=2 then
    Img15.Picture.LoadFromFile(Vay+Str);
  if i=3 then
    Img16.Picture.LoadFromFile(Vay+Str);
  if i=4 then
    Img17.Picture.LoadFromFile(Vay+Str);
  if i=5 then
    Img18.Picture.LoadFromFile(Vay+Str);
  if i=6 then
    Img19.Picture.LoadFromFile(Vay+Str);
  if i=7 then
    Img20.Picture.LoadFromFile(Vay+Str);
  if i=8 then
    Img21.Picture.LoadFromFile(Vay+Str);
  if i=9 then
    Img22.Picture.LoadFromFile(Vay+Str);
  if i=10 then
    Img23.Picture.LoadFromFile(Vay+Str);
  Tmr1.Enabled:=True;
  end;
  end
  else begin
    img14.Visible:=False;
    img15.Visible:=False;
    img16.Visible:=False;
    img17.Visible:=False;
    img18.Visible:=False;
    img19.Visible:=False;
    img20.Visible:=False;
    img21.Visible:=False;
    img22.Visible:=False;
    img23.Visible:=False;
    img12.Visible:=True;
    lbl1.Visible:=True;
    if right2=0 then
    lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Banana?...';
    if (right2>0) and (right2<=5) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'Вам стоит потренировать память! :(';
    if (right2>5) and (right2<10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас хорошая память! :)';
    if (right2=10) then
      lbl1.Caption:='Результат: '+#13#10+'Всего показано: 10'+#13#10+
      'Правильных: '+inttostr(right2)+#13#10+'У Вас отличная память! :D';

  end;
end;

end.
