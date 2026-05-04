cd /mnt/c/Users/zakar/Downloads
file=($(ls | grep "tp" ))
for i in "${file[@]}"
do

    if [[ $i == *"("*")"*  ]]
    then
        echo " $i"
        head -5 "$i" 
    fi
done