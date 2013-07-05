%Object = type { i8* }
%IO = type { i8* }
%Main = type { i8* }

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_Main_color = global i8* getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0)
@_string_0 = internal constant [6 x i8] c"green\00"
@_string_1 = internal constant [15 x i8] c"This apple is \00"

define i32 @main()
{
	call void @_Main_initializeAttributes(%Main* null)
	call %Object* @Main_main(%Main* null)
	ret i32 0
}

define void @_Main_initializeAttributes(%Main* %m)
{
	%_var0 = load [6 x i8]* @_string_0

	%_var1 = bitcast [6 x i8]* @_string_0 to i8*

	store i8* %_var1, i8** @_Main_color
	ret void
}


define %Object* @Main_main(%Main* %_m)
{
	%_superCast = bitcast %Main* %_m to %IO*
	%_var3 = load [15 x i8]* @_string_1

	%_var4 = bitcast [15 x i8]* @_string_1 to i8*

	%_var2 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var4)

	%_var6 = load i8** @_Main_color

	%_var5 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var6)

	%_var7 = bitcast %IO* %_var5 to %Object*
	ret %Object* null
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

