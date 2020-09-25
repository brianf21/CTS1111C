#!/bin/bash

possible=0
grade=0

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

possible=$(($possible+1))
echo 'Question: Set the group owner of /var/budgets to managers (1 Point)'
tempvar=$(ls -ld /var/budgets | cut -f4 -d " ")
if [[ "$tempvar" == "managers" ]]
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
echo 'Question: Configure /var/budgets so that all files and directories created in /var/budgets are owned by the group managers (1 Point)'
tempvar=$(ls -ld /var/budgets | cut -c7 )
if [[ $tempvar =~ [sS] ]]
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
echo 'Question: Only root and members of the group managers should have read/write permissions to /var/budgets (1 Point)'
tempvar=$(ls -ld /var/budgets | cut -c2-7 )
if [[ $tempvar =~ rw[xs]rw[xs] ]]
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

echo 'Only the user own should be able to delete files and folders in /var/budgets (1 Point)'
tempvar=$(ls -ld /var/budgets | cut -c10 )
if [[ $tempvar =~ [tT] ]]
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
echo 'Question: Set the group owner of /var/sales to sales (1 Point)'
tempvar=$(ls -ld /var/sales | cut -f4 -d " ")
if [[ "$tempvar" == "sales" ]]
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
echo 'Question: Configure /var/sales so that all files and directories created in /var/sales are owned by the group sales (1 Point)'
tempvar=$(ls -ld /var/sales | cut -c7 )
if [[ $tempvar == [sS] ]]
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
echo 'Question: Only root and members of the group sales should have read/write permissions to /var/sales (1 Point)'
tempvar=$(ls -ld /var/sales | cut -c2-7 )
if [[ $tempvar =~ rw[xs]rw[xs] ]]
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
echo 'Question: Only the user own should be able to delete files and folders in /var/sales (1 Point)'
tempvar=$(ls -ld /var/sales | cut -c10 )
if [[ $tempvar =~ [tT] ]]
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
echo 'Question: Set the group owner of /var/devops to devops (1 Point)'
tempvar=$(ls -ld /var/devops | cut -f4 -d " ")
if [[ "$tempvar" == "devops" ]]
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
echo 'Question: Configure /var/devops so that all files and directories created in /var/devops are owned by the group devops (1 Point)'
tempvar=$(ls -ld /var/devops | cut -c7 )
if [[ $tempvar == [sS] ]]
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
echo 'Question: Only root and members of the group devops should have read/write permissions to /var/devops (1 Point)'
tempvar=$(ls -ld /var/devops | cut -c2-7 )
if [[ $tempvar =~ rw[xs]rw[xs] ]]
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
echo 'Question: Only the user own should be able to delete files and folders in /var/devops (1 Point)'
tempvar=$(ls -ld /var/devops | cut -c10 )
if [[ $tempvar =~ [tT] ]]
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
echo 'Question: Set the group owner of /var/techs to techs (1 Point)'
tempvar=$(ls -ld /var/techs | cut -f4 -d " ")
if [[ "$tempvar" == "techs" ]]
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
echo 'Question: Configure /var/techs so that all files and directories created in /var/techs are owned by the group techs (1 Point)'
tempvar=$(ls -ld /var/techs | cut -c7 )
if [[ $tempvar == [sS] ]]
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
echo 'Question: Only root and members of the group techs should have read/write permissions to /var/techs (1 Point)'
tempvar=$(ls -ld /var/techs | cut -c2-7 )
if [[ $tempvar =~ rw[xs]rw[xs] ]]
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
echo 'Question: Only the user own should be able to delete files and folders in /var/techs (1 Point)'
tempvar=$(ls -ld /var/techs | cut -c10 )
if [[ $tempvar =~ [tT] ]]
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
echo 'Question: Set the group owner of /var/engineers to engineers (1 Point)'
tempvar=$(ls -ld /var/engineers | cut -f4 -d " ")
if [[ "$tempvar" == "engineers" ]]
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
echo 'Question: Configure /var/engineers so that all files and directories created in /var/engineers are owned by the group engineers (1 Point)'
tempvar=$(ls -ld /var/engineers | cut -c7 )
if [[ $tempvar == [sS] ]]
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
echo 'Question: Only root and members of the group engineers should have read/write permissions to /var/engineers and /var/engineers/projects (1 Point)'
tempvar=$(ls -ld /var/engineers | cut -c2-7 )
if [[ $tempvar =~ rw[xs]rw[xs] ]]
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
echo 'Question: Only the user own should be able to delete files and folders in /var/engineers (1 Point)'
tempvar=$(ls -ld /var/engineers | cut -c10 )
if [[ $tempvar =~ [tT] ]]
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

possible=$(($possible+1))
echo 'Question: Create a user account called utwo with a full name of "User Two", with a home directory of /home/SALES/utwo, and a primary group of sales. (1 Point)'
groupnumber=$(grep sales /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called uthree with a full name of "User Three", with a home directory of /home/DEVOPS/uthree, and a primary group of devops. (1 Point)'
groupnumber=$(grep devops /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called ufour with a full name of "User Four", with a home directory of /home/TECHS/ufour, and a primary group of techs. (1 Point)'
groupnumber=$(grep techs /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called ufive with a full name of "User Five", with a home directory of /home/ENGINEERS/ufive, and a primary group of engineers. (1 Point)'
groupnumber=$(grep engineers /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called usix with a full name of "User Six", with a home directory of /home/MANAGERS/usix, a primary group of managers, and supplementary member of sales. (1 Point)'
groupnumber=$(grep managers /etc/group | cut -f3 -d:)
sgroupnumber=$(grep sales /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called useven with a full name of "User Seven", with a home directory of /home/MANAGERS/useven, a primary group of managers, and supplementary member of devops. (1 Point)'
groupnumber=$(grep managers /etc/group | cut -f3 -d:)
sgroupnumber=$(grep devops /etc/group | cut -f3 -d:)
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

possible=$(($possible+1))
echo 'Question: Create a user account called ueight with a full name of "User Eight", with a home directory of /home/MANAGERS/ueight, a primary group of managers, and supplementary member of techs. (1 Point)'
groupnumber=$(grep managers /etc/group | cut -f3 -d:)
sgroupnumber=$(grep techs /etc/group | cut -f3 -d:)
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

echo 'Questions: Create a user account called unine with a full name of "User Nine", with a home directory of /home/MANAGERS/unine, a primary group of managers, and supplementary member of engineers. (1 Point)'
groupnumber=$(grep managers /etc/group | cut -f3 -d:)
sgroupnumber=$(grep engineers /etc/group | cut -f3 -d:)
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
