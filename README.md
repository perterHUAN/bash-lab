# Bash lab

## declare
declare a variable and set its attribute
### declare -i
declare a integer

`declare-i.sh` 
```bash
declare -i a
a="5+6"
echo $a
# => 12
```


### declare -a
declare a index array


### declare -n
declare -n nameref

`declare-n.sh`
```bash
declare -n name
anotherName="peter"
name=anotherName

# log anotherName or peter ?
echo $name

# => peter
# the value of anotherName variable
# declare -n name, change the interpretation of the right value to the name reference. 

# if we change the value of anotherName variable,
# will the value of name change?
anotherName="tom"
echo $name 

# => tom  change together!!!
```

### declare -f
show the information about function

```bash
say() {
	echo "hello world"
}
declare -f say
```

## use bc to perform arithmetic operations on floating-point numbers

`use-bc.sh`
```bash
echo "2+3" | bc
# bc accepts standard input to be evaluated, not parameters.
```

## special parameters

`special-parameters.sh`
```bash
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
```

### variable scope

`varaible-scope-in-function.sh`
```bash
fun1() {
	name="peter";
	fun2;
}

fun2() {
	name="tom"
	echo "Hello $name"
}

name="simi"
fun1
# => Hello tom
echo "Hello $name"
# => Hello tom

# if we do not use local keyword to 
# define a variable in function, it will 
# have global scope.

# bash uses dynmaic scope.
 

```
## assign
### +=

`add-equal-assign.sh`
```bash
# += assign 

# string
name=peter
name+=" is 18"

echo $name
# => peter is 18


# index Array
declare -a array
idxArray=(peter is 18)
# How to output all array?
echo ${idxArray[*]}

# associated Array
declare -A assArray
assArray=([name]=peter [age]=18)
echo ${assArray[*]}

# number
declare -i n=10
n+=11

echo $n
# => 21 

```

### what kind of operations can be performed on  right-hand side value of an assignment operator

`right-value-do-what-when-assign.sh`
```bash
# right value undergo
#	tilde expansion ~
#	parameter and varaible expansion
#	commond substitution $()
#	arithmetic expansion $(())	
#	quote removal 

# dose not undergo
#	word splitting
#	filename 

homePath=~

echo "homePath: $homePath"
# => /root


anotherName=peter
name=$anotherName

echo "name: $name"
# => peter

# calculate the number of file in current directory
commandResult=$(ls | wc -l)
echo "commandResult(ls | wc -l): $commandResult" 

exp=$((4+5))
echo "exp(4+5): $exp"
# => 9


str="hello world"
echo "str: $str"
# => str: hello world

filenames=*

echo "filenames: $filenames"
# => *

```

### funcation can be a parameter

`function-as-parameter`
```bash
function say(){
	$1;
}

function callback() {
	echo "Hello world"
}

say  callback 
# we can transmit a function name, and then execuate it. 

```
## command expand
### command-expand-then-word-splitting.sh

`command-expand-then-word-splittin g.sh`
```bash
say() {
	echo "hell word"
}
echoParameters() {
	echo $1
	echo $2
}
echo $(say)
# => hello world
# not word splitting
# as argument

for e in $(say)
do
	echo $e;
done
# word splitting 
```
### comand expand return arithmetic

`command-expand-return-arithmetic.sh`
```bash
# generateArithmeticExpand
# echo peter{ok,no}
# 
generateArithmeticExpand() {
#	echo 'peter {ok,no}'
	echo '$((2+3))'
}


echo $(generateArithmeticExpand)
# => $((2+3))


for i in $(generateArithmeticExpand)
do	
	echo $i
done
# => $((2+3))

# not arithmetic expand
```