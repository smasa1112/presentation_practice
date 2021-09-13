begin;
#使用するmodeleの格納

#刺激を出力するようのtrialmodele
#trial{
	#一旦画像を設定しておく
#	time = 0;
	
#	stimulus_event{
#	}
#}main_trial;

begin_pcl;

#　波形の生成
# 09/13段階では任意の正弦波が出力できるようにしたい　→　sample_rate.frequencyを基準に配列を生成・保存する
double max_voltage= 1.0; #[V (ac)]
double frequency=4000; #[Hz]
int sample_rate= 50000; #[Hz]
double duration = 100.0; # [ms]

# DAQに出力するようの配列を生成
array<double> to_daq_array[0];
loop double i=1 until  i > (sample_rate*duration/1000+1)
begin
	double time = i/sample_rate;
	double sin_value= max_voltage*sin( pi_value * 2 *frequency * time); 
	to_daq_array.add(sin_value);
	i = i + 1;
end;

#　描画
term.print_line(to_daq_array);
#main_trial.present();