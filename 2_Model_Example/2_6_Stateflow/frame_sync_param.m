% Parameter File for frame_sync_mt.mdl

FrameSize=32;
SyncCode=hex2dec('47');
SyncCodeSize=8;

SyncSig=str2num(dec2bin(SyncCode,SyncCodeSize)')

%SyncSig=dec2bin(SyncCode,SyncCodeSize);
%SyncSig=str2num([SyncSig(1) SyncSig(2) SyncSig(3) SyncSig(4)...
%	SyncSig(5) SyncSig(6) SyncSig(7) SyncSig(8)]')
% もっといい方法があるはず