%Controls Final Project

% DMMid = GWDMMInitialize(8)
% PSid = GWPSInitialize(9)
%% Uncompensated System
clear i
clear RPMSet
clear Vout
clear errorSig
clear VoutSet
clear RPMMeasured
clc

GWPSOutputOn(PSid)
GWPSSetVoltage(PSid,0)
GWPSSetCurrent(PSid,3)
RPMSet = 255
VoutSet = (RPMSet-4.8044)/46.089
i = 1;
while(i < 60)
Vout(i) = GWDMMRead(DMMid);
errorSig(i) = VoutSet - Vout(i) + VoutSet;
GWPSSetVoltage(PSid,errorSig(i));
RPMMeasured(i) = (Vout(i)*46.089)+4.8044
i=i+1;
end

GWPSOutputOff(PSid)

plot(RPMMeasured);xlabel('Measurement Index (i)');ylabel('Measured RPM');
title('Uncompensated System Test for 255 RPM Setpoint')

%% Compensated System
clear i
clear RPMSet
clear Vout
clear errorSig
clear VoutSet
clear VPS
clear RPMMeasured
clc

GWPSOutputOn(PSid)
GWPSSetVoltage(PSid,0)
GWPSSetCurrent(PSid,3)
RPMSet = 255
VoutSet = (RPMSet-4.8044)/46.089
i = 2;
VPS(1) = VoutSet;
errorSig(1) = VoutSet;
GWPSSetVoltage(PSid,VoutSet)
while(i < 200)
Vout(i) = GWDMMRead(DMMid);
errorSig(i) = VoutSet - Vout(i);
VPS(i) = (((0.975)*errorSig(i))+VPS(i-1));
GWPSSetVoltage(PSid,VPS(i));
RPMMeasured(i) = (Vout(i)*46.089)+4.8044
i=i+1;
end

GWPSOutputOff(PSid)
plot(RPMMeasured);xlabel('Measurement Index (i)');ylabel('Measured RPM');
title('Compensated System Test for 255 RPM Setpoint')


