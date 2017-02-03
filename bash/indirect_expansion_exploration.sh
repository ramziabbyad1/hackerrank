fn1()
{
	echo $1
}

fn2()
{
	echo ${!1}
}

x=2
letters=(a b c d)

fn1 x #prints 'x'
fn2 x #prints '2'
fn1 $x #prints '2'
fn1 "$x" #prints '2'
