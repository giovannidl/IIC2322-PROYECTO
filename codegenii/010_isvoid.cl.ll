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

	%_Program_main_pot = alloca %IO*, align 4

	store %IO* null, %IO** %_Program_main_pot
	%_Program_main_pantruca = alloca %Program*, align 4

	%_var13 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var14 = load %Program** %_var13
	store %Program* %_var14, %Program** %_Program_main_pantruca
	%_Program_main_chemilico = alloca i1, align 4

	store i1 0, i1* %_Program_main_chemilico
	%_var16 = load  i1* %_Program_main_chemilico
	%_var15 = call %IO* @Program_printBoolean(%Program* %self, i1 0)

	%_var18 = load  %Program** %_Program_main_pantruca
	%_var19 = icmp eq %Program* null, %_var18
	%_var17 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var19)

	%_var21 = load  %IO** %_Program_main_pot
	%_var22 = icmp eq %IO* null, %_var21
	%_var20 = call %IO* @Program_printBoolean(%Program* %self, i1 %_var22)

	ret %IO* %_var20
}


define %IO* @Program_printBoolean(%Program* %self, i1 %_Program_value)
{
	%_Program_printBoolean_value = alloca i1, align 4
	store i1 %_Program_value, i1* %_Program_printBoolean_value
	%_var23 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var24 = load %IO** %_var23
	%_var26 = load  i1* %_Program_printBoolean_value
	br i1 %_var26, label %cond_true0, label %cond_false0
	cond_true0:
	%_var27 = bitcast [5 x i8]* @_string_0 to i8*

	br label %cond_next0
	cond_false0:
	%_var28 = bitcast [6 x i8]* @_string_1 to i8*

	br label %cond_next0
	cond_next0:
	%_var29 = phi i8* [ %_var27, %cond_true0 ], [ %_var28, %cond_false0 ]
	%_var25 = call %IO* @IO_out_string(%IO* %_var24, i8* %_var29)

	%_var31 = bitcast [2 x i8]* @_string_2 to i8*

	%_var30 = call %IO* @IO_out_string(%IO* %_var25, i8* %_var31)

	ret %IO* %_var30
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

