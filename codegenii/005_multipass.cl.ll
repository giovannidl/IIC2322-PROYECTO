%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*}
%Network = type { i8*, i8*}
%Connection = type { i8*, i8*, i8*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_type_Network = internal constant [8 x i8] c"Network\00"
@_type_Connection = internal constant [11 x i8] c"Connection\00"
@_string_0 = internal constant [10 x i8] c"WorldTree\00"
@_string_1 = internal constant [11 x i8] c"Archimonde\00"
@_string_2 = internal constant [13 x i8] c"Connection [\00"
@_string_3 = internal constant [7 x i8] c"] -> [\00"
@_string_4 = internal constant [3 x i8] c"]\0A\00"

define i32 @main()
{
	%mainClass = call %Program* @_newProgram()
	call %Object* @Program_main(%Program* %mainClass)
	ret i32 0
}

define %IO* @_newIO()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%IO* getelementptr (%IO* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %IO*
	%class_type = getelementptr %IO* %self, i32 0, i32 0
	store i8* bitcast([3 x i8]* @_type_IO to i8*), i8** %class_type

	ret %IO* %self
}


define %Program* @_newProgram()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Program* getelementptr (%Program* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Program*
	%class_type = getelementptr %Program* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_Program to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var0 = call %IO* @_newIO()
	store %IO* %_var0, %IO** %_var1
	ret %Program* %self
}


define %Network* @_newNetwork()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Network* getelementptr (%Network* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Network*
	%class_type = getelementptr %Network* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_Network to i8*), i8** %class_type

	%_var11 = getelementptr inbounds %Network* %self, i32 0, i32 1
	%_var10 = bitcast [11 x i8]* @_string_1 to i8*

	store i8* %_var10, i8** %_var11
	ret %Network* %self
}


define %Connection* @_newConnection()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Connection* getelementptr (%Connection* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Connection*
	%class_type = getelementptr %Connection* %self, i32 0, i32 0
	store i8* bitcast([11 x i8]* @_type_Connection to i8*), i8** %class_type

	%_var17 = getelementptr inbounds %Connection* %self, i32 0, i32 1
	%_var18 = getelementptr inbounds %Connection* %self, i32 0, i32 2
	store i8* getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0), i8** %_var17
	store i8* getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0), i8** %_var18
	ret %Connection* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var2 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var3 = load %IO** %_var2
	%_var5 = call %Network* @_newNetwork()
	%_var7 = bitcast [10 x i8]* @_string_0 to i8*

	%_var6 = call %Connection* @Network_createConnection(%Network* %_var5, i8* %_var7)

	%_var8 = call i8* @Connection_getDescription(%Connection* %_var6)

	%_var4 = call %IO* @IO_out_string(%IO* %_var3, i8* %_var8)

	%_var9 = bitcast %IO* %_var4 to %Object*
	ret %Object* %_var9
}


define i8* @Network_getHostname(%Network* %self)
{
	%_var12 = getelementptr inbounds %Network* %self, i32 0, i32 1
	%_var13 = load i8** %_var12
	ret i8* %_var13
}


define %Connection* @Network_createConnection(%Network* %self, i8* %_Network_endpoint)
{
	%_Network_createConnection_endpoint = alloca i8*, align 4
	store i8* %_Network_endpoint, i8** %_Network_createConnection_endpoint
	%_var14 = call %Connection* @_newConnection()
	%_var16 = load  i8** %_Network_createConnection_endpoint
	%_var15 = call %Connection* @Connection_open(%Connection* %_var14, %Network* %self, i8* %_var16)

	ret %Connection* %_var15
}


define %Connection* @Connection_open(%Connection* %self, %Network* %_Connection_net, i8* %_Connection_remote)
{
	%_Connection_open_net = alloca %Network*, align 4
	store %Network* %_Connection_net, %Network** %_Connection_open_net
	%_Connection_open_remote = alloca i8*, align 4
	store i8* %_Connection_remote, i8** %_Connection_open_remote
	%_var19 = load  i8** %_Connection_open_remote
	%_var20 = getelementptr inbounds %Connection* %self, i32 0, i32 1
	store i8* %_var19, i8** %_var20
	%_var21 = load  %Network** %_Connection_open_net
	%_var22 = call i8* @Network_getHostname(%Network* %_var21)

	%_var23 = getelementptr inbounds %Connection* %self, i32 0, i32 2
	store i8* %_var22, i8** %_var23
	%_var24 = bitcast %Connection* %self to %Connection*
	ret %Connection* %_var24
}


define i8* @Connection_getDescription(%Connection* %self)
{
	%_var25 = bitcast [13 x i8]* @_string_2 to i8*

	%_var27 = getelementptr inbounds %Connection* %self, i32 0, i32 2
	%_var28 = load i8** %_var27
	%_var26 = call i8* @String_concat(i8* %_var25, i8* %_var28)

	%_var30 = bitcast [7 x i8]* @_string_3 to i8*

	%_var29 = call i8* @String_concat(i8* %_var26, i8* %_var30)

	%_var32 = getelementptr inbounds %Connection* %self, i32 0, i32 1
	%_var33 = load i8** %_var32
	%_var31 = call i8* @String_concat(i8* %_var29, i8* %_var33)

	%_var35 = bitcast [3 x i8]* @_string_4 to i8*

	%_var34 = call i8* @String_concat(i8* %_var31, i8* %_var35)

	ret i8* %_var34
}



declare %Object* @Object_abort(%Object*)
declare i8* @Object_type_name(%Object*)
declare %IO* @IO_out_string(%IO*, i8*)
declare i8* @IO_in_string(%IO*)
declare %IO* @IO_out_int(%IO*, i32)
declare i32 @IO_in_int(%IO*)
declare i32 @String_length(i8*)
declare i8* @String_concat(i8*, i8*)
declare i8* @String_substr(i8*, i32, i32)
declare i32 @strcmp(i8*, i8*)
declare i8* @malloc(i64)

