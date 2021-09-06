function nValue = GWDMMRead(FID)
% Input: FID assigned communication id
% Output: Current DMM display value

fprintf(FID,'VAL1?');
sValue = fscanf(FID);
nValue = str2num(sValue);

end