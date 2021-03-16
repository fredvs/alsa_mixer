program alsa_mixer_test;

uses
  SysUtils,
  CTypes,
  alsa_mixer;

var
  volleft, volright: integer;

  function mixcallback(ctl: Psnd_mixer_t; mask: cuint; elem: Psnd_mixer_elem_t): cint; cdecl;
  begin
    writeln('Yep, this is the callback, mixer has changed');
  end;

begin

  writeln('Set Callback.');
  writeln();

  ALSAmixerSetCallBack(@mixcallback); // Dont work well yet...

  writeln();
  writeln('Begin session.');
  writeln();
  //{
  volleft  := ALSAmixerGetVolume(0);
  volright := ALSAmixerGetVolume(1);

  writeln('Original Volume left = ' + IntToStr(volleft) + '/100');
  writeln('Original Volume right = ' + IntToStr(volright) + '/100');
  writeln();
  
  sleep(300);

  ALSAmixerSetVolume(0, 25);
  ALSAmixerSetVolume(1, 25);

  writeln('New Volume left = ' + IntToStr(ALSAmixerGetVolume(0)) + '/100');
  writeln('New Volume right = ' + IntToStr(ALSAmixerGetVolume(1)) + '/100');
  
  sleep(1500);

  writeln();

  ALSAmixerSetVolume(0, volleft);
  ALSAmixerSetVolume(1, volright);
  
 
  writeln('Back to original Volume left = ' + IntToStr(ALSAmixerGetVolume(0)) + '/100');
  writeln('Back to original Volume right = ' + IntToStr(ALSAmixerGetVolume(1)) + '/100');
  //}
  writeln();
  
  sleep(300);
  
  writeln('Change volume from mixer-system to fire the callback...');  // not yet working
  writeln();
  writeln('Press a key to quit.');

  readln;

end.

