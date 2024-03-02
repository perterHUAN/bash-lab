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
