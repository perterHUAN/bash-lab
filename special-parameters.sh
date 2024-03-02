# $* 
# 1. epands to the positional parameters, staring from one.
# 2. when the expansion is not within double quotes, each positional
# parameter expands to a seperate word. $*
# 3.when the expansion is with double quotes, it expands to a single
# word with the value of each parameter seperated by the first letter of
# the IFS variable. "$*" is equivalent to "$1c$2$3...", where c is the
# first letter of the value of the IFS variable. 

# test
# caller "hello world" ok $(4+8)  

echo '$* wthin double quote'
for e in "$*"
do
	echo $e
done
# => 
# 

echo '$* not wthin double quote'
for e in $*
do
	echo $e
done




echo "**************************"



# $@ 
# 1. epands to the positional parameters, staring from one.
# 2. In context where word splitting is performed, this expands each positional
# parameter to a separate word; if not within double quote, those words are subject to
# word splitting.
# 3. In Context where world splitting is not performed, this expands to a single word
# with each potional parameter seperated by a space.
# test
# caller "hello world" ok $(4+8)  


echo '$@ with double quote'
for e in "$@"
do
	echo $e
done

# =>
# hello
# word
# ok
# 12



echo '$@ not with double quote'
for e in $@
do
	echo $e
done

