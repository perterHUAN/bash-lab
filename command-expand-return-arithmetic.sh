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
