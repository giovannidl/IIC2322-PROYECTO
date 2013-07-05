%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*}
%Arbol = type { i8*}
%Nogal = type { i8*}
%Sequoia = type { i8*, %Object*}
%Manzano = type { i8*}
%ManzanoRojo = type { i8*}
%GrannySmith = type { i8*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_type_Arbol = internal constant [6 x i8] c"Arbol\00"
@_type_Nogal = internal constant [6 x i8] c"Nogal\00"
@_type_Sequoia = internal constant [8 x i8] c"Sequoia\00"
@_type_Manzano = internal constant [8 x i8] c"Manzano\00"
@_type_ManzanoRojo = internal constant [12 x i8] c"ManzanoRojo\00"
@_type_GrannySmith = internal constant [12 x i8] c"GrannySmith\00"
@_string_0 = internal constant [7 x i8] c"Arbol \00"
@_string_1 = internal constant [2 x i8] c"\0A\00"
@_string_2 = internal constant [9 x i8] c"Manzano \00"
@_string_3 = internal constant [2 x i8] c"\0A\00"
@_string_4 = internal constant [13 x i8] c"GrannySmith \00"
@_string_5 = internal constant [2 x i8] c"\0A\00"
@_string_6 = internal constant [13 x i8] c"ManzanoRojo \00"
@_string_7 = internal constant [2 x i8] c"\0A\00"
@_string_8 = internal constant [9 x i8] c"Sequoia \00"
@_string_9 = internal constant [2 x i8] c"\0A\00"
@_string_10 = internal constant [7 x i8] c"Nogal \00"
@_string_11 = internal constant [2 x i8] c"\0A\00"
@_string_12 = internal constant [32 x i8] c"I have not idea what I am doing\00"
@_string_13 = internal constant [5 x i8] c"Nuez\00"
@_string_14 = internal constant [8 x i8] c"Manzana\00"
@_string_15 = internal constant [13 x i8] c"Manzana roja\00"
@_string_16 = internal constant [14 x i8] c"Manzana verde\00"

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


define %Arbol* @_newArbol()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Arbol* getelementptr (%Arbol* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Arbol*
	%class_type = getelementptr %Arbol* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_Arbol to i8*), i8** %class_type

	ret %Arbol* %self
}


define %Nogal* @_newNogal()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Nogal* getelementptr (%Nogal* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Nogal*
	%class_type = getelementptr %Nogal* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_Nogal to i8*), i8** %class_type

	ret %Nogal* %self
}


define %Sequoia* @_newSequoia()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Sequoia* getelementptr (%Sequoia* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Sequoia*
	%class_type = getelementptr %Sequoia* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_Sequoia to i8*), i8** %class_type

	%_var60 = getelementptr inbounds %Sequoia* %self, i32 0, i32 1
	store %Object* null, %Object** %_var60
	ret %Sequoia* %self
}


define %Manzano* @_newManzano()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Manzano* getelementptr (%Manzano* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Manzano*
	%class_type = getelementptr %Manzano* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_Manzano to i8*), i8** %class_type

	ret %Manzano* %self
}


define %ManzanoRojo* @_newManzanoRojo()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%ManzanoRojo* getelementptr (%ManzanoRojo* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %ManzanoRojo*
	%class_type = getelementptr %ManzanoRojo* %self, i32 0, i32 0
	store i8* bitcast([12 x i8]* @_type_ManzanoRojo to i8*), i8** %class_type

	ret %ManzanoRojo* %self
}


define %GrannySmith* @_newGrannySmith()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%GrannySmith* getelementptr (%GrannySmith* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %GrannySmith*
	%class_type = getelementptr %GrannySmith* %self, i32 0, i32 0
	store i8* bitcast([12 x i8]* @_type_GrannySmith to i8*), i8** %class_type

	ret %GrannySmith* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var2 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var3 = load %IO** %_var2
	%_var5 = bitcast [7 x i8]* @_string_0 to i8*

	%_var4 = call %IO* @IO_out_string(%IO* %_var3, i8* %_var5)

	%_var7 = call %Arbol* @_newArbol()
	%_var8 = call i8* @Arbol_getFruto(%Arbol* %_var7)

	%_var6 = call %IO* @IO_out_string(%IO* %_var4, i8* %_var8)

	%_var10 = bitcast [2 x i8]* @_string_1 to i8*

	%_var9 = call %IO* @IO_out_string(%IO* %_var6, i8* %_var10)

	%_var11 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var12 = load %IO** %_var11
	%_var14 = bitcast [9 x i8]* @_string_2 to i8*

	%_var13 = call %IO* @IO_out_string(%IO* %_var12, i8* %_var14)

	%_var16 = call %Manzano* @_newManzano()
	%_var17 = call i8* @Manzano_getFruto(%Manzano* %_var16)

	%_var15 = call %IO* @IO_out_string(%IO* %_var13, i8* %_var17)

	%_var19 = bitcast [2 x i8]* @_string_3 to i8*

	%_var18 = call %IO* @IO_out_string(%IO* %_var15, i8* %_var19)

	%_var20 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var21 = load %IO** %_var20
	%_var23 = bitcast [13 x i8]* @_string_4 to i8*

	%_var22 = call %IO* @IO_out_string(%IO* %_var21, i8* %_var23)

	%_var25 = call %GrannySmith* @_newGrannySmith()
	%_var26 = call i8* @GrannySmith_getFruto(%GrannySmith* %_var25)

	%_var24 = call %IO* @IO_out_string(%IO* %_var22, i8* %_var26)

	%_var28 = bitcast [2 x i8]* @_string_5 to i8*

	%_var27 = call %IO* @IO_out_string(%IO* %_var24, i8* %_var28)

	%_var29 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var30 = load %IO** %_var29
	%_var32 = bitcast [13 x i8]* @_string_6 to i8*

	%_var31 = call %IO* @IO_out_string(%IO* %_var30, i8* %_var32)

	%_var34 = call %ManzanoRojo* @_newManzanoRojo()
	%_var35 = call i8* @ManzanoRojo_getFruto(%ManzanoRojo* %_var34)

	%_var33 = call %IO* @IO_out_string(%IO* %_var31, i8* %_var35)

	%_var37 = bitcast [2 x i8]* @_string_7 to i8*

	%_var36 = call %IO* @IO_out_string(%IO* %_var33, i8* %_var37)

	%_var38 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var39 = load %IO** %_var38
	%_var41 = bitcast [9 x i8]* @_string_8 to i8*

	%_var40 = call %IO* @IO_out_string(%IO* %_var39, i8* %_var41)

	%_var43 = call %Sequoia* @_newSequoia()
	%_var45 = bitcast %Sequoia* %_var43 to %Arbol*
	%_var44 = call i8* @Arbol_getFruto(%Arbol* %_var45)

	%_var42 = call %IO* @IO_out_string(%IO* %_var40, i8* %_var44)

	%_var47 = bitcast [2 x i8]* @_string_9 to i8*

	%_var46 = call %IO* @IO_out_string(%IO* %_var42, i8* %_var47)

	%_var48 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var49 = load %IO** %_var48
	%_var51 = bitcast [7 x i8]* @_string_10 to i8*

	%_var50 = call %IO* @IO_out_string(%IO* %_var49, i8* %_var51)

	%_var53 = call %Nogal* @_newNogal()
	%_var54 = call i8* @Nogal_getFruto(%Nogal* %_var53)

	%_var52 = call %IO* @IO_out_string(%IO* %_var50, i8* %_var54)

	%_var56 = bitcast [2 x i8]* @_string_11 to i8*

	%_var55 = call %IO* @IO_out_string(%IO* %_var52, i8* %_var56)

	%_var57 = bitcast %IO* %_var55 to %Object*
	ret %Object* %_var57
}


define i8* @Arbol_getFruto(%Arbol* %self)
{
	%_var58 = bitcast [32 x i8]* @_string_12 to i8*

	ret i8* %_var58
}


define i8* @Nogal_getFruto(%Nogal* %self)
{
	%_var59 = bitcast [5 x i8]* @_string_13 to i8*

	ret i8* %_var59
}


define i8* @Manzano_getFruto(%Manzano* %self)
{
	%_var61 = bitcast [8 x i8]* @_string_14 to i8*

	ret i8* %_var61
}


define i8* @ManzanoRojo_getFruto(%ManzanoRojo* %self)
{
	%_var62 = bitcast [13 x i8]* @_string_15 to i8*

	ret i8* %_var62
}


define i8* @GrannySmith_getFruto(%GrannySmith* %self)
{
	%_var63 = bitcast [14 x i8]* @_string_16 to i8*

	ret i8* %_var63
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

