function FID = GWDMMInitialize(nCOM)
% Input: Assign communications port to USB
% Default is COM5
%
% Output: Port ID for GWPS Communication

if ~exist('nCOM','var')
   nCOM = 5;
end

FID = serial("COM" + num2str(nCOM));
fopen(FID);

fprintf(FID,'*IDN?');
DevID = fscanf(FID);

if ~startsWith(DevID,"GWInstek,GDM8351")
   fclose(FID);
   error("Device not GDM8351 DMM");
end

end