#!/bin/bash

possible=0
grade=0

echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo Question 1

possible=$(($possible+1))
echo 'Question: Create the following directories: /var/budgets (1 Point)'
if [[ -d /var/budgets ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
echo
fi

possible=$(($possible+1))
echo 'Question: Create the following directories: /var/sales/projects (1 Point)'
if [[ -d /var/sales/projects ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Create the following directories: /var/devops/projects (1 Point)'
if [[ -d /var/devops/projects ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Create the following directories: /var/techs/projects (1 Point)'
if [[ -d /var/techs/projects ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Create the following directories: /var/engineers/projects (1 Point)'
if [[ -d /var/engineers/projects ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo $possible
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo Question 2

possible=$(($possible+1))
echo 'Question: Link /var/budgets to /var/sales/budgets (1 Point)'
if [[ -L /var/sales/budgets ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Link /var/budgets to /var/devops/budgets (1 Point)'
if [[ -L /var/devops/budgets ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Link /var/budgets to /var/techs/budgets (1 Point)'
if [[ -L /var/techs/budgets ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Link /var/budgets to /var/engineers/budgets (1 Point)'
if [[ -L /var/engineers/budgets ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo $possible
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo Question 3

echo "User One"

possible=$(($possible+1))
echo 'Question: Create a user account called uone with a full name of "User One", with a home directory of /home/MANAGERS/uone, and a primary group of managers. (1 Point)'
groupnumber=$(grep managers /etc/group | cut -f3 -d:)
if [[ $(grep uone /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep uone /etc/passwd | cut -f6 -d:) == /home/MANAGERS/uone ]] \
&& [[ $(grep uone /etc/passwd | cut -f5 -d:) == User\ One ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Two"

possible=$(($possible+1))
echo 'Question: Create a user account called utwo with a full name of "User Two", with a home directory of /home/SALES/utwo, and a primary group of sales. (1 Point)'
grep sales /etc/group && groupnumber=$(grep sales /etc/group | cut -f3 -d:)
if [[ $(grep utwo /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep utwo /etc/passwd | cut -f6 -d:) == /home/SALES/utwo ]] \
&& [[ $(grep utwo /etc/passwd | cut -f5 -d:) == User\ Two ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Three"

possible=$(($possible+1))
echo 'Question: Create a user account called uthree with a full name of "User Three", with a home directory of /home/DEVOPS/uthree, and a primary group of devops. (1 Point)'
grep devops /etc/group && groupnumber=$(grep devops /etc/group | cut -f3 -d:)
if [[ $(grep uthree /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep uthree /etc/passwd | cut -f6 -d:) == /home/DEVOPS/uthree ]] \
&& [[ $(grep uthree /etc/passwd | cut -f5 -d:) == User\ Three ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Four"

possible=$(($possible+1))
echo 'Question: Create a user account called ufour with a full name of "User Four", with a home directory of /home/TECHS/ufour, and a primary group of techs. (1 Point)'
grep techs /etc/group && groupnumber=$(grep techs /etc/group | cut -f3 -d:)
if [[ $(grep ufour /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep ufour /etc/passwd | cut -f6 -d:) == /home/TECHS/ufour ]] \
&& [[ $(grep ufour /etc/passwd | cut -f5 -d:) == User\ Four ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Five"

possible=$(($possible+1))
echo 'Question: Create a user account called ufive with a full name of "User Five", with a home directory of /home/ENGINEERS/ufive, and a primary group of engineers. (1 Point)'
grep engineers /etc/group && groupnumber=$(grep engineers /etc/group | cut -f3 -d:)
if [[ $(grep ufive /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep ufive /etc/passwd | cut -f6 -d:) == /home/ENGINEERS/ufive ]] \
&& [[ $(grep ufive /etc/passwd | cut -f5 -d:) == User\ Five ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Six"

possible=$(($possible+1))
echo 'Question: Create a user account called usix with a full name of "User Six", with a home directory of /home/MANAGERS/usix, a primary group of managers, and supplementary member of sales. (1 Point)'
grep managers /etc/group && groupnumber=$(grep managers /etc/group | cut -f3 -d:)
grep sales /etc/group && sgroupnumber=$(grep sales /etc/group | cut -f3 -d:)
if [[ $(grep usix /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep usix /etc/passwd | cut -f6 -d:) == /home/MANAGERS/usix ]] \
&& [[ $(grep usix /etc/passwd | cut -f5 -d:) == User\ Six ]] \
&& [[ $(grep $sgroupnumber /etc/group | grep usix) ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Seven"
groupnumber=0
sgroupnumber=0

possible=$(($possible+1))
echo 'Question: Create a user account called useven with a full name of "User Seven", with a home directory of /home/MANAGERS/useven, a primary group of managers, and supplementary member of devops. (1 Point)'
grep managers /etc/group && groupnumber=$(grep managers /etc/group | cut -f3 -d:)
grep devops /etc/group && sgroupnumber=$(grep devops /etc/group | cut -f3 -d:)
if [[ $(grep useven /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep useven /etc/passwd | cut -f6 -d:) == /home/MANAGERS/useven ]] \
&& [[ $(grep useven /etc/passwd | cut -f5 -d:) == User\ Seven ]] \
&& [[ $(grep $sgroupnumber /etc/group | grep useven) ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Eight"

possible=$(($possible+1))
echo 'Question: Create a user account called ueight with a full name of "User Eight", with a home directory of /home/MANAGERS/ueight, a primary group of managers, and supplementary member of techs. (1 Point)'
grep managers /etc/group && groupnumber=$(grep managers /etc/group | cut -f3 -d:)
grep techs /etc/group && sgroupnumber=$(grep techs /etc/group | cut -f3 -d:)
if [[ $(grep ueight /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep ueight /etc/passwd | cut -f6 -d:) == /home/MANAGERS/ueight ]] \
&& [[ $(grep ueight /etc/passwd | cut -f5 -d:) == User\ Eight ]] \
&& [[ $(grep $sgroupnumber /etc/group | grep ueight) ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo 
  echo "Total grade so far: $grade"
  echo
fi

echo "User Nine"

possible=$(($possible+1))
echo 'Questions: Create a user account called unine with a full name of "User Nine", with a home directory of /home/MANAGERS/unine, a primary group of managers, and supplementary member of engineers. (1 Point)'
grep managers /etc/group && groupnumber=$(grep managers /etc/group | cut -f3 -d:)
grep engineers /etc/group && sgroupnumber=$(grep engineers /etc/group | cut -f3 -d:)
if [[ $(grep unine /etc/passwd | cut -f4 -d:) == $groupnumber ]] \
&& [[ $(grep unine /etc/passwd | cut -f6 -d:) == /home/MANAGERS/unine ]] \
&& [[ $(grep unine /etc/passwd | cut -f5 -d:) == User\ Nine ]] \
&& [[ $(grep $sgroupnumber /etc/group | grep unine) ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Make uone the administrator of the managers group. (1 Point)'
if [[ $(cat /etc/gshadow | grep managers | cut -f3 -d:) == uone ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Set all of passwords of the newly created account to Pa11word. (1 Points)'
grade=$(($grade+1))
echo "Total grade so far: $grade"
echo

possible=$(($possible+1))
echo 'Question: For all of the newly created account, force users to change their password every 30 days, but no less than 2 days. Users should be given a 3 day warning before their passwords expire. (1 Points)'

check=true
for i in uone utwo uthree ufour ufive usix useven ueight unine
  do
    value=$(cat /etc/shadow | grep $i | awk -F: '{ print $4$5$6 }')
    
    if [[ $value != "2303" ]]
      then
        check=false
    fi
  done
  
if [[ $check == "true" ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

echo $possible
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo Question 4

possible=$(($possible+1))
echo 'Question: Create the file /var/budgets/spongebob.txt with the following content. (1 Point)'
if [[ $(md5sum /var/budgets/spongebob.txt) == f5bb8cb8143bb0249e601900f34aabc3\ \ /var/budgets/spongebob.txt ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  grade=$(($grade+1))
  # echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

echo $possible
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo Question 5

possible=$(($possible+1))
echo 'Question: Copy /var/budgets/spongebob.txt to /var/budgets/spongebob2.txt and change the word kid in /var/budgets/spongebob2.txt to sponge. (1 Point)'
if [[ $(md5sum /var/budgets/spongebob2.txt) == f75fcd1e98cf9899a1e62711ba55a919\ \ /var/budgets/spongebob2.txt ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  grade=$(($grade+1))  
  # echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Copy /var/budgets/spongebob2.txt to /var/budgets/spongebob3.txt and put a line break after "But that\`s okay\!" in /var/budgets/spongebob3.txt. (1 Point)'
if [[ $(md5sum /var/budgets/spongebob3.txt) == 2e7f0cd1219bc85fe02c67bc2ea1faab\ \ /var/budgets/spongebob3.txt ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  grade=$(($grade+1))
  # echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Copy /var/budgets/spongebob3.txt to /var/budgets/spongebob4.txt and add a line at the top saying "Spongebob Quote" with a blank line underneath it in /var/budgets/spongebob4.txt. (1 Point)'
if [[ $(md5sum /var/budgets/spongebob4.txt) == 6da9cdfcbe365990d37b454eb5176732\ \ /var/budgets/spongebob4.txt ]]
then
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  grade=$(($grade+1))
  # echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Copy the content of the man pages for the following commands to outfile.txt: vi, ln, tac, sip, cat, grep, and ll. Save any errors that are generated doing this task to errors.txt. (1 Point)'
updatedb
if [[ -f $(locate outfile.txt) ]] && [[ -f $(locate errors.txt) ]]
then
  if [[ $(md5sum $(locate outfile.txt) | cut -f1 -d" ") ==  a0c9ec8798936c8c95c4e92829bd3d71 ]] \
  && [[ $(md5sum $(locate errors.txt) | cut -f1 -d" ") ==  4c7fee4d3b42e484e521b8b6d52a3ef3 ]]
  then
    grade=$(($grade+1))
    echo "Total grade so far: $grade"
    echo
  else
    grade=$(($grade+1))
    # echo Wrong
    echo
    echo "Total grade so far: $grade"
    echo
  fi
else
  echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

possible=$(($possible+1))
echo 'Question: Create a blank file in /root called yourfirstandlastname.txt. Replace yourfirstandlastname with your actual first and last name. (1 Point)'
if [[ $(find /root/*.txt -size 0 -print) ]]
then
  find /root/*.txt -size 0 -print
  grade=$(($grade+1))
  echo "Total grade so far: $grade"
  echo
else
  echo Wrong
  echo
  echo "Total grade so far: $grade"
  echo
fi

echo Your points: $grade
echo Possible points: $possible
echo Your score: $(printf "%.2f\n" $(echo "($grade/$possible)*100" | bc -l))
