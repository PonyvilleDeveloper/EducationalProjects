program Automated_graphing_of_functions_and_solving_equations;

uses crt, graphABC;

var
 X, Y: integer;
 a, b, c, k, x1, x2, D, Root, Value: real;
 Equation: char;

function Finding_the_root_of_a_linear_equation(k, b, Value: real): real;
begin
 Finding_the_root_of_a_linear_equation := (Value - b) / k
end;

function Inverse_Proportionality_Root(k, Value: real): real;
begin
 Inverse_Proportionality_Root := k / Value;
end;

procedure The_solution_of_the_quadratic_equation(a, b, c: real; var D, x1, x2: real);

begin
 D := sqr(b) - 4 * a * c;
 x1 := (-b + sqrt(D)) / 2 * a;
 x2 := (-b - sqrt(D)) / 2 * a;
 if D > 0 then 
  writeln('Дискриминант = ', D, ', больше 0 => уравнение имеет 2 корня. Первый: ', x1, ' Второй: ', x2);
 if D = 0 then
  writeln('Дискриминант равен 0 => уравнение имеет один корень: ', x1);
 if D < 0 then
  writeln('Дискриминант = ', D, ', меньше 0 => уравнение не имеет корней.');
end;

procedure Graphics_window_features(Key: integer);
begin
 case Key of
  VK_E: graphABC.Window.Close;
  VK_H: 
   begin
    Openwrite('C:\PABCWork.NET\Compilation Output Files\Help.txt');
   end;
  VK_L:  
   begin
    k := random(13);
    b := random(13);
    graphABC.Draw(x -> (k * X) + 15 * b, -390, 390, -390, 390, -390, 391, 389, -390)
   end;
  VK_Q:  
   begin
    a := random(13);
    b := random(13);
    c := random(26);
    graphABC.Draw(x -> (a * sqr(x) + b * x) / 15 + c * 15, -390, 390, -390, 390, -390, 391, 389, -390);
   end;
  VK_I: 
   begin
    k := random(26);
    graphABC.Draw(x -> (k / x) * 210, -390, 390, -390, 390, -390, 391, 389, -390);
   end;
  VK_C: graphABC.Draw(x -> sqr(x) * x / 210, -390, 390, -390, 390, -390, 391, 389, -390);
  VK_M: graphABC.Draw(x -> abs(x), -390, 390, -390, 390, -390, 391, 389, -390)
 end;
end;

begin
 //Подготовка окон:
 graphABC.InitWindow(750, 10, 840, 820, clWhite);
 graphABC.SetWindowCaption('Постройка графика:');
 graphABC.SetWindowIsFixedSize(true);
 graphABC.SetPenColor(clDimGray);
 graphABC.SetFontSize(7);
 for X := -25 to 25 do 
 begin
  Line(410 - 15 * X, 20, 410 - 15 * X, 799);
  if X > 0 then begin
   graphABC.DrawTextCentered(400 - 15 * X, 5, 417 - 15 * X, 20, -X);
   graphABC.DrawTextCentered(400 - 15 * X, 801, 417 - 15 * X, 815, -X);
  end;
  if X = 0 then begin
   graphABC.SetFontSize(9); graphABC.SetFontColor(clRed);
   graphABC.TextOut(407, 1, '0'); graphABC.TextOut(407, 805, '0');
   graphABC.SetFontColor(clBlack); graphABC.SetFontSize(7);
  end;
  if X < 0 then begin
   graphABC.DrawTextCentered(403 - 15 * X, 5, 417 - 15 * X, 20, -X);
   graphABC.DrawTextCentered(403 - 15 * X, 801, 417 - 15 * X, 815, -X);
  end;
 end;
 
 for Y := -25 to 25 do 
 begin
  Line(20, 410 - 15 * Y, 799, 410 - 15 * Y);
  if Y > 0 then begin
   graphABC.DrawTextCentered(1, 402 - 15 * Y, 20, 419 - 15 * Y, Y);
   graphABC.DrawTextCentered(800, 401 - 15 * Y, 820, 418 - 15 * Y, Y);
  end;
  if Y = 0 then begin
   graphABC.SetFontSize(9); graphABC.SetFontColor(clRed);
   graphABC.TextOut(7, 403, '0'); graphABC.TextOut(807, 403, '0');
   graphABC.SetFontColor(clBlack); graphABC.SetFontSize(7);
  end;
  if Y < 0 then begin
   graphABC.DrawTextCentered(1, 401 - 15 * Y, 20, 418 - 15 * Y, Y);
   graphABC.DrawTextCentered(800, 401 - 15 * Y, 820, 418 - 15 * Y, Y);
  end;
 end;
 graphABC.SetPenColor(clBlack);graphABC.SetPenWidth(3);
 Line(410, 15, 410, 805); Line(15, 410, 805, 410);
 graphABC.DrawRectangle(20, 20, 800, 800);
 graphABC.SetCoordinateOrigin(410, 410);graphABC.GraphABCCoordinate.Create.SetMathematic;
 graphABC.SetPenColor(clRandom);graphABC.SetPenWidth(3);
 graphABC.SetBrushStyle(bsClear);
 graphABC.OnKeyDown:=Graphics_window_features;
 graphABC.SetConsoleIO;
 crt.SetWindowCaption('Решение уравнения:');
 crt.SetWindowSize(60, 60);
  //Основная программа:
 crt.TextColor(2);
 writeln(' ');
 writeln('Привет! В этом окне ты передаешь нужные данные программе.');
 writeln('Не бойся. Если ты запутался или чего-то не понимаешь,перейдя в графическое окно, нажми латинскую H для вызова справки, может быть там есть ответ.');
 writeln('Для выхода перейди в графическое окно и нажми два раза  латинскую E.');
 writeln(' ');
 crt.TextColor(15);
 Writeln('    > Сколько уравнений решим и графиков мы построим?');
 loop ReadInteger do 
 begin
  crt.TextColor(15);
  writeln('  >  Выбери тип нужного уравнения - нажми на клавишу порядкого номера уравнения.');
  writeln(' 1. Линейное. Общий вид функции: y=k*x+b');
  writeln(' 2. Квадратное. Общий вид функции: y=x^2+b*x+c');
  writeln(' 3. Обратнопропорциональное. Общий вид функции: y=k/x');
  writeln(' 4. Куб числа. y=x^3');
  writeln(' 5. Корень из числа. y= " квадратный корень из: " x');
  writeln(' 6. Модуль числа. y=|x|');
  writeln(' ');
  Equation := crt.ReadKey;
  if Equation = ('1') then begin
   crt.TextColor(9);
   write('Через');
   crt.TextColor(13);
   write(' Enter ');
   crt.TextColor(9);
   write('введите сначала коэффициент');
   crt.TextColor(11);
   writeln(' k:');
   readln(k);
   crt.TextColor(9);
   write('Затем коэффициент');
   crt.TextColor(11);
   writeln(' b:');
   readln(b);
   crt.TextColor(9);
   writeln('И чему равно уравнение:');
   crt.TextColor(11);
   readln(Value);
   crt.TextColor(9);
   writeln(' ');
   writeln('Уравнение имеет вид: ', k, '*x+', b, '= Y(=', Value, ')');
   writeln(' ');
   write('Согласно формуле " (Y-b)/k) ", корень уравнения равен: ');
   crt.TextColor(11);
   Root := Finding_the_root_of_a_linear_equation(k, b, Value);
   writeln(Root);
   writeln(' ');
   graphABC.Draw(x -> (k * X) + 15 * b, -390, 390, -390, 390, -390, 391, 389, -390);
   crt.TextColor(10);
   write('Линейная функция. Графиком является прямая,');
   if b = 0 then
    write('проходящая через начало координат.');
   writeln(' ');
   if k > 0 then
    writeln('Функция возрастает от: ', Finding_the_root_of_a_linear_equation(k, b, -26), ' до: ', Finding_the_root_of_a_linear_equation(k, b, 26) );
   writeln('Функция равна нулю при:', Finding_the_root_of_a_linear_equation(k, b, 0));
   if k < 0 then
    writeln('Функция убывает  от: ', Finding_the_root_of_a_linear_equation(k, b, -26), ' до: ', Finding_the_root_of_a_linear_equation(k, b, 26));
   writeln('Функция > 0 при x от: ', Finding_the_root_of_a_linear_equation(k, b, 0), ' до: ', Finding_the_root_of_a_linear_equation(k, b, 26));
   writeln('Функция < 0 при x от: ', Finding_the_root_of_a_linear_equation(k, b, -26), ' до: ', Finding_the_root_of_a_linear_equation(k, b, 0));
  end;
  if Equation = ('2') then begin
   crt.TextColor(9);
   write('Через');
   crt.TextColor(13);
   write(' Enter ');
   crt.TextColor(9);
   write('введите сначала коэффициент');
   crt.TextColor(11);
   writeln(' a:');
   readln(a);
   crt.TextColor(9);
   write('Затем коэффициент');
   crt.TextColor(11);
   writeln(' b:');
   readln(b);
   crt.TextColor(9);
   writeln('И, наконец, коэффициент c:');
   crt.TextColor(11);
   readln(c);
   crt.TextColor(9);
   writeln(' ');
   writeln('Уравнение имеет вид: ', a, '*x^2+', b, '*x+', c, ' =0');
   writeln(' ');
   The_solution_of_the_quadratic_equation(a, b, c, D, x1, x2);
   writeln(' ');
   graphABC.Draw(x -> (a * sqr(x) + 15*b * x) / 15 + c * 15, -390, 390, -390, 390, -390, 391, 389, -390);
   crt.TextColor(10);
   writeln('Квадратичная функция. Графиком является парабола.');
   if a > 0 then
    writeln('Ветви параболы идут вверх, так как коэффициент a = ', a, ' > 0');
   if a < 0 then
    writeln('Ветви параболы идут вниз, так как коэффициент a = ', a, ' < 0');
   writeln(' ');
   if D > 0 then begin
    writeln('Нули функции: ', x1, ' и ', x2);
    if a > 0 then begin
    writeln('Функция > 0 при x от -бесконечности до:', x2, ' и от:', x1, ' до +бесконечности');
    writeln('Функция меньше нуля при x от: ', x2, ' до: ', x1);
    end;
    if a < 0 then begin
    writeln('Функция < 0 при x от -бесконечности до:', x2, ' и от:', x1, ' до +бесконечности');
    writeln('Функция больше нуля при x от: ', x2, ' до: ', x1);
    end;
   end;
   if D = 0 then begin
    writeln('Функция равна нулю при x:', x1);
    if a > 0 then
     writeln('Функция положительна от - бесконечности до: ', x1,' и от этой точки до +бесконечности.' );
    if a < 0 then
     writeln('Функция отрицательна от - бесконечности до: ', x1,' и от этой точки до +бесконечности.' );
   end;
   if D < 0 then begin
    writeln('Нет нулей функции.');
    if a > 0 then
     writeln('Функция положительна от - бесконечности до +бесконечности.' );
    if a < 0 then
     writeln('Функция отрицательна от - бесконечности до +бесконечности.' );
   end;
  end;
  {Доработать!}
  if Equation = ('3') then begin
   crt.TextColor(9);
   write('Введите коэффициент');
   crt.TextColor(11);
   writeln(' k ');
   crt.TextColor(9);
   write('и нажмите - ');
   crt.TextColor(13);
   writeln(' Enter.');
   crt.TextColor(11);
   readln(k);
   crt.TextColor(9);
   writeln('Чему равно уравнение:');
   crt.TextColor(11);
   readln(Value);
   crt.TextColor(9);
   writeln(' ');
   Root := Inverse_Proportionality_Root(k, Value);
   writeln('Уравнение имеет вид: ', k, ' / x');
   writeln('Согласно формуле: k/y корень:', Root);
   writeln(' ');
   graphABC.Draw(x -> (k / x) * 210, -390, 390, -390, 390, -390, 391, 389, -390);
   crt.TextColor(10);
   writeln('У этой функции нет нулей.');
   writeln('Функция положительна от ~0 до +бесконечности.');
   writeln('Функция отрицательна от -бесконечности до ~0.');
   writeln('Убывающая функция.');
  end;
  
  if Equation = ('4') then begin
   crt.TextColor(9);
   writeln('У этой функции нет коэффициентов.');
   crt.TextColor(10);
   writeln(' ');
   graphABC.Draw(x -> sqr(x) * x / 210, -390, 390, -390, 390, -390, 391, 389, -390);
   writeln('Функция равна нули толко если аргумент равен 0.');
   writeln('Функция положительна от 0 до +бесконечности.');
   writeln('Функция отрицательна от -бесконечности до 0.');
   writeln('Возрастающая функция.');
  end;
   {!}
  if Equation = ('5') then begin
   crt.TextColor(9);
   writeln('У этой функции нет коэффициентов.');
   crt.TextColor(10);
   writeln(' ');
   graphABC.Draw(x -> sqrt(x) / 15, -390, 390, -390, 390, -390, 391, 389, -390);
   writeln('Функция равна нули толко если аргумент равен 0.');
   writeln('Функция положительна от 0 до +бесконечности.');
   writeln('Функция отрицательна от -бесконечности до 0.');
   writeln('Возрастающая функция.');
  end;
  if Equation = ('6') then begin
   crt.TextColor(9);
   writeln('У этой функции нет коэффициентов.');
   crt.TextColor(10);
   writeln(' ');
   graphABC.Draw(x -> abs(x), -390, 390, -390, 390, -390, 391, 389, -390);
   writeln('Функция равна нули толко если аргумент равен 0.');
   writeln('Функция положительна от -бесконечности до +бесконечности.');
   writeln('Функция убывает и от -бесконечности до 0.');
   writeln('Функция возрастает от 0 до +бесконечности');
  end;
 end;
end.