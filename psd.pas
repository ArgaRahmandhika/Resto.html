program CircularQueue;

const
  QueueSize = 5;

type
  TQueue = array[0..QueueSize-1] of Integer;

var
  Queue: TQueue;
  Front, Rear: Integer;


procedure InitializeQueue;
var
  i: Integer;
begin
  for i := 0 to QueueSize-1 do
    Queue[i] := -1; 
  Front := -1;
  Rear := -1;
end;


procedure DisplayQueue;
var
  i: Integer;
begin
  WriteLn('Queue: ');
  for i := 0 to QueueSize-1 do
  begin
    if Queue[i] = -1 then
      Write(' [ ] ')
    else
      Write(' [', Queue[i], '] ');
  end;
  WriteLn;

  if Front = -1 then
    WriteLn('Front Index: -')
  else
    WriteLn('Front Index: ', Front);

  if Rear = -1 then
    WriteLn('Rear Index: -')
  else
    WriteLn('Rear Index: ', Rear);
end;


procedure Enqueue(Value: Integer);
begin
  if ((Front = 0) and (Rear = QueueSize - 1)) or (Rear = (Front - 1) mod (QueueSize - 1)) then
  begin
    WriteLn('Queue penuh!');
    Exit;
  end;

  if Front = -1 then
  begin
    Front := 0;
    Rear := 0;
    Queue[Rear] := Value;
  end
  else if (Rear = QueueSize - 1) and (Front <> 0) then
  begin
    Rear := 0;
    Queue[Rear] := Value;
  end
  else
  begin
    Inc(Rear);
    Queue[Rear] := Value;
  end;

  DisplayQueue;
end;


procedure Dequeue;
var
  RemovedElement: Integer;
begin
  if Front = -1 then
  begin
    WriteLn('Queue kosong!');
    Exit;
  end;

  RemovedElement := Queue[Front];
  Queue[Front] := -1; 

  if Front = Rear then
  begin
    Front := -1;
    Rear := -1; 
  end
  else if Front = QueueSize - 1 then
    Front := 0
  else
    Inc(Front);

  DisplayQueue;
end;

var
  Choice: Char;
  Value: Integer;

begin
  InitializeQueue;

  repeat
    WriteLn('Menu Circular Queue');
    WriteLn('1. Enqueue (Tambah Elemen)');
    WriteLn('2. Dequeue (Hapus Elemen)');
    WriteLn('3. Tampilkan Queue');
    WriteLn('0. Keluar');
    Write('Pilih opsi: ');
    ReadLn(Choice);

    case Choice of
      '1': 
        begin
          Write('Masukkan nilai: ');
          ReadLn(Value);
          Enqueue(Value);
        end;
      '2': Dequeue;
      '3': DisplayQueue;
    end;
  until Choice = '0';

  WriteLn('Program selesai.');
end.