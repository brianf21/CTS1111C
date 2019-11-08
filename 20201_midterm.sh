clear

score=10

ls
read -p "Username? Max - 5 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo $comment
clear


ls -l /var/public
read -p "Directories and Permissions? Max - 20 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo $comment
clear

ls /etc/skel-*
echo "/etc/skel-sales"
grep 'ipconfig' /etc/skel-sales/.bashrc
echo "/etc/skel-techs"
grep 'Folks' /etc/skel-techs/.bash_profile
read -p "Skel Directories? Max - 25 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo $comment
clear

grep 'looneytunes' /etc/group

echo "User Accounts:"
cat /etc/passwd | awk -F : '{
if ($3 >= 1001 && $3 < 2000)
  print $1
}'
echo "Primary Groups"
cat /etc/group | awk -F : '{
if ($3 >= 1001)
  print Group Name $1 Group ID $3
}'

read -p "Sales Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Tech Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Devops Users: Max - 4 Points: " answer
score=$(($score + $answer))
read -p "Comment: " comment
echo $comment
clear

echo "Total score: $score"
