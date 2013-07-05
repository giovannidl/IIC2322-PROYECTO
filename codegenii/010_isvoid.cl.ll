%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*, %Program*, i8*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_string_0 = internal constant [5 x i8] c"true\00"
@_string_1 = internal constant [6 x i8] c"false\00"
@_string_2 = internal constant [2 x i8] c"\0A\00"

define i32 @main()
{
	%mainClass = call %Program* @_newProgram()
	call %IO* @Program_main(%Program* %mainClass)
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
	%_var3 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var0 = call %IO* @_newIO()
	store %IO* %_var0, %IO** %_var1
	store %Program* null, %Program** %_var2
	store i8* getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0), i8** %_var3
	ret %Program* %self
}


define %IO* @Program_main(%Program* %self)
{
	%_var5 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var6 = load %Program** %_var5
	%_var7 = icmp eq %Program* null, %_var6
	%_var4 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var7)

	%_var8 = call %IO* @Program_printBoolean(%Program* %self, i1 0)

	%_var10 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var11 = load i8** %_var10
	%_var12 = icmp eq i8* null, %_var11
	%_var9 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var12)

	%.Program.pot = getelementptr %IO* null
	%_var13 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var14 = load %Program** %_var13
	%.Program.pantruca= getelementptr %Program* %_var14
	%.Program.chemilico= add i1 0, 0
	%_var15 = call %IO* @Program_printBoolean(%Program* %self, i1 0)

	%_var17 = icmp eq %Program* null, %.Program.pantruca
	%_var16 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var17)

	%_var19 = icmp eq %IO* null, %.Program.pot
	%_var18 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var19)

	ret %IO* %_var18
}


define %IO* @Program_printBoolean(%Program* %self, i1 %.Program.value)
{
	%_var20 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var21 = load %IO** %_var20
	br i1 %.Program.value, label %cond_true0, label %cond_false0
	cond_true0:
	%_var23 = bitcast [5 x i8]* @_string_0 to i8*

	br label %cond_next0
	cond_false0:
	%_var24 = bitcast [6 x i8]* @_string_1 to i8*

	br label %cond_next0
	cond_next0:
	%_var25 = phi i8* [ %_var23, %cond_true0 ], [ %_var24, %cond_false0 ]
	%_var22 = call %IO* @IO_out_string(%IO* %_var21, i8* %_var25)

	%_var27 = bitcast [2 x i8]* @_string_2 to i8*

	%_var26 = call %IO* @IO_out_string(%IO* %_var22, i8* %_var27)

	ret %IO* %_var26
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

