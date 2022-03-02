function mtxpush(matrix){
	gml_pragma("forceinline");
	matrix_stack_push(matrix);
}

function mtxpop(count = 1){
	gml_pragma("forceinline");
	repeat(count) {
		matrix_stack_pop();
	}
}

function mtxset(){
	gml_pragma("forceinline");
	matrix_set(matrix_world, matrix_stack_top());
}