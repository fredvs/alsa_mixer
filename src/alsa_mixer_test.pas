program alsa_mixer_test;

uses
  {$ifdef unix}
  cthreads,
  {$endif}
  SysUtils,
  alsa_mixer;

var
  volleft, volright: integer;
  
 procedure ACallback;
  begin
   writeln();
   writeln('Yep, this is the callback, mixer-elem has changed...');
   writeln('New Volume left = ' + IntToStr(ALSAmixerGetVolume(0)) + '/100');
   writeln('New Volume right = ' + IntToStr(ALSAmixerGetVolume(1)) + '/100');
  end;

begin

  writeln();
  writeln('Begin session.');
  writeln();
  
  volleft  := ALSAmixerGetVolume(0);
  volright := ALSAmixerGetVolume(1);

  writeln('Original Volume left = ' + IntToStr(volleft) + '/100');
  writeln('Original Volume right = ' + IntToStr(volright) + '/100');
  writeln();
  
  sleep(300);

  ALSAmixerSetVolume(0, 25);
  ALSAmixerSetVolume(1, 55);

  writeln('New Volume left = ' + IntToStr(ALSAmixerGetVolume(0)) + '/100');
  writeln('New Volume right = ' + IntToStr(ALSAmixerGetVolume(1)) + '/100');
  
  sleep(1000);

  writeln();
 
  ALSAmixerSetVolume(0, volleft);
  ALSAmixerSetVolume(1, volright);
   
  writeln('Back to original Volume left = ' + IntToStr(ALSAmixerGetVolume(0)) + '/100');
  writeln('Back to original Volume right = ' + IntToStr(ALSAmixerGetVolume(1)) + '/100');
  
  writeln();
    
  writeln('Change volume from mixer-system to fire the callback...'); 
  writeln('Press a key to quit.');
  
  ALSAmixerSetCallBack(@ACallback); 
  readln;

  writeln('Bye bye...');

end.

