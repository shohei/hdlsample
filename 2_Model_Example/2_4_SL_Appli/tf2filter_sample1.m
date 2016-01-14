%% 伝達関数からのコード生成
[num , den] = butter(7,0.2);	% 7次フィルタを設計
% または伝達関数を定義
% num = [ 0.0001    0.0006    0.0019    0.0032    0.0032    0.0019   0.0006    0.0001]
% den = [ 1.0000   -4.1823    7.8717   -8.5309    5.7099   -2.3492   0.5483   -0.0558]

%% SOS型へ変換
[sos , g] = tf2sos(num,den)

%% 構造情報を持ったオブジェクトに変換
Hd = dfilt.df1sos(sos,g);
%% 固定小数点化
Hd.Arithmetic = 'fixed'
scale(Hd)
%% 固定小数点設定の変更　ビット幅などを適宜変更
Hd.CoeffWordLength = 18;
Hd.ProductMode = 'SpecifyPrecision'
Hd.AccumMode = 'SpecifyPrecision'

%% ダイナミックレンジのスケーリング
x = chirp(0:2.5e-3:2, 0.1,2, 200, 'linear');	% 振幅１のチャープ信号の生成
fipref('LoggingMode', 'on');
y = filter(Hd,x);
R = qreport(Hd)		%デフォルト設定にてオーバーフロー回数の解析

Hd = autoscale(Hd,x)	% 固定小数点スケーリング
y = filter(Hd,x);
R2 = qreport(Hd)		% 最適化した固定小数点設定にてオーバーフロー回数の解析

%% 周波数応答の確認
fvtool(Hd)

%% ブロック生成
block(Hd)  % Signal Processing Blockset/Digital Filterブロックを生成
realizemdl(Hd)  % 基本ブロックを使って生成する場合は下記
