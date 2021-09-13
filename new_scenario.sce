response_matching = simple_matching;
active_buttons=2;

begin;

array{
	box{
		width = 100;
		height = 100;
		color = 255,0,0;
		description = "red";
	}red_box;
	box{
		width = 100;
		height = 100;
		color = 0,0,255;
		description = "blue";
	};
}colored_boxes;

picture{
	box red_box;
	x = 0;  y = 0;
} stim;

picture{
	text{
		caption = "+";
		font_size = 48;
	};
	x=0; y=0;
}fixation;

trial{
	trial_duration = forever;
	trial_type = first_response;
	all_responses = false;
	
	picture fixation;
	code = "fix";
	time = 0 ;
	
	stimulus_event{
		picture stim;
		time = 1250;
		code = "stim";
		response_active = true;
	} stim_event;
}main_trial;

begin_pcl;

#parameters
int COLOR = 1;
int POSITION = 2;
int repeats = 3;
array<int> x_positions[]={-200,200};
array<string> position_code[]={"left","right"};


# set up and randomize trials
array<int> trial_list[0][2];
array <int> which_color[0];
loop int i = 1 until i > colored_boxes.count()
begin
	loop int c = 1 until c > x_positions.count()
	begin
		array<int> temp[2];
		temp[COLOR] = i;
		temp[POSITION] = c;
		loop int r = 1 until r > repeats
		begin
			term.print_line("c="+string(i)+",p="+string(c));
			trial_list.add(temp);
			r = r + 1;
		end;
		c = c + 1;
	end;
	i = i + 1;
end;
trial_list.shuffle();

#ptesent trials
loop int i =1 until i>trial_list.count()
begin
	int position_index = trial_list[i][POSITION];
	box next = colored_boxes[trial_list[i][COLOR]];
	stim_event.set_event_code(next.description()+";"+position_code[position_index]);
	stim.set_part(1,colored_boxes[trial_list[i][COLOR]]);
	stim.set_part_x(1,x_positions[trial_list[i][POSITION]]);
	main_trial.present();
	i = i + 1;
end;



