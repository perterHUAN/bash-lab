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

