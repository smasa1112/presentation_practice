## default settings------------------------------------------------
scenario = "MMN";							# scenario name
no_logfile = false;						# true -> do not make presentation log

scenario_type = trials;					# normal

default_font_size = 50;					# font size(pt)
default_text_color = 255, 255, 255;	# font color R, G, B　(0~255)
default_background_color = 0,0,0;	#　background color R, G, B　(0~255)

write_codes = true;

## scenario settings------------------------------------------------
begin;

array{
	sound{ wavefile{ filename="9kHz.wav"; preload = false;};}snd1;
	sound{ wavefile{ filename="12kHz.wav"; preload = false;};}snd2;
}snd_ary;

sound{ wavefile{filename="no_sound.wav";};}ns;

#to stimulus
trial{
	stimulus_event{
		sound snd1;
		code = "stim";
	}pres_evt;
}pres_trl;
#reset用



#-pcl------------------------------------------------
begin_pcl;

int i;						#　単純なカウンター
int j;
double t;

preset int standard_tone = 1;


#出現トレイン数
int max = 12000;
int devient = max / 20;	# 5%
double ISI = 500.0; #ms 0.5s

array<int> sd[2]; 

if (standard_tone < 1 || 2 < standard_tone) then
	standard_tone = 1;
end;

if(standard_tone == 1)then
	sd[1] = 1;
	sd[2] = 2;
else
	sd[1] = 2;
	sd[2] = 1;
end;

#ならし運転

ns.get_wavefile().load();		#　メモリーに展開
ns.present();

#音声の準備

snd1.get_wavefile().load();		#　メモリーに展開
snd2.get_wavefile().load();		#　メモリーに展開

system_keyboard.set_log_keypresses(true);
system_keyboard.get_input();

#刺激開始
t = clock.time_double() + 100;
loop until						
	t < clock.time_double()
begin end;

ns.present();

t = t + 100.0;

loop
	i = 1;
	j = 1;
until
	i > max
begin

	loop until
		t < clock.time_double()
	begin end;
	
	if(j < 20) then
		snd_ary[sd[1]].present();
		j = j + 1;
	else
		snd_ary[sd[2]].present();
		j = 1;
	end;
	
	t = t + ISI;
	i = i + 1;
end;

snd1.get_wavefile().unload();
snd2.get_wavefile().unload();
ns.get_wavefile().unload();
