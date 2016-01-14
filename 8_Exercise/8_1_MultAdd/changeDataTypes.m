%% Datatypeの一括変更

sumAccDataTypes = 'Inherit: Inherit via internal rule';
sumAccDataTypes = 'fixdt(1,18,14)';
sumOutDataTypes = 'fixdt(1,18,14)';
gainParamDataTypes = 'fixdt(1,16,16)';
gainOutDataTypes = 'fixdt(1,18,14)';

%% Sum/Addブロックの取得
blocks = find_system(gcs, 'blocktype', 'Sum')

%% パラメータ変更
for n = 1:numel(blocks)
    set_param(blocks{n}, 'ShowName', 'on');
    set_param(blocks{n}, 'AccumDataTypeStr', sumAccDataTypes);
    set_param(blocks{n}, 'OutDataTypeStr', sumOutDataTypes);
    set_param(blocks{n}, 'Inputs', '++');
    set_param(blocks{n}, 'RndMeth', 'floor')
end

%% Gainブロックの取得
blocks = find_system(gcs, 'blocktype', 'Gain')

%% パラメータ変更
for n = 1:numel(blocks)
    set_param(blocks{n}, 'ShowName', 'on');
    set_param(blocks{n}, 'ParamDataTypeStr', gainParamDataTypes);
    set_param(blocks{n}, 'OutDataTypeStr', gainOutDataTypes);
    set_param(blocks{n}, 'RndMeth', 'floor')
end

%% HDLプロパティ変更
for n = 1:numel(blocks)
    hdlset_param(blocks{n}, 'ConstMultiplierOptimization', 'none');
%     hdlset_param(blocks{n}, 'ConstMultiplierOptimization', 'auto');
end
