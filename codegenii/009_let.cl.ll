%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_string_0 = internal constant [2 x i8] c"\0A\00"

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
	%_Program_main_i = alloca i32, align 4

	store i32 0, i32* %_Program_main_i
	%_var2 = load  i32* %_Program_main_i
	%_var3 = icmp slt i32 %_var2, 20
	br i1 %_var3, label %Looop0, label %endLooop0
	Looop0:
	%_var5 = load  i32* %_Program_main_i
	%_var4 = call %IO* @Program_freefall(%Program* %self, i32 %_var5)

	%_var6 = load  i32* %_Program_main_i
	%_var7 = add i32 %_var6, 1
	store i32 %_var7, i32* %_Program_main_i
	%_var8 = load  i32* %_Program_main_i
	%_var9 = icmp slt i32 %_var8, 20
	br i1 %_var9, label %Looop0, label %endLooop0
	endLooop0:
	%_var10 = getelementptr %Object* null
	ret %Object* %_var10
}


define %IO* @Program_freefall(%Program* %self, i32 %_Program_time)
{
	%_Program_freefall_time = alloca i32, align 4
	store i32 %_Program_time, i32* %_Program_freefall_time
	%_Program_freefall_accel = alloca i32, align 4

	store i32 98, i32* %_Program_freefall_accel
	%_Program_freefall_speed = alloca i32, align 4

	%_var11 = load  i32* %_Program_freefall_accel
	%_var12 = load  i32* %_Program_freefall_time
	%_var13 = mul i32 %_var11, %_var12
	store i32 %_var13, i32* %_Program_freefall_speed
	%_Program_freefall_distance = alloca i32, align 4

	%_var14 = load  i32* %_Program_freefall_speed
	%_var15 = load  i32* %_Program_freefall_time
	%_var16 = mul i32 %_var14, %_var15
	%_var17 = sdiv i32 %_var16, 2
	store i32 %_var17, i32* %_Program_freefall_distance
	%_var18 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var19 = load %IO** %_var18
	%_var21 = load  i32* %_Program_freefall_distance
	%_var20 = call %IO* @IO_out_int(%IO* %_var19, i32 %_var21)

	%_var23 = bitcast [2 x i8]* @_string_0 to i8*

	%_var22 = call %IO* @IO_out_string(%IO* %_var20, i8* %_var23)

	ret %IO* %_var22
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

