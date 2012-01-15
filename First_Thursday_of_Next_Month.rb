#!/usr/bin/ruby -w

t1 = Time.new

#Get the start of next month
case t1.month
	when 1,3,5,7,8,10,11,12
		t2 = Time.local(t1.year,t1.month) + 31*24*60*60;

	when 4,6,9
		t2 = Time.local(t1.year,t1.month) + 30*24*60*60;

	when 2
		if t1.year % 4 == 0
   			if t1.year % 100 == 0
     				if t1.year % 400 == 0 
        				t2 = Time.local(t1.year,t1.month) + 29*24*60*60;
     				else
					t2 = Time.local(t1.year,t1.month) + 28*24*60*60;
     				end
    			else
      				t2 = Time.local(t1.year,t1.month) + 29*24*60*60;
    			end
  		else
    			t2 = Time.local(t1.year,t1.month) + 28*24*60*60;
		end
end

#Depending on the weekday of the start of next month calculate the number of days to be added
case t2.wday
	when 0
  		add = 4;

	when 1
  		add = 3;

	when 2
		add = 2;
	
	when 3
		add = 1;

	when 4
		add = 0;

	when 5
		add = 6;

	when 6
		add = 5;
end

#Add the number of days
t3 = Time.local(t2.year, t2.month) + add*24*60*60;

#Display on the standard output
case t3.day
	when 1,21,31
		puts t3.strftime("%A, %B %dst, %Y").gsub(/ 0(\d\D)/, ' \1')
	when 2,22
		puts t3.strftime("%A, %B %dnd, %Y").gsub(/ 0(\d\D)/, ' \1')
	when 3,23
		puts t3.strftime("%A, %B %drd, %Y").gsub(/ 0(\d\D)/, ' \1')
	else
		puts t3.strftime("%A, %B %dth, %Y").gsub(/ 0(\d\D)/, ' \1')
end