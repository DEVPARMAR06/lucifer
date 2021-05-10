echo "--> DBMS Functions <--"
while [ true ]
do
echo "\n1.View All \n2.Insert \n3.Search \n4.Delete \n5.Update \n6.Sort \n7.Exit"
echo "Enter Choice: "
read c
while [ -z $c ]
do
"Enter Choice: "
read c
done


#-----------------------------------------------------------------------

if [ $c -eq 1 ]
then
cat pr-8ans

#-----------------------------------------------------------------------

elif [ $c -eq 2 ]
then
while [ true ]
do
echo "Enter Employee Id :"
read eid
while [ -z $eid ]
do
echo "Enter Employee Id :"
read eid
done

cut -d"|" -f1 pr-8ans | cat > try123
b=$(grep -n -w -i $eid try123 | cut -f1 -d":")
 
if [ -z $b ]
then
break
else
echo "--> Enter Unique Employee Id <--"
fi
done

echo "Employee Name:"
read ename

while [ -z $ename ] 
do
echo "Employee Name:"
read ename
done

echo "Employee Department :"
read edep

while [ -z $edep ]
do
echo "Employee Department :"
read edep
done

echo "Employee Salary :"
read esal

while [ true ]
do
if [ -z $esal ]
then
echo "Employee Salary :"
read esal

elif [ $esal -le 0 ]
then
echo "Employee Salary :"
read esal

else
break
fi
done
echo "$eid | $ename | $edep | $esal" >> pr-8ans


#-----------------------------------------------------------------------

elif [ $c -eq 3 ]
then

echo "\n1. Search By Employee Id \n2. Search By Name \n3. Search By Department \n4. Search By Salary "
read choice
if [ $choice -eq 1 ]
then

cut -d"|" -f1 pr-8ans | cat > try123
echo "Enter Employee Id :"
read db
while [ -z $db ]
do
echo "Enter Employee Id :"
read db
done
b=$(grep -n -w -i $db try123 | cut -f1 -d":") 
if [ -z $b ]
then
echo "Not Found"

else

len=$(wc -l < pr-8ans)
i=1
cat pr-8ans | while read line
do 
if [ $i -eq $b ]
then
echo $line
fi
i=`expr $i + 1`
done
fi

elif [ $choice -eq 2 ]
then

cut -d"|" -f2 pr-8ans | cat > try123
echo "Enter Name :"
read ena
while [ -z $ena ]
do
echo "Enter Name :"
read ena
done
grep -n -i -w $ena try123 | cut -f1 -d":" | cat > emp
l=$(wc -l < emp)

if [ $l -eq 0 ]
then
echo "Not Found"

else

len=$(wc -l < pr-8ans)
i=1
cat pr-8ans | while read line
do 

cat emp | while read j
do 
if [ $i -eq $j ]
then
echo $line
fi
done

i=`expr $i + 1`
done
fi

elif [ $choice -eq 3 ]
then


cut -d"|" -f3 pr-8ans | cat > try123

echo "Employee Department"
read Ed
while [ -z $Ed ]
do
echo "Employee Department:"
read Ed
done


grep -n -i -w $Ed try123 | cut -f1 -d":" | cat > emp
l=$(wc -l < emp)

if [ $l -eq 0 ]
then
echo "Not Found"

else

len=$(wc -l < pr-8ans)
i=1
cat pr-8ans | while read line
do 

cat emp | while read j
do 
if [ $i -eq $j ]
then
echo $line
fi
done

i=`expr $i + 1`
done
fi





elif [ $choice -eq 4 ]
then

cut -d"|" -f4 pr-8ans | cat > try123

echo "Employee Salary:"
read sa
while [ -z $sa ]
do
echo "Employee Salary:"
read sa
done


grep -n -i -w $sa try123 | cut -f1 -d":" | cat > emp
l=$(wc -l < emp)

if [ $l -eq 0 ]
then
echo "Not Found"

else

len=$(wc -l < pr-8ans)
i=1
cat pr-8ans | while read line
do 

cat emp | while read j
do 
if [ $i -eq $j ]
then
echo $line
fi
done

i=`expr $i + 1`
done
fi





else
echo "--> Wrong Choice <--"
fi

#-----------------------------------------------------------------------

elif [ $c -eq 4 ]
then
cut -d"|" -f1 pr-8ans | cat > try123
echo "Enter Employee Id :"
read db
while [ -z $db ]
do
echo "Enter Employee Id :"
read db
done
b=$(grep -n -w -i $db try123 | cut -f1 -d":") 
if [ -z $b ]
then
echo "Not Found"

else
touch pr-8-delete
len=$(wc -l < pr-8ans)
i=1
cat pr-8ans | while read line
do 
if [ $i -ne $b ]
then
echo "$line" >> pr-8-delete
fi
i=`expr $i + 1`
done
cat pr-8-delete > pr-8ans
rm pr-8-delete
fi


#-----------------------------------------------------------------------

elif [ $c -eq 5 ]
then
cut -d"|" -f1 pr-8ans | cat > try123

echo "Enter Employee Id :"
read db
while [ -z $db ]
do
echo "Enter Employee Id :"
read db
done

b=$(grep -n -w -i $db try123 | cut -f1 -d":") 
if [ -z $b ]
then
echo "Not Found"

else
touch pr-8-delete
#len=$(wc -l < pr-8ans)
#i=1
x=0

#touch edit
#cat pr-8ans | while read line
#do 
#if [ "$i" -eq "$b" ]
#then
#echo $line >> edit
#uename=$(cut -d"|" -f2 edit)
#uedep=$(cut -d"|" -f3 edit)
#uesal=$(cut -d"|" -f4 edit)
#fi
#i=`expr $i + 1`
#done

echo "\n1.Update Name \n2.Update Department \n3.Update Salary"
read va

if [ $va -eq 1 ]
then
echo "Employee Name:"
read uename

while [ -z $uename ] 
do
echo "Employee Name:"
read uename
done
uedep=$(grep -i -w $db pr-8ans | cut -f3 -d"|")
uesal=$(grep -i -w $db pr-8ans | cut -f4 -d"|")

elif [ $va -eq 2 ]
then

echo "Employee Department :"
read uedep

while [ -z $uedep ]
do
echo "Employee Department :"
read uedep
done
uename=$(grep -i -w $db pr-8ans | cut -f2 -d"|")
uesal=$(grep -i -w $db pr-8ans | cut -f4 -d"|")

elif [ $va -eq 3 ]
then

echo "Employee Salary :"
read uesal

while [ true ]
do
if [ -z $uesal ]
then
echo "Employee Salary :"
read uesal

elif [ $uesal -le 0 ]
then
echo "Employee Salary :"
read uesal
else
break
fi
done
uedep=$(grep -i -w $db pr-8ans | cut -f3 -d"|")
uename=$(grep -i -w $db pr-8ans | cut -f2 -d"|")

else
echo "--> Wrong Choice <--"
rm pr-8-delete
#rm edit
x=1
fi
i=1
if [ $x -eq 0 ]
then
cat pr-8ans | while read line
do 
if [ $i -ne $b ]
then
echo "$line" >> pr-8-delete
else 
echo "$db | $uename | $uedep | $uesal" >> pr-8-delete
fi
i=`expr $i + 1`
done
cat pr-8-delete > pr-8ans
rm pr-8-delete
#rm edit
fi
fi

#-----------------------------------------------------------------------

elif [ $c -eq 6 ]
then
touch sorting
echo "\n1. Sort By Employee Id \n2. Sort By Name \n3. Sort By Department \n4. Sort By Salary "
read cho
if [ $cho -eq 1 ]
then
echo "---------------------------------------------------"
sort -t "|" -k 1 pr-8ans | cat > sorting
cat sorting
echo "---------------------------------------------------"
echo "\n You Want To Update Sorted Data In Database? 1(YES)/0(NO)"
read l
if [ $l -eq 1 ]
then
cat sorting > pr-8ans
fi

elif [ $cho -eq 2 ]
then
echo "---------------------------------------------------"
sort -t "|" -k 2 pr-8ans | cat > sorting
cat sorting
echo "---------------------------------------------------"
echo "\n You Want To Update Sorted Data In Database? 1(YES)/0(NO)"
read l
if [ $l -eq 1 ]
then
cat sorting > pr-8ans
fi


elif [ $cho -eq 3 ]
then
echo "---------------------------------------------------"
sort -t "|" -k 3 pr-8ans | cat > sorting
cat sorting
echo "---------------------------------------------------"
echo "\n You Want To Update Sorted Data In Database? 1(YES)/0(NO)"
read l
if [ $l -eq 1 ]
then
cat sorting > pr-8ans
fi



elif [ $cho -eq 4 ]
then
echo "---------------------------------------------------"
sort -n -t "|" -k 4 pr-8ans | cat > sorting
cat sorting
echo "---------------------------------------------------"
echo "\n You Want To Update Sorted Data In Database? 1(YES)/0(NO)"
read l
if [ $l -eq 1 ]
then
cat sorting > pr-8ans
fi


else
echo "--> Wrong Choice <--"

fi
rm -r sorting

#-----------------------------------------------------------------------

elif [ $c -eq 7 ]
then
echo "---> Thanks For Using <---"
break
else
echo "---> Wrong Choice <---"
fi

#-----------------------------------------------------------------------
done
