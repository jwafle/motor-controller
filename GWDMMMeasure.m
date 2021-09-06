function nValue = GWDMMMeasure(FID, nType)
% Input: FID assigned communication id
% Input: Measurement Type:(0) VDC, (1) VAC, (2) IDC, (3) IAC, (4) 2WOhm, (5) Hz, (6) Period
%        Default is VDC 
% Output: DMM Measurement value

if ~exist('nType','var')
   nType = 0;
end

switch nType
  case 0
    cmd = 'MEAS:VOLT:DC?';
  case 1
    cmd = 'MEAS:VOLT:AC?';
  case 2
    cmd = 'MEAS:CURR:DC?';
  case 3
    cmd = 'MEAS:CURR:AC?';
  case 4
    cmd = 'MEAS:RES?';
  case 5
    cmd = 'MEAS:FREQ?';
  case 6
    cmd = 'MEAS:PER?';
end

fprintf(FID, cmd);
sValue = fscanf(FID);
nValue = str2num(sValue);

end