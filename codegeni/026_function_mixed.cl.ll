%Object = type { i8* }
%IO = type { i8* }
%Main = type { i8* }

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_Main_digits = global i8* getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0)
@_string_0 = internal constant [11 x i8] c"0123456789\00"
@_string_1 = internal constant [2 x i8] c"\0A\00"
@_string_2 = internal constant [2 x i8] c"\0A\00"
@_string_3 = internal constant [2 x i8] c"\0A\00"
@_string_4 = internal constant [2 x i8] c"0\00"
@_string_5 = internal constant [2 x i8] c"1\00"

define i32 @main()
{
	call void @_Main_initializeAttributes(%Main* null)
	call %Object* @Main_main(%Main* null)
	ret i32 0
}

define void @_Main_initializeAttributes(%Main* %m)
{
	%_var0 = load [11 x i8]* @_string_0

	%_var1 = bitcast [11 x i8]* @_string_0 to i8*

	store i8* %_var1, i8** @_Main_digits
	ret void
}


define %Object* @Main_main(%Main* %_m)
{
	%_superCast = bitcast %Main* %_m to %IO*
	%_var3 = call i8* @Main_itoa(%Main* %_m, i32 1898524, i1 0)

	%_var2 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var3)

	%_var5 = load [2 x i8]* @_string_1

	%_var6 = bitcast [2 x i8]* @_string_1 to i8*

	%_var4 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var6)

	%_var9 = sub i32 123, 11
	%_var8 = call i8* @Main_itoa(%Main* %_m, i32 %_var9, i1 0)

	%_var7 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var8)

	%_var11 = load [2 x i8]* @_string_2

	%_var12 = bitcast [2 x i8]* @_string_2 to i8*

	%_var10 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var12)

	%_var14 = call i8* @Main_itoa(%Main* %_m, i32 126, i1 1)

	%_var13 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var14)

	%_var16 = load [2 x i8]* @_string_3

	%_var17 = bitcast [2 x i8]* @_string_3 to i8*

	%_var15 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var17)

	%_var20 = mul i32 2, 10
	%_var19 = call i8* @Main_itoa(%Main* %_m, i32 %_var20, i1 1)

	%_var18 = call %IO* @IO_out_string(%IO* %_superCast, i8* %_var19)

	%_var21 = bitcast %IO* %_var18 to %Object*
	ret %Object* null
}


define i8* @Main_itoa(%Main* %_m, i32 %.Main.number, i1 %.Main.binary)
{
	br i1 %.Main.binary, label %cond_true0, label %cond_false0
	cond_true0:
	%_var22 = call i8* @Main_itoa_binary(%Main* %_m, i32 %.Main.number)

	br label %cond_next0
	cond_false0:
	%_var23 = call i8* @Main_itoa_decimal(%Main* %_m, i32 %.Main.number)

	br label %cond_next0
	cond_next0:
	%_var24 = phi i8* [ %_var22, %cond_true0 ], [ %_var23, %cond_false0 ]
	ret i8* %_var24
}


define i8* @Main_itoa_decimal(%Main* %_m, i32 %.Main.number)
{
	%_var25 = icmp slt i32 %.Main.number, 10
	br i1 %_var25, label %cond_true1, label %cond_false1
	cond_true1:
	%_var26 = load i8** @_Main_digits

	%_var27 = call i8* @String_substr(i8* %_var26, i32 %.Main.number, i32 1)

	br label %cond_next1
	cond_false1:
	%_var29 = sdiv i32 %.Main.number, 10
	%_var28 = call i8* @Main_itoa_decimal(%Main* %_m, i32 %_var29)

	%_var32 = sdiv i32 %.Main.number, 10
	%_var33 = mul i32 %_var32, 10
	%_var34 = sub i32 %.Main.number, %_var33
	%_var31 = call i8* @Main_itoa_decimal(%Main* %_m, i32 %_var34)

	%_var30 = call i8* @String_concat(i8* %_var28, i8* %_var31)

	br label %cond_next1
	cond_next1:
	%_var35 = phi i8* [ %_var27, %cond_true1 ], [ %_var30, %cond_false1 ]
	ret i8* %_var35
}


define i8* @Main_itoa_binary(%Main* %_m, i32 %.Main.n)
{
	%_var36 = icmp slt i32 %.Main.n, 2
	br i1 %_var36, label %cond_true2, label %cond_false2
	cond_true2:
	%_var37 = icmp eq i32 %.Main.n, 0
	br i1 %_var37, label %cond_true3, label %cond_false3
	cond_true3:
	%_var38 = load [2 x i8]* @_string_4

	%_var39 = bitcast [2 x i8]* @_string_4 to i8*

	br label %cond_next3
	cond_false3:
	%_var40 = load [2 x i8]* @_string_5

	%_var41 = bitcast [2 x i8]* @_string_5 to i8*

	br label %cond_next3
	cond_next3:
	%_var42 = phi i8* [ %_var39, %cond_true3 ], [ %_var41, %cond_false3 ]
	br label %cond_next2
	cond_false2:
	%_var44 = sdiv i32 %.Main.n, 2
	%_var43 = call i8* @Main_itoa_binary(%Main* %_m, i32 %_var44)

	%_var47 = sdiv i32 %.Main.n, 2
	%_var48 = mul i32 %_var47, 2
	%_var49 = sub i32 %.Main.n, %_var48
	%_var46 = call i8* @Main_itoa_binary(%Main* %_m, i32 %_var49)

	%_var45 = call i8* @String_concat(i8* %_var43, i8* %_var46)

	br label %cond_next2
	cond_next2:
	%_var50 = phi i8* [ %_var42, %cond_next3 ], [ %_var45, %cond_false2 ]
	ret i8* %_var50
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

