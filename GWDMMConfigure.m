function GWDMMConfigure(FID, nType, sRange)
% Input: FID assigned communication id
% Input: Measurement Configurement:(0) VDC, (1) VAC, (2) IDC, (3) IAC, (4) 2WOhm, (5) Hz, (6) Period
%        Default is VDC (maybe skipped by use of [])
% Input: Measurement range value appropriate for configuration 
%        No setting indicates autoset
%        Range must be entered as text, i.e. "10e3"  or  "10e-2"
%        DMM will set the range as close as possible


if ~exist('nType','var')
   nType = 0;
end

if isempty(nType)
   nType = 0;
end

switch nType
  case 0
    cmd = 'CONF:VOLT:DC';
  case 1
    cmd = 'CONF:VOLT:AC';
  case 2
    cmd = 'CONF:CURR:DC';
  case 3
    cmd = 'CONF:CURR:AC';
  case 4
    cmd = 'CONF:RES';
  case 5
    cmd = 'CONF:FREQ';
  case 6
    cmd = 'CONF:PER';
end

if exist('sRange','var')
   cmd = strcat(cmd, " ", sRange);
end

fprintf(FID, cmd);

end