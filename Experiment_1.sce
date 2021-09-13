begin;
begin_pcl;

int a=1;
int b=2;
int c=3;
array<int> my_numbers[]={1,2,3,4,5};
my_numbers.shuffle();
loop
	int i=1;
until
	i>my_numbers.count()
begin
	term.print_line(my_numbers[i]);
	i = i+1;
end;

