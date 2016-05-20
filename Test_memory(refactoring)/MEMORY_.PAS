unit memory_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    yp1: TRadioButton;
    yp2: TRadioButton;
    yp3: TRadioButton;
    yp4: TRadioButton;
    yp5: TRadioButton;
    yp6: TRadioButton;
    yp7: TRadioButton;
    yp8: TRadioButton;
    yp9: TRadioButton;
    yp10: TRadioButton;
    information: TButton;
    Exit: TButton;
    HappySmile: TImage;
    SadSmile: TImage;
    KindSmile: TImage;
    Info: TButton;
    VerySadSmile: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    btn1: TButton;
    GroupBox2: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure yp2Click(Sender: TObject);
    procedure yp3Click(Sender: TObject);
    procedure yp4Click(Sender: TObject);
    procedure yp5Click(Sender: TObject);
    procedure yp6Click(Sender: TObject);
    procedure yp7Click(Sender: TObject);
    procedure yp8Click(Sender: TObject);
    procedure yp9Click(Sender: TObject);
    procedure yp10Click(Sender: TObject);
    procedure informationClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure InfoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure yp1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

uses memory2, memory3, Unit4;

var
  numb: integer;  // число, которое должен запомнить испытуемый
  right: integer; // количество правильно запомненных чисел
  n: integer;     // счетчик чисел
  KC:Integer = 3;   // разрядность числа (кол-во цифр)
  LT:integer = 10;  // количество чисел (длинна теста)
  schet:boolean;
  mem,str:string;
  numberofgames:Integer; //количество игр сыгранных
  List: array[1..30] of string; // список
  today: TDateTime;
{$R *.dfm}

// генерирует k - разрядное число
function GetNumb(k: integer) : integer;
var
  n: integer; // генерируемое число
  i: integer;
begin
  // процедура генерирует число по разрядам
  // начиная со старшего

  n:= Random(9)+1; // старший разряд не может быть нулем
  // остальные разряды
  for i := 1 to (k-1) do
    n := n*10 + Random(10);

  GetNumb := Abs(n);
end;

procedure printInform (k:Integer);
begin
  if k = 0 then numbLevel = "Уровень не выбран"
  else numbLevel = IntToStr(k);
  List[numberofgames]:='Сложность: уровень'+ numbLevel + #9+
            'Итог: '+IntToStr(right)+' из '+IntTOStr(LT);
end;

procedure printResult (k:string);
begin
  Label1.Caption := 'Результат:' + #13 +
            'Показано чисел:  ' + IntToStr(LT) + #13 +
            'Правильных:  ' + IntToStr(right)+ #13+#13 + k;
end;

procedure paramRB (k:Integer);
begin
  if k>6 then KC:=9 else KC:=k+2;
  Form1.Caption:='Тест памяти - уровень' + IntToStr(k);
  case k of
  1..4: Timer1.Interval := 1000;
  5: Timer1.Interval := 1200;
  6: Timer1.Interval := 1500;
  7: Timer1.Interval := 3000;
  8: Timer1.Interval := 2700;
  9: Timer1.Interval := 2500;
  10: Timer1.Interval := 2200;
end;

procedure FormOnCreate; //параметры элементов формы при создании
begin
  Edit1.Visible := False;  // скрыть поле ввода Edit1
  Edit1.MaxLength := 12;   // кол-во символов, которое можно ввести
  Label1.WordWrap := True; // разрешить перенос слов на следующую строку
  Label1.Font.Size := 11;
  Label4.Font.Size := 11;
  Label1.Caption :=
  'Сейчас на экране будут появляться числа. ' +
  'Вы должны запомнить число, набрать его на клавиатуре и нажать <Enter>';
  Label4.Caption := 'Сейчас на экране будет показан набор '+#13#10+
                    'картинок, затем одна из них будет'+ #13#10+
                    'заменена. Вам необходимо определить'+#13#10+
                    'какую из картинок заменили.';
  Button1.Caption := 'Начать';
  Timer1.Enabled := False;    // таймер остановлен
  Timer1.Interval := 1000;    // время показа числа - 1 секунда
end;

procedure Button1PressStart; //параметры элементов формы после нажатия кнопки "Завершить"
begin
  Form1.Caption:='Тест памяти';
  Edit1.Visible := False;  // скрыть поле ввода Edit1
  Edit1.MaxLength := 9;   // кол-во символов, которое можно ввести
  Label1.WordWrap := True; // разрешить перенос слов на следующую строку
  Label1.Font.Size := 11;
  Label1.Caption :=
  'Сейчас на экране будут появляться числа. ' +
  'Вы должны запомнить число, набрать его на клавиатуре и нажать <Enter>';
  Button1.Caption := 'Начать';
  Timer1.Enabled := False;    // таймер остановлен
  Timer1.Interval := 1000;    // время показа числа - 1 секунда
end;

procedure Button1PressEnd;  //параметры элементов формы после нажатия кнопки "Начать"
begin
  Inc(numberofgames);
      Button1.Caption := 'Завершить';
      Button1.Visible := False;  // скрыть кнопку
      GroupBox1.Visible := False; //скрыть панель выбора уровня
      information.Visible:= False; //скрыть кнопку информации
      Exit.Visible := False; //скрыть кнопку выхода
      // кнопка Button1 станет доступной после того
      // как испытание закончится
      Label1.Caption := '';
      Label1.Font.Size := 24;       // размер шрифта поля Label1
      Edit1.Font.Size := 24;        // размер шрифта поля Edit1

      // сгенерировать и вывести число
      numb := GetNumb(KC);
      Label1.Caption := IntToStr(numb);

      Timer1.Enabled := True;       // запуск таймера
      // процедура обработки сигнала от таймера
      // "сотрет" число
      Info.Visible := True;
end;

procedure returnPageEnter;  //возарат на главную страницу
begin
  GroupBox1.Visible := True; //открыть панель выбора уровня
  information.Visible := True; //открыть кнопку информации
  Exit.Visible := True; //открыть кнопку выхода
  SadSmile.Visible := False;
  HappySmile.Visible := False;
  KindSmile.Visible := False;
  VerySadSmile.Visible := False;
  Info.Visible := False;
end;

procedure openListOfPlay;   //Информация о пройденных тестах
begin
  AssignFile(f,'information.txt');
  Append(f);
  today := Now;
  intxt := 'Тест №'+IntToStr(numberofgames)+ #13#10+'Дата теста: ' + DateToStr(today) + #9+' Время: ' + TimeToStr(today) +
     #13#10 +List [numberofgames] + #13;
  Writeln(f,intxt);
  CloseFile(f);
end;

// создание формы
procedure TForm1.FormCreate(Sender: TObject);
begin
  FormOnCreate;  //параметры элементов формы при создании

  right := 0;    // кол-во правильных ответов
  n := 0;    // счетчик чисел
  Randomize;     // инициализация ГСЧ
  schet:=false;
end;

// щелчок на кнопке "Начать/Завершить"
procedure TForm1.Button1Click(Sender: TObject);
var
  intxt: string;
  f:TextFile;

begin
  if Button1.Caption = 'Завершить' then
  begin
     Button1PressStart;

     //Создаем список игр
        if yp1.Checked then
            printInform(1);

        else if yp2.Checked then
          printInform(2);

        else if yp3.Checked then
          printInform(3);

        else if yp4.Checked then
          printInform(4);

        else if yp5.Checked then
          printInform(5);

        else if yp6.Checked then
          printInform(6);

        else if yp7.Checked then
          printInform(7);

        else if yp8.Checked then
          printInform(8);

        else if yp9.Checked then
          printInform(9);

        else if yp10.Checked then
          printInform(10);

        else printInform(0);

        right := 0;    // кол-во правильных
        n := 0;    // счетчик чисел
        Randomize;     // инициализация ГСЧ
        schet:=true;
        mem:='';

        returnPageEnter;  //возарат на главную страницу
        openListOfPlay;  //Информация о пройденных тестах

  end;
  if (Button1.Caption = 'Начать') and (schet) then
  begin
      Button1PressEnd;
    end;
    schet:=false;
end;

// обработка события таймера
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False; // остановить таймер
  Label1.Visible := False; // скрыть число
  Edit1.Visible := True;   // сделать доступным поле Edit1
  Edit1.SetFocus;          // установить курсор в поле Edit1
end;

// нажатие клавиш в поле Edit1
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  igrok: integer;  // число, которое ввел испытуемый
begin
    case Key of
        '0'..'9',#8:  ; // клавиши "0"-"9",<Backspace>

        #13:            // клавиша <Enter>
    begin
        igrok := StrToInt(Edit1.Text);
        mem:=mem+#13#10+'Число - '+IntToStr(numb)+' Введенное число - '+IntToStr(igrok);
        if (igrok = numb) then begin
          Inc(right);
          mem:=mem+' Результат: правильно';
        end
        else
          mem:=mem+' Результат: неправильно';


        Inc(n); // счетчик чисел

        Edit1.Text := '';
        Edit1.Visible := False;   // скрыть поле Edit1

        if n < LT then
        begin
          numb := GetNumb(KC); // сгенерировать следующее число
          Label1.Caption := IntToStr(numb); // отобразить число
          Label1.Visible := True;
          Timer1.Enabled := True;           // пуск таймера
        end
        else begin
          // испытание закончено
          // вывести результат

          Label1.Font.Size := 10;
          if (right = 0) then begin
            printResult('Banana?...');
            VerySadSmile.Visible := True;
          end
          else if (right <= (LT/2)) and (right>0) then begin
            printResult('Вам стоит потренировать память :(');
            SadSmile.Visible := True;
          end
          else if (right > (LT/2)) and (right < LT) then begin
            printResult('У Вас хорошая память :)');
            KindSmile.Visible := True;
          end
          else if right = LT then begin
            printResult('У Вас отличная память! :D');
            HappySmile.Visible := True;
          end;
          Label1.Visible := True;
          Button1.Visible := True;    // показывается кнопка "Завершить"
        end;
    end;
    else Key := Chr(0);
    end;
end;

procedure TForm1.yp1Click(Sender: TObject);
begin
  paramRB(1);
end;


procedure TForm1.yp2Click(Sender: TObject);
begin
  paramRB(2);
end;

procedure TForm1.yp3Click(Sender: TObject);
begin
  paramRB(3);
end;

procedure TForm1.yp4Click(Sender: TObject);
begin
  paramRB(4);
end;

procedure TForm1.yp5Click(Sender: TObject);
begin
  paramRB(5);
end;

procedure TForm1.yp6Click(Sender: TObject);
begin
  paramRB(6);
end;

procedure TForm1.yp7Click(Sender: TObject);
begin
  paramRB(7);
end;

procedure TForm1.yp8Click(Sender: TObject);
begin
  paramRB(8);
end;

procedure TForm1.yp9Click(Sender: TObject);
begin
  paramRB(9);
end;

procedure TForm1.yp10Click(Sender: TObject);
begin
  paramRB(10);
end;

//Информация о пройденных тестах
procedure TForm1.informationClick(Sender: TObject);
var
  sl: TStringList;
begin
  begin
  sl:= TStringList.Create;
  try
    sl.LoadFromFile('information.txt');
    str := sl.Text;
  finally
    sl.Free;
  end;
  //ShowMessage(str);
  Form3:=TForm3.Create(Application);
  Form3.MemoForm3.Clear;
  Form3.MemoForm3.Lines.Add(str);
  Form3.Show;
  end;
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.InfoClick(Sender: TObject);
begin
  Form2:=TForm2.Create(Application); // Сделай Create для формы в которую надо передать данные и потом делай что хочешь
  Form2.Caption:='Тест №'+IntToStr(numberofgames);
  Form2.Memo1.Clear;
  Form2.Memo1.Lines.Add(mem);
  Form2.Show;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  line:string;
  f:TextFile;
begin
  if numberofgames<>0 then begin
    AssignFile(f,'information.txt');
    Append(f);
    line := '-------------------------------';
    Writeln(f,line);
    CloseFile(f);
    end;
end;

//тест с картинками
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form4:=TForm4.Create(Application);
  if rb1.Checked then begin
    Form4.tmr1.Interval:=9000;
    Form4.edt1.Text:='1';
  end;
  if rb2.Checked then begin
    Form4.tmr1.Interval:=8000;
    Form4.edt1.Text:='2';
  end;
  if rb3.Checked then begin
    Form4.tmr1.Interval:=7000;
    Form4.edt1.Text:='3';
  end;
  if rb4.Checked then begin
    Form4.tmr1.Interval:=6000;
    Form4.edt1.Text:='4';
  end;
  Form4.Show;
end;

procedure TForm1.btn1Click(Sender: TObject);
  var
  sl: TStringList;
begin
  begin
  sl:= TStringList.Create;
  try
    sl.LoadFromFile('information2.txt');
    str := sl.Text;
  finally
    sl.Free;
  end;
  //ShowMessage(str);
  Form3:=TForm3.Create(Application);
  Form3.MemoForm3.Clear;
  Form3.MemoForm3.Lines.Add(str);
  Form3.Show;
  end;
end;

end.
