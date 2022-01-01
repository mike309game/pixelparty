// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nmod(x, N){
	gml_pragma("forceinline");
	return (x % N + N) %N;
}