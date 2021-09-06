function CycleIt(PSID)
for i=1:20
GWPSSetVoltage(PSID, 12)

pause(2)
GWPSSetVoltage(PSID, 6)
pause(2)
end


end

