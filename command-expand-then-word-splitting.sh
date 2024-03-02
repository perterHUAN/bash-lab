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

