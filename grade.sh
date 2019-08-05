#!/bin/bash
ssh-keygen

ssh-copy-id 10.0.0.101

read -p "Enter your name: " name

echo $name > grade.txt

grade=0

if [ "vm1.contoso.com" == $(hostname) ]
  then
    grade=$(($grade+1))
    echo hostname on vm1 is correct >> grade.txt
  else
    echo hostname on vm1 is incorrect >> grade.txt
fi

if [ "vm2.contoso.com" == $(ssh 10.0.0.101 -C hostname) ]
  then
    grade=$(($grade+1))
    echo hostname on vm2 is correct >> grade.txt
  else
    echo hostname on vm2 is incorrect >> grade.txt
fi

ipaddress=$(ip address show team0 | grep -E 'inet.*team0' | awk '{ print $2 }')

if [ "$ipaddress" == '10.0.0.100/24' ]
  then
    grade=$(($grade+5))
    echo team0 is correct >> grade.txt
  else
    team0 is incorrect >> grade.txt
fi

ipaddress=$(ssh 10.0.0.101 -C 'ip address show eth0 | grep -E 'inet.*eth0' | awk '\''{ print $2 }'\''')

if [ "$ipaddress" == '10.0.0.101/24' ]
  then
    grade=$(($grade+5))
    echo ip settings on vm2 are correct >> grade.txt
  else
    static ip settings on vm2 are incorrect >> grade.txt
fi

answer=$(host -t A vm1.contoso.com | awk '{ print $4 }')

if [ "$answer" == '10.0.0.100' ]
  then
    grade=$(($grade+5))
    echo forward lookup using bind is correct >> grade.txt
  else
    echo forward lookup using bind is incorrect >> grade.txt
fi

answer=$(host -t PTR 10.0.0.100 | awk '{ print $5 }')

if [ "$answer" == 'vm1.contoso.com.' ]
  then
    grade=$(($grade+5))
    echo reverse lookup using bind is correct >> grade.txt
  else
    echo reverse lookup using bind is incorrect >> grade.txt
fi

answer=$(host -t A vm1.contoso.com 10.0.0.101 | grep address | awk '{ print $4 }')

if [ "$answer" == '10.0.0.100' ]
  then
    grade=$(($grade+5))
    echo forward lookup using unbound is correct >> grade.txt
  else
    echo forward lookup using unbound is incorrect >> grade.txt
fi

answer=$(host -t PTR 10.0.0.100 10.0.0.101 | grep pointer | awk '{ print $5 }')

if [ "$answer" == 'vm1.contoso.com.' ]
  then
    grade=$(($grade+5))
    echo reverse lookup using unbound is correct >> grade.txt
  else
    echo reverse lookup using unbound is incorrect >> grade.txt
fi

ssh 10.0.0.101 -C 'touch /mnt/iscsi/somefile.txt'

if [ '/dev/sda1' == "$(ssh 10.0.0.101 -C 'mount | grep iscsi | awk '\''{ print $1 }'\''')" ]
  then
    grade=$(($grade+10))
    echo iSCSI is correct >> grade.txt
  else
    echo iSCSI is incorrect >> grade.txt
fi

ssh 10.0.0.101 -C 'touch /mnt/nfsshare/somefile.txt'

if [ 'vm1:/nfsshare' == "$(ssh 10.0.0.101 -C 'mount | grep nfsshare | awk '\''{ print $1 }'\''')" ]
  then
    grade=$(($grade+10))
    echo nfsshare is correct >> grade.txt
  else
    echo nfsshare is incorrect >> grade.txt
fi

ssh 10.0.0.101 -C 'touch /mnt/smbshare/somefile.txt'

if [ '//vm1/smbshare' == "$(ssh 10.0.0.101 -C 'mount | grep smbshare | awk '\''{ print $1 }'\''')" ]
  then
    grade=$(($grade+10))
    echo smbshare is correct >> grade.txt
  else
    echo smbshare is incorrect >> grade.txt
fi

echo "Grade = $grade out of 62" >> grade.txt
echo "scale=2 ; ($grade / 62) * 100" | bc >> grade.txt
