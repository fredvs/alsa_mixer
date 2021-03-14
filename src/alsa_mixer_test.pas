program alsa_mixer_test;

uses
 sysutils, alsa_mixer;
 
var
volleft, volright : integer; 
  
begin

volleft := ALSAmixerGetVolume(0);
volright := ALSAmixerGetVolume(1);

writeln('Original Volume left = ' + inttostr(volleft)+ '/100');
writeln('Original Volume right = ' + inttostr(volright)+ '/100');

ALSAmixerSetVolume(0, 75);
ALSAmixerSetVolume(1, 25);

writeln('New Volume left = ' + inttostr(ALSAmixerGetVolume(0))+ '/100');
writeln('New Volume right = ' + inttostr(ALSAmixerGetVolume(1))+ '/100');

ALSAmixerSetVolume(0, volleft);
ALSAmixerSetVolume(1, volright);

writeln('Back Volume left = ' + inttostr(ALSAmixerGetVolume(0))+ '/100');
writeln('Back Volume right = ' + inttostr(ALSAmixerGetVolume(1))+ '/100');

end.

