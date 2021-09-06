function GWPSSetCurrent(FID, ch1I, ch2I)
% GWPSSetCurrent(FID, ch1I, ch2I)
% FID specifies the instrument communication ID
% ch1I: Optional input for channel 1 current limit
% ch2I: Optional input for channel 2 current limit
% Current limit must be between 0 and 3
% Use [] for ch1I if only channel 2 is to be set

if exist('ch1I','var')
  if ~isempty(ch1I)
    fprintf(FID,"ISET1:" + num2str(ch1I) + "\n");
  end
end

if exist('ch2I','var')
  fprintf(FID,"ISET2:" + num2str(ch2I) + "\n");
end

end