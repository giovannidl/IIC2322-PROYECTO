%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*, i32}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_string_0 = internal constant [18 x i8] c"La superficie es \00"

define i32 @main()
{
	%mainClass = call %Program* @_newProgram()
	call %Program* @Program_main(%Program* %mainClass)
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
	%_var2 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var0 = call %IO* @_newIO()
	store %IO* %_var0, %IO** %_var1
	store i32 0, i32* %_var2
	ret %Program* %self
}


define %Program* @Program_main(%Program* %self)
{
	%_var3 = getelementptr inbounds %Program* %self, i32 0, i32 2
	store i32 115000, i32* %_var3
	%_var4 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var5 = load %IO** %_var4
	%_var7 = bitcast [18 x i8]* @_string_0 to i8*

	%_var6 = call %IO* @IO_out_string(%IO* %_var5, i8* %_var7)

	%_var8 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var9 = load %IO** %_var8
	%_var11 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var12 = load i32* %_var11
	%_var10 = call %IO* @IO_out_int(%IO* %_var9, i32 %_var12)

	%_var13 = bitcast %IO* %_var10 to %Program*
	ret %Program* %_var13
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

