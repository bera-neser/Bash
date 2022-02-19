if [[ ! -d ~/the_folder/ ]];
then
    mkdir ~/the_folder
fi

for dir in ./*/
do
    cd $dir
    for file in ./*
    do
        file_name=$file
        file_name="${file_name:2}"
        if [[ "$file_name" =~ .*".".* ]];
        then
            file_extension="${file##*.}"
            if [[ ! -d ~/the_folder/$file_extension ]];
            then
                mkdir ~/the_folder/$file_extension
            fi
            mv $file ~/the_folder/$file_extension/
        fi
    done
    cd ..
done