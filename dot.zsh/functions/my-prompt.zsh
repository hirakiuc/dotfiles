if [ ${USER} = "root" ]
then
#  PROMPT="%{[31m%}[%n@%m]#%{[m%} "
  PROMPT="[%n@%m]$ "
  PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
else
  PROMPT="[%n@%m]$ "
fi
