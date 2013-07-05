%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*}
%Trabajo = type { i8*}
%Diversion = type { i8*}
%Cine = type { i8*}
%Deportes = type { i8*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_type_Trabajo = internal constant [8 x i8] c"Trabajo\00"
@_type_Diversion = internal constant [10 x i8] c"Diversion\00"
@_type_Cine = internal constant [5 x i8] c"Cine\00"
@_type_Deportes = internal constant [9 x i8] c"Deportes\00"
@_string_0 = internal constant [15 x i8] c"Yo trabajo en \00"
@_string_1 = internal constant [2 x i8] c"\0A\00"
@_string_2 = internal constant [22 x i8] c"Me encanta practicar \00"
@_string_3 = internal constant [2 x i8] c"\0A\00"
@_string_4 = internal constant [22 x i8] c"En mis ratos libres, \00"
@_string_5 = internal constant [2 x i8] c"\0A\00"
@_string_6 = internal constant [8 x i8] c"Soy un \00"
@_string_7 = internal constant [15 x i8] c" inimprimible\0A\00"
@_string_8 = internal constant [10 x i8] c"Agromapas\00"
@_string_9 = internal constant [12 x i8] c"Pasatiempos\00"
@_string_10 = internal constant [13 x i8] c"The Avengers\00"
@_string_11 = internal constant [9 x i8] c"Ciclismo\00"

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


define %Trabajo* @_newTrabajo()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Trabajo* getelementptr (%Trabajo* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Trabajo*
	%class_type = getelementptr %Trabajo* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_Trabajo to i8*), i8** %class_type

	ret %Trabajo* %self
}


define %Diversion* @_newDiversion()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Diversion* getelementptr (%Diversion* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Diversion*
	%class_type = getelementptr %Diversion* %self, i32 0, i32 0
	store i8* bitcast([10 x i8]* @_type_Diversion to i8*), i8** %class_type

	ret %Diversion* %self
}


define %Cine* @_newCine()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Cine* getelementptr (%Cine* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Cine*
	%class_type = getelementptr %Cine* %self, i32 0, i32 0
	store i8* bitcast([5 x i8]* @_type_Cine to i8*), i8** %class_type

	ret %Cine* %self
}


define %Deportes* @_newDeportes()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Deportes* getelementptr (%Deportes* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Deportes*
	%class_type = getelementptr %Deportes* %self, i32 0, i32 0
	store i8* bitcast([9 x i8]* @_type_Deportes to i8*), i8** %class_type

	ret %Deportes* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var3 = call %Trabajo* @_newTrabajo()
	%_var4 = bitcast %Trabajo* %_var3 to %Object*
	%_var2 = call %Object* @Program_print(%Program* %self, %Object* %_var4)

	%_var6 = call %Cine* @_newCine()
	%_var7 = bitcast %Cine* %_var6 to %Object*
	%_var5 = call %Object* @Program_print(%Program* %self, %Object* %_var7)

	%_var9 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var10 = load %IO** %_var9
	%_var11 = bitcast %IO* %_var10 to %Object*
	%_var8 = call %Object* @Program_print(%Program* %self, %Object* %_var11)

	%_var13 = call %Deportes* @_newDeportes()
	%_var14 = bitcast %Deportes* %_var13 to %Object*
	%_var12 = call %Object* @Program_print(%Program* %self, %Object* %_var14)

	ret %Object* %_var12
}


define %Object* @Program_print(%Program* %self, %Object* %.Program.o)
{
	%_var15 = getelementptr %Object* %.Program.o, i32 0, i32 0
	%_var16 = bitcast i8** %_var15 to i8*
	%_var17 = bitcast [8 x i8]* @_type_Trabajo to i8*

	%_var18 = call i32 @strcmp(i8* %_var16, i8* %_var17)
	%_var19 = icmp eq i32 0, %_var18
	br i1 %_var19, label %Trabajo0, label %FalseJump0_0
	FalseJump0_0:
	%_var20 = bitcast [9 x i8]* @_type_Deportes to i8*

	%_var21 = call i32 @strcmp(i8* %_var16, i8* %_var20)
	%_var22 = icmp eq i32 0, %_var21
	br i1 %_var22, label %Deportes0, label %FalseJump0_1
	FalseJump0_1:
	%_var23 = bitcast [10 x i8]* @_type_Diversion to i8*

	%_var24 = call i32 @strcmp(i8* %_var16, i8* %_var23)
	%_var25 = icmp eq i32 0, %_var24
	br i1 %_var25, label %Diversion0, label %FalseJump0_2
	FalseJump0_2:
	%_var26 = bitcast [7 x i8]* @_type_Object to i8*

	%_var27 = call i32 @strcmp(i8* %_var16, i8* %_var26)
	%_var28 = icmp eq i32 0, %_var27
	br i1 %_var28, label %Object0, label %FalseJump0_3
	Trabajo0:
	%.Trabajo.work = bitcast %Object* %.Program.o to %Trabajo*
	%_var29 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var30 = load %IO** %_var29
	%_var32 = bitcast [15 x i8]* @_string_0 to i8*

	%_var31 = call %IO* @IO_out_string(%IO* %_var30, i8* %_var32)

	%_var35 = bitcast %Program* %self to %Trabajo*
	%_var34 = call i8* @Trabajo_getEmpresa(%Trabajo* %_var35)

	%_var33 = call %IO* @IO_out_string(%IO* %_var31, i8* %_var34)

	%_var37 = bitcast [2 x i8]* @_string_1 to i8*

	%_var36 = call %IO* @IO_out_string(%IO* %_var33, i8* %_var37)

	br label %final_case0
	Deportes0:
	%.Deportes.sport = bitcast %Object* %.Program.o to %Deportes*
	%_var38 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var39 = load %IO** %_var38
	%_var41 = bitcast [22 x i8]* @_string_2 to i8*

	%_var40 = call %IO* @IO_out_string(%IO* %_var39, i8* %_var41)

	%_var44 = bitcast %Program* %self to %Deportes*
	%_var43 = call i8* @Deportes_getFunFunFun(%Deportes* %_var44)

	%_var42 = call %IO* @IO_out_string(%IO* %_var40, i8* %_var43)

	%_var46 = bitcast [2 x i8]* @_string_3 to i8*

	%_var45 = call %IO* @IO_out_string(%IO* %_var42, i8* %_var46)

	br label %final_case0
	Diversion0:
	%.Diversion.fun = bitcast %Object* %.Program.o to %Diversion*
	%_var47 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var48 = load %IO** %_var47
	%_var50 = bitcast [22 x i8]* @_string_4 to i8*

	%_var49 = call %IO* @IO_out_string(%IO* %_var48, i8* %_var50)

	%_var53 = bitcast %Program* %self to %Diversion*
	%_var52 = call i8* @Diversion_getFunFunFun(%Diversion* %_var53)

	%_var51 = call %IO* @IO_out_string(%IO* %_var49, i8* %_var52)

	%_var55 = bitcast [2 x i8]* @_string_5 to i8*

	%_var54 = call %IO* @IO_out_string(%IO* %_var51, i8* %_var55)

	br label %final_case0
	Object0:
	%.Object.object = bitcast %Object* %.Program.o to %Object*
	%_var56 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var57 = load %IO** %_var56
	%_var59 = bitcast [8 x i8]* @_string_6 to i8*

	%_var58 = call %IO* @IO_out_string(%IO* %_var57, i8* %_var59)

	%_var62 = bitcast %Program* %self to %Object*
	%_var61 = call i8* @Object_type_name(%Object* %_var62)

	%_var60 = call %IO* @IO_out_string(%IO* %_var58, i8* %_var61)

	%_var64 = bitcast [15 x i8]* @_string_7 to i8*

	%_var63 = call %IO* @IO_out_string(%IO* %_var60, i8* %_var64)

	br label %final_case0
	FalseJump0_3:
	%_var65 = call %IO* @_newIO()
	br label %final_case0
	final_case0:
	%_var66 = phi %IO* [ %_var36, %Trabajo0 ],[ %_var45, %Deportes0 ],[ %_var54, %Diversion0 ],[ %_var63, %Object0 ],[ %_var65, %FalseJump0_3]
	%_var67 = bitcast %IO* %_var66 to %Object*
	ret %Object* %_var67
}


define i8* @Trabajo_getEmpresa(%Trabajo* %self)
{
	%_var68 = bitcast [10 x i8]* @_string_8 to i8*

	ret i8* %_var68
}


define i8* @Diversion_getFunFunFun(%Diversion* %self)
{
	%_var69 = bitcast [12 x i8]* @_string_9 to i8*

	ret i8* %_var69
}


define i8* @Cine_getFunFunFun(%Cine* %self)
{
	%_var70 = bitcast [13 x i8]* @_string_10 to i8*

	ret i8* %_var70
}


define i8* @Deportes_getFunFunFun(%Deportes* %self)
{
	%_var71 = bitcast [9 x i8]* @_string_11 to i8*

	ret i8* %_var71
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

