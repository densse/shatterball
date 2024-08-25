tum -= 1;
if(tum < 0)
{
	tum = 200;
	speed = 43*dir;
	if(dir = 1)
	{
		dir = -1
	}
	else
	{
		dir = 1;
	}
}
if(speed > 0)
{
	speed -= 0.5;
}
else if(speed < 0)
{
	speed += 0.5;
}