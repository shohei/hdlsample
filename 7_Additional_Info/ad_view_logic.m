% このファイルを実行してロジックアナライザーの波形表示を行って下さい。
H = dsp.LogicAnalyzer(5)

H.SampleTime = 1/1000;
H.TimeSpan = 1/100;

addWave(H,'Name','clock', 'InputChannel',1)
tag{1} = addDivider(H);
addWave(H,'Name','Chirp', 'InputChannel',2)
addWave(H,'Name','Counter', 'InputChannel',3)

tag{2} = addDivider(H);
addWave(H,'Name','Chirp Analog', 'InputChannel', 2,...
	'Format', 'Analog', 'Height', 4)

addWave(H,'Name','Counter Analog', 'InputChannel', 3,...
	'Format', 'Analog', 'Height', 20)

step(H,simout.signal1.Data, simout.signal2.Data, simout.signal3.Data,...
	simout.signal2.Data, simout.signal3.Data)
