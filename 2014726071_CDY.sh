#!bin/bash


print()
{
i=0
for DF in *
do
if [ -d $DF ]
then
i=`expr $i + 1`
echo "┌[$i] $DF
│---------------------INFORMATION----------------------
│[34mfile type : 디 렉 토 리[0m
│file size : `stat -c %s $DF`
│creation time : `stat -c %y $DF`
│permission : `stat -c %a $DF`
│absolue path : `pwd`/$DF
│relative path : ./$DF 
└------------------------------------------------------"
	if [ `ls -l $DF|wc -l` -ge 2 ]
	then
	cd $DF
	print1
	cd ..
	fi
fi
done
for DF in *
do
if [ -f $DF ]
then
i=`expr $i + 1`
echo "┌[$i] $DF
│---------------------INFORMATION----------------------
│file type : 일 반 파 일
│file size : `stat -c %s $DF`
│creation time : `stat -c %y $DF`
│permission : `stat -c %a $DF`
│absolue path : `pwd`/$DF
│relative path : ./$DF
└------------------------------------------------------"
fi
done
for DF in *
do
if [ "`ls -dl $DF|grep -v ^[d,-]`" ]
then
i=`expr $i + 1`
echo "┌[$i] $DF
│---------------------INFORMATION----------------------
│[32mfile type : 특 수 파 일 [0m
│file size : `stat -c %s $DF`
│creation time : `stat -c %y $DF`
│permission : `stat -c %a $DF`
│absolue path : `pwd`/$DF
│relative path : ./$DF
└------------------------------------------------------"
fi
done
}
print1()
{
n=0
for D in *
do
if [ -d $D ]
then
n=`expr $n + 1`
echo "        ┌[$n] $DF/$D
        │---------------------INFORMATION----------------------
        │[34mfile type : 디 렉 토 리[0m
        │file size : `stat -c %s $D`
        │creation time : `stat -c %y $D`
        │permission : `stat -c %a $D`
        │absolue path : `pwd`/$D
        │relative path :  ./$DF/$D
        └------------------------------------------------------"
fi
done
for D in *
do
if [ -f $D ]
then
n=`expr $n + 1`
echo "        ┌[$n] $DF/$D
        │---------------------INFORMATION----------------------
        │file type : 일 반 파 일
        │file size : `stat -c %s $D`
        │creation time : `stat -c %y $D`
        │permission : `stat -c %a $D`
        │absolue path : `pwd`/$D
        │relative path : ./$DF/$D
        └------------------------------------------------------"
fi
done
for D in *
do
if [ "`ls -dl $D|grep -v ^[d,-]`" ]
then
n=`expr $n + 1`
echo "        ┌[$n] $DF/$D
        │---------------------INFORMATION----------------------
        │[32mfile type : 특 수 파 일 [0m
        │file size : `stat -c %s $D`
        │creation time : `stat -c %y $D`
        │permission : `stat -c %a $D`
        │absolue path : `pwd`/$D
        │relative path : ./$DF/$D
        └------------------------------------------------------"
fi
done
}


echo "=== print file information ==="
echo "current directory : `pwd`"
file=`ls -l|grep ^-|wc -l`
directory=`ls -l|grep ^d|wc -l`
special=`ls -l|grep -v ^[d,-]|wc -l`
echo "the number of elements : `expr $file + $directory + $special - 1`"

print

echo "변경함"
