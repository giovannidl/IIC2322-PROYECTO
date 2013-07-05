%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_string_0 = internal constant [36 x i8] c"Sabias que puedes encadenar mas de \00"
@_string_1 = internal constant [27 x i8] c" llamadas a las funciones\0A\00"
@_string_2 = internal constant [37 x i8] c"out_string y out_int de la clase IO\0A\00"
@_string_3 = internal constant [12 x i8] c"ya que las \00"
@_string_4 = internal constant [48 x i8] c" devuelven el objeto sobre el cual se llamaron?\00"

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


define %Object* @Program_main(%Program* %self)
{
	%_var2 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var3 = load %IO** %_var2
	%_var5 = bitcast [36 x i8]* @_string_0 to i8*

	%_var4 = call %IO* @IO_out_string(%IO* %_var3, i8* %_var5)

	%_var6 = call %IO* @IO_out_int(%IO* %_var4, i32 1500)

	%_var8 = bitcast [27 x i8]* @_string_1 to i8*

	%_var7 = call %IO* @IO_out_string(%IO* %_var6, i8* %_var8)

	%_var10 = bitcast [37 x i8]* @_string_2 to i8*

	%_var9 = call %IO* @IO_out_string(%IO* %_var7, i8* %_var10)

	%_var12 = bitcast [12 x i8]* @_string_3 to i8*

	%_var11 = call %IO* @IO_out_string(%IO* %_var9, i8* %_var12)

	%_var13 = call %IO* @IO_out_int(%IO* %_var11, i32 2)

	%_var15 = bitcast [48 x i8]* @_string_4 to i8*

	%_var14 = call %IO* @IO_out_string(%IO* %_var13, i8* %_var15)

	%_var16 = bitcast %IO* %_var14 to %Object*
	ret %Object* %_var16
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

