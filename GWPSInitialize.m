function FID = GWPSInitialize(nCOM)
% Input: Assign communications port to USB
% Default is COM3
%
% Output: Port ID for GWPS Communication

if ~exist('nCOM','var')
   nCOM = 3;
end

FID = serial("COM" + num2str(nCOM));
fopen(FID);

fprintf(FID,'*IDN?');
DevID = fscanf(FID);

if ~startsWith(DevID,"GW INSTEK,GPD-3303S")
   fclose(FID);
   error("Device not GPD-3303S power supply");
end

end