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
  numb: integer;  // �����, ������� ������ ��������� ����������
  right: integer; // ���������� ��������� ����������� �����
  n: integer;     // ������� �����
  KC:Integer = 3;   // ����������� ����� (���-�� ����)
  LT:integer = 10;  // ���������� ����� (������ �����)
  schet:integer; //�������� 0 ��� 1, �������� ��� ������� if
  mem,str:string;
  numberofgames:Integer; //���������� ��� ���������
  List: array[1..30] of string; // ������
  today: TDateTime;
{$R *.dfm}

// ���������� k - ��������� �����
function GetNumb(k: integer) : integer;
var
  n: integer; // ������������ �����
  i: integer;
begin
  // ��������� ���������� ����� �� ��������
  // ������� �� ��������

  n:= Random(9)+1; // ������� ������ �� ����� ���� �����
  // ��������� �������
  for i := 1 to (k-1) do
    n := n*10 + Random(10);

  GetNumb := Abs(n);
end;

// �������� �����
procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Visible := False;  // ������ ���� ����� Edit1
  Edit1.MaxLength := 12;   // ���-�� ��������, ������� ����� ������
  Label1.WordWrap := True; // ��������� ������� ���� �� ��������� ������
  Label1.Font.Size := 11;
  Label4.Font.Size := 11;
  Label1.Caption :=
  '������ �� ������ ����� ���������� �����. ' +
  '�� ������ ��������� �����, ������� ��� �� ���������� � ������ <Enter>';
  Label4.Caption := '������ �� ������ ����� ������� ����� '+#13#10+
                    '��������, ����� ���� �� ��� �����'+ #13#10+
                    '��������. ��� ���������� ����������'+#13#10+
                    '����� �� �������� ��������.';
  Button1.Caption := '������';
  Timer1.Enabled := False;    // ������ ����������
  Timer1.Interval := 1000;    // ����� ������ ����� - 1 �������

  right := 0;    // ���-�� ����������
  n := 0;    // ������� �����
  Randomize;     // ������������� ���
  schet:=0;



end;

// ������ �� ������ "������/���������"
procedure TForm1.Button1Click(Sender: TObject);
var
  intxt: string;
  f:TextFile;

begin
  if Button1.Caption = '���������' then
  begin
     //Form1.Close; // ������� ���� ���������
       Form1.Caption:='���� ������';
       Edit1.Visible := False;  // ������ ���� ����� Edit1
        Edit1.MaxLength := 9;   // ���-�� ��������, ������� ����� ������
        Label1.WordWrap := True; // ��������� ������� ���� �� ��������� ������
        Label1.Font.Size := 11;
        Label1.Caption :=
        '������ �� ������ ����� ���������� �����. ' +
        '�� ������ ��������� �����, ������� ��� �� ���������� � ������ <Enter>';
        Button1.Caption := '������';
        Timer1.Enabled := False;    // ������ ����������
        Timer1.Interval := 1000;    // ����� ������ ����� - 1 �������

                //������� ������ ���
        if yp1.Checked then
          List[numberofgames]:='���������: ������� 1   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);
          

        if yp2.Checked then
          List[numberofgames]:='���������: ������� 2   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp3.Checked then
          List[numberofgames]:='���������: ������� 3   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp4.Checked then
          List[numberofgames]:='C��������: ������� 4   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp5.Checked then
          List[numberofgames]:='���������: ������� 5   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp6.Checked then
          List[numberofgames]:='���������: ������� 6   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp7.Checked then
          List[numberofgames]:='���������: ������� 7   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp8.Checked then
          List[numberofgames]:='���������: ������� 8   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp9.Checked then
          List[numberofgames]:='���������: ������� 9   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if yp10.Checked then
          List[numberofgames]:='���������: ������� 10   '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        if not(yp1.Checked) and not(yp2.Checked)and not(yp3.Checked)and not(yp4.Checked)and
          not(yp5.Checked)and not(yp6.Checked)and not(yp7.Checked)and not(yp8.Checked)and
          not(yp9.Checked)and not(yp10.Checked) then
          List[numberofgames]:='���������: "������� �� ������" '+ #9+
            '����: '+IntToStr(right)+' �� '+IntTOStr(LT);

        right := 0;    // ���-�� ����������
        n := 0;    // ������� �����
        Randomize;     // ������������� ���
        schet:=1;
        GroupBox1.Visible := True; //������� ������ ������ ������
        information.Visible := True; //������� ������ ����������
        Exit.Visible := True; //������� ������ ������
        SadSmile.Visible := False;
        HappySmile.Visible := False;
        KindSmile.Visible := False;
        VerySadSmile.Visible := False;
        Info.Visible := False;
        mem:='';

      AssignFile(f,'information.txt');
      Append(f);
      today := Now;
      intxt := '���� �'+IntToStr(numberofgames)+ #13#10+'���� �����: ' + DateToStr(today) + #9+' �����: ' + TimeToStr(today) +
        #13#10 +List [numberofgames] + #13;
      Writeln(f,intxt);
      CloseFile(f);

  end;
  if (Button1.Caption = '������') and (schet<>1) then
  begin
      numberofgames:=numberofgames+1;
      Button1.Caption := '���������';
      Button1.Visible := False;  // ������ ������
      GroupBox1.Visible := False; //������ ������ ������ ������
      information.Visible:= False; //������ ������ ����������
      Exit.Visible := False; //������ ������ ������
      // ������ Button1 ������ ��������� ����� ����
      // ��� ��������� ����������
      Label1.Caption := '';
      Label1.Font.Size := 24;       // ������ ������ ���� Label1
      Edit1.Font.Size := 24;        // ������ ������ ���� Edit1

      // ������������� � ������� �����
      numb := GetNumb(KC);
      Label1.Caption := IntToStr(numb);

      Timer1.Enabled := True;       // ������ �������
      // ��������� ��������� ������� �� �������
      // "������" �����
      Info.Visible := True;
    end;
    schet:=0;
end;

// ��������� ������� �������
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False; // ���������� ������
  Label1.Visible := False; // ������ �����
  Edit1.Visible := True;   // ������� ��������� ���� Edit1
  Edit1.SetFocus;          // ���������� ������ � ���� Edit1
end;

// ������� ������ � ���� Edit1
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  igrok: integer;  // �����, ������� ���� ����������
begin
    case Key of
        '0'..'9',#8:  ; // ������� "0"-"9",<Backspace>

        #13:            // ������� <Enter>
    begin
        igrok := StrToInt(Edit1.Text);
        mem:=mem+#13#10+'����� - '+IntToStr(numb)+' ��������� ����� - '+IntToStr(igrok);
        if (igrok = numb) then begin
          right := right + 1;
          mem:=mem+' ���������: ���������';
        end
        else
          mem:=mem+' ���������: �����������';


        n := n + 1; // ������� �����

        Edit1.Text := '';
        Edit1.Visible := False;   // ������ ���� Edit1

        if n < LT then
        begin
          numb := GetNumb(KC); // ������������� ��������� �����
          Label1.Caption := IntToStr(numb); // ���������� �����
          Label1.Visible := True;
          Timer1.Enabled := True;           // ���� �������
        end
        else begin
          // ��������� ���������
          // ������� ���������

          Label1.Font.Size := 10;
          if (right = 0) then begin
            Label1.Caption := '���������:' + #13 +
            '�������� �����:  ' + IntToStr(LT) + #13 +
            '����������:  ' + IntToStr(right)+ #13+#13 +
            'Banana?...';
            VerySadSmile.Visible := True;
          end
          else if (right <= (LT/2)) and (right>0) then begin
          Label1.Caption := '���������:' + #13 +
            '�������� �����:  ' + IntToStr(LT) + #13 +
            '����������:  ' + IntToStr(right)+ #13+#13 +
            '��� ����� ������������� ������ :(';
            SadSmile.Visible := True;
          end
          else if (right > (LT/2)) and (right < LT) then begin
          Label1.Caption := '���������:' + #13 +
            '�������� �����:  ' + IntToStr(LT) + #13 +
            '����������:  ' + IntToStr(right)+ #13+#13 +
            '� ��� ������� ������ :)';
            KindSmile.Visible := True;
          end
          else if right = LT then begin
          Label1.Caption := '���������:' + #13 +
            '�������� �����:  ' + IntToStr(LT) + #13 +
            '����������:  ' + IntToStr(right)+ #13+#13 +
            '� ��� �������� ������! :D';
            HappySmile.Visible := True;
          end;
          Label1.Visible := True;
          Button1.Visible := True;    // ������������ ������ "���������"
        end;
    end;
    else Key := Chr(0);
    end;
end;

procedure TForm1.yp1Click(Sender: TObject);
begin
  KC := 3;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 1';
end;


procedure TForm1.yp2Click(Sender: TObject);
begin
  KC := 4;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 2';
  Timer1.Interval := 1000;
end;

procedure TForm1.yp3Click(Sender: TObject);
begin
  KC := 5;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 3';
  Timer1.Interval := 1000;
end;

procedure TForm1.yp4Click(Sender: TObject);
begin
  KC := 6;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 4';
  Timer1.Interval := 1000;
end;

procedure TForm1.yp5Click(Sender: TObject);
begin
  KC := 7;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 5';
  Timer1.Interval := 1200;
end;

procedure TForm1.yp6Click(Sender: TObject);
begin
  KC := 8;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 6';
  Timer1.Interval := 1500;
end;

procedure TForm1.yp7Click(Sender: TObject);
begin
  KC := 9;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 7';
  Timer1.Interval := 3000;
end;

procedure TForm1.yp8Click(Sender: TObject);
begin
  KC := 9;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 8';
  Timer1.Interval := 2700;
end;

procedure TForm1.yp9Click(Sender: TObject);
begin
  KC := 9;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 9';
  Timer1.Interval := 2500;
end;

procedure TForm1.yp10Click(Sender: TObject);
begin
  KC := 9;   // ����������� ����� (���-�� ����)
  LT := 10;  // ���������� ����� (������ �����)
  Form1.Caption:='���� ������ - ������� 10';
  Timer1.Interval := 2200;
end;

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
  Form2:=TForm2.Create(Application); // ������ Create ��� ����� � ������� ���� �������� ������ � ����� ����� ��� ������
  Form2.Caption:='���� �'+IntToStr(numberofgames);
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

//���� � ����������
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
