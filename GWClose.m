function GWClose(FID)
% Input: Port ID for GWPS Communication

fclose(FID)
delete(FID)
clear FID

end