clear

score=10

echo -e "Installation: Max 10 Points - Your score: $score\n\n" > output.txt

ls
read -p "Student's name? Max - 5 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Student's name: Max 5 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt
clear


ls -l /var/public
read -p "Directories and Permissions? Max - 20 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Directories and Permissions: Max - 20 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt
clear

ls /etc/skel-*
echo "/etc/skel-sales"
grep 'ipconfig' /etc/skel-sales/.bashrc
echo "/etc/skel-techs"
grep 'Folks' /etc/skel-techs/.bash_profile
read -p "Skel Directories? Max - 25 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Skel Directories: Max - 25 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt
clear

grep 'looneytunes' /etc/group

echo -e "\nUser Accounts:\n"
cat /etc/passwd | awk -F : '{
if ($3 >= 1001 && $3 < 2000)
  print "Username " $1 " - Primary Group " $4
}'
echo -e "\nPrimary Groups\n"
cat /etc/group | awk -F : '{
if ($3 >= 1001 && $3 < 2000)
  print "Group Name " $1 " - Group ID " $3
}'

echo -e "\n"
read -p "Sales Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Sales Users: Max - 4 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt

echo -e "\n"
read -p "Tech Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Tech Users: Max - 4 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt

echo -e "\n"
read -p "Devops Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo "Devops Users: Max - 25 Points - Your score: $answer" >> output.txt
echo -e "$comment\n\n" >> output.txt

clear

echo "Total score: $score" 

echo "Total score: $score out of 72" >> output.txt
