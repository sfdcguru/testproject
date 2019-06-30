trigger Recursive_Demo on Account (before insert) {
	Recursive_Example.beforeInsert();
}