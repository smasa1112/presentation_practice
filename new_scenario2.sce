begin;

trial{
	picture{background_color = 255,0,0;};
	code="1";
	time = 0;
	
	picture{background_color = 0,255,0;};
	code="2";
	time = 42;
	
	picture{background_color = 0,0,255;};
	code="3";
	time = 42;
	
	picture{background_color = 255,255,0;};
	code="4";
	time = 42;
	
	
}trial1;

begin_pcl;

trial1.present();