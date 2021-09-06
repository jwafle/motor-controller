function GWPSSetVoltage(FID, ch1V, ch2V)
% GWPSSetVoltage(FID, ch1V, ch2V)
% FID specifies the instrument communication ID
% ch1I: Optional input for channel 1 voltage
% ch2I: Optional input for channel 2 voltage
% Voltage must be between 0 and 30
% Use [] for ch1V if only channel 2 is to be set

if exist('ch1V','var')
  if ~isempty(ch1V)
    fprintf(FID,"VSET1:" + num2str(ch1V) + "\n");
  end
end

if exist('ch2V','var')
  fprintf(FID,"VSET2:" + num2str(ch2V) + "\n");
end

end