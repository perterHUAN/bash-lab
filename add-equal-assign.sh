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
