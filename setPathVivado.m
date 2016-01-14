% 使用するバージョンによってパスは変わりますので適宜設定して下さい。

% hdlsetuptoolpath('ToolName','Xilinx Vivado', ...
% 'ToolPath', 'C:\Xilinx\Vivado\2013.4\bin\unwrapped\win64.o\vivado.exe');

% for R2014a
hdlsetuptoolpath('ToolName','Xilinx Vivado', ...
    'ToolPath', 'C:\Xilinx\Vivado\2013.4\bin\vivado.bat');

% for R2015a
hdlsetuptoolpath('ToolName','Xilinx Vivado', ...
    'ToolPath', 'C:\Xilinx\Vivado\2014.2\bin\vivado.bat');

% for R2015b
hdlsetuptoolpath('ToolName','Xilinx Vivado', ...
    'ToolPath', 'C:\Xilinx\Vivado\2014.4\bin\vivado.bat');
