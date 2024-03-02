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
 
