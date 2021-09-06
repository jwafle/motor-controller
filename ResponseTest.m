function x = ResponseTest(PSID, DMMID)

x = 0;
GWPSSetVoltage(PSID, 2)
%GWDMMConfigure(DMMID, 5)
pause(4)
GWPSSetVoltage(PSID, 12)
for i=0:10
  x = [x GWDMMRead(DMMID)];
  pause(0.1);
end
GWPSSetVoltage(PSID, 0)
x=x(2:length(x));
t=0:0.1:0.1*(length(x)-1);
plot(t,x);
xlabel('seconds');
ylabel('krpm')
grid
end
