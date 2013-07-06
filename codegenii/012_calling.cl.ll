%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%Computer = type { i8*}
%MachineCode = type { i8*}
%X86 = type { i8*}
%ARM16 = type { i8*}
%VirtualMachine = type { i8*}
%LLVM = type { i8*}
%CIL = type { i8*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_type_Computer = internal constant [9 x i8] c"Computer\00"
@_type_MachineCode = internal constant [12 x i8] c"MachineCode\00"
@_type_X86 = internal constant [4 x i8] c"X86\00"
@_type_ARM16 = internal constant [6 x i8] c"ARM16\00"
@_type_VirtualMachine = internal constant [15 x i8] c"VirtualMachine\00"
@_type_LLVM = internal constant [5 x i8] c"LLVM\00"
@_type_CIL = internal constant [4 x i8] c"CIL\00"
@_string_0 = internal constant [2 x i8] c"\0A\00"
@_string_1 = internal constant [2 x i8] c"\0A\00"
@_string_2 = internal constant [2 x i8] c"\0A\00"
@_string_3 = internal constant [2 x i8] c"\0A\00"
@_string_4 = internal constant [2 x i8] c"\0A\00"
@_string_5 = internal constant [2 x i8] c"\0A\00"
@_string_6 = internal constant [2 x i8] c"\0A\00"
@_string_7 = internal constant [2 x i8] c"\0A\00"
@_string_8 = internal constant [2 x i8] c"\0A\00"
@_string_9 = internal constant [2 x i8] c"\0A\00"
@_string_10 = internal constant [2 x i8] c"\0A\00"
@_string_11 = internal constant [2 x i8] c"\0A\00"
@_string_12 = internal constant [9 x i8] c"Computer\00"
@_string_13 = internal constant [7 x i8] c"Native\00"
@_string_14 = internal constant [11 x i8] c"Intel i686\00"
@_string_15 = internal constant [12 x i8] c"ARMv6 Thumb\00"
@_string_16 = internal constant [8 x i8] c"Virtual\00"
@_string_17 = internal constant [8 x i8] c"LLVM IR\00"
@_string_18 = internal constant [4 x i8] c"CIL\00"

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
	%_var3 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var0 = call %IO* @_newIO()
	store %IO* %_var0, %IO** %_var1
	%_var2 = call %X86* @_newX86()
	store %X86* %_var2, %X86** %_var3
	%_var4 = call %ARM16* @_newARM16()
	store %ARM16* %_var4, %ARM16** %_var5
	%_var6 = call %LLVM* @_newLLVM()
	store %LLVM* %_var6, %LLVM** %_var7
	%_var8 = call %CIL* @_newCIL()
	store %CIL* %_var8, %CIL** %_var9
	ret %Program* %self
}


define %Computer* @_newComputer()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Computer* getelementptr (%Computer* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Computer*
	%class_type = getelementptr %Computer* %self, i32 0, i32 0
	store i8* bitcast([9 x i8]* @_type_Computer to i8*), i8** %class_type

	ret %Computer* %self
}


define %MachineCode* @_newMachineCode()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%MachineCode* getelementptr (%MachineCode* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %MachineCode*
	%class_type = getelementptr %MachineCode* %self, i32 0, i32 0
	store i8* bitcast([12 x i8]* @_type_MachineCode to i8*), i8** %class_type

	ret %MachineCode* %self
}


define %X86* @_newX86()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%X86* getelementptr (%X86* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %X86*
	%class_type = getelementptr %X86* %self, i32 0, i32 0
	store i8* bitcast([4 x i8]* @_type_X86 to i8*), i8** %class_type

	ret %X86* %self
}


define %ARM16* @_newARM16()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%ARM16* getelementptr (%ARM16* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %ARM16*
	%class_type = getelementptr %ARM16* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_ARM16 to i8*), i8** %class_type

	ret %ARM16* %self
}


define %VirtualMachine* @_newVirtualMachine()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%VirtualMachine* getelementptr (%VirtualMachine* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %VirtualMachine*
	%class_type = getelementptr %VirtualMachine* %self, i32 0, i32 0
	store i8* bitcast([15 x i8]* @_type_VirtualMachine to i8*), i8** %class_type

	ret %VirtualMachine* %self
}


define %LLVM* @_newLLVM()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%LLVM* getelementptr (%LLVM* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %LLVM*
	%class_type = getelementptr %LLVM* %self, i32 0, i32 0
	store i8* bitcast([5 x i8]* @_type_LLVM to i8*), i8** %class_type

	ret %LLVM* %self
}


define %CIL* @_newCIL()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%CIL* getelementptr (%CIL* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %CIL*
	%class_type = getelementptr %CIL* %self, i32 0, i32 0
	store i8* bitcast([4 x i8]* @_type_CIL to i8*), i8** %class_type

	ret %CIL* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var10 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var11 = load %IO** %_var10
	%_var13 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var14 = load %X86** %_var13
	%_var15 = call i8* @X86_platform(%X86* %_var14)

	%_var12 = call %IO* @IO_out_string(%IO* %_var11, i8* %_var15)

	%_var17 = bitcast [2 x i8]* @_string_0 to i8*

	%_var16 = call %IO* @IO_out_string(%IO* %_var12, i8* %_var17)

	%_var18 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var19 = load %IO** %_var18
	%_var21 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var22 = load %X86** %_var21
	%_var24 = bitcast %X86* %_var22 to %MachineCode*
	%_var23 = call i8* @MachineCode_platform(%MachineCode* %_var24)

	%_var20 = call %IO* @IO_out_string(%IO* %_var19, i8* %_var23)

	%_var26 = bitcast [2 x i8]* @_string_1 to i8*

	%_var25 = call %IO* @IO_out_string(%IO* %_var20, i8* %_var26)

	%_var27 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var28 = load %IO** %_var27
	%_var30 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var31 = load %X86** %_var30
	%_var33 = bitcast %X86* %_var31 to %Computer*
	%_var32 = call i8* @Computer_platform(%Computer* %_var33)

	%_var29 = call %IO* @IO_out_string(%IO* %_var28, i8* %_var32)

	%_var35 = bitcast [2 x i8]* @_string_2 to i8*

	%_var34 = call %IO* @IO_out_string(%IO* %_var29, i8* %_var35)

	%_var36 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var37 = load %IO** %_var36
	%_var39 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var40 = load %ARM16** %_var39
	%_var41 = call i8* @ARM16_platform(%ARM16* %_var40)

	%_var38 = call %IO* @IO_out_string(%IO* %_var37, i8* %_var41)

	%_var43 = bitcast [2 x i8]* @_string_3 to i8*

	%_var42 = call %IO* @IO_out_string(%IO* %_var38, i8* %_var43)

	%_var44 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var45 = load %IO** %_var44
	%_var47 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var48 = load %ARM16** %_var47
	%_var50 = bitcast %ARM16* %_var48 to %MachineCode*
	%_var49 = call i8* @MachineCode_platform(%MachineCode* %_var50)

	%_var46 = call %IO* @IO_out_string(%IO* %_var45, i8* %_var49)

	%_var52 = bitcast [2 x i8]* @_string_4 to i8*

	%_var51 = call %IO* @IO_out_string(%IO* %_var46, i8* %_var52)

	%_var53 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var54 = load %IO** %_var53
	%_var56 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var57 = load %ARM16** %_var56
	%_var59 = bitcast %ARM16* %_var57 to %Computer*
	%_var58 = call i8* @Computer_platform(%Computer* %_var59)

	%_var55 = call %IO* @IO_out_string(%IO* %_var54, i8* %_var58)

	%_var61 = bitcast [2 x i8]* @_string_5 to i8*

	%_var60 = call %IO* @IO_out_string(%IO* %_var55, i8* %_var61)

	%_var62 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var63 = load %IO** %_var62
	%_var65 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var66 = load %LLVM** %_var65
	%_var67 = call i8* @LLVM_platform(%LLVM* %_var66)

	%_var64 = call %IO* @IO_out_string(%IO* %_var63, i8* %_var67)

	%_var69 = bitcast [2 x i8]* @_string_6 to i8*

	%_var68 = call %IO* @IO_out_string(%IO* %_var64, i8* %_var69)

	%_var70 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var71 = load %IO** %_var70
	%_var73 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var74 = load %LLVM** %_var73
	%_var76 = bitcast %LLVM* %_var74 to %VirtualMachine*
	%_var75 = call i8* @VirtualMachine_platform(%VirtualMachine* %_var76)

	%_var72 = call %IO* @IO_out_string(%IO* %_var71, i8* %_var75)

	%_var78 = bitcast [2 x i8]* @_string_7 to i8*

	%_var77 = call %IO* @IO_out_string(%IO* %_var72, i8* %_var78)

	%_var79 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var80 = load %IO** %_var79
	%_var82 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var83 = load %LLVM** %_var82
	%_var85 = bitcast %LLVM* %_var83 to %Computer*
	%_var84 = call i8* @Computer_platform(%Computer* %_var85)

	%_var81 = call %IO* @IO_out_string(%IO* %_var80, i8* %_var84)

	%_var87 = bitcast [2 x i8]* @_string_8 to i8*

	%_var86 = call %IO* @IO_out_string(%IO* %_var81, i8* %_var87)

	%_var88 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var89 = load %IO** %_var88
	%_var91 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var92 = load %CIL** %_var91
	%_var93 = call i8* @CIL_platform(%CIL* %_var92)

	%_var90 = call %IO* @IO_out_string(%IO* %_var89, i8* %_var93)

	%_var95 = bitcast [2 x i8]* @_string_9 to i8*

	%_var94 = call %IO* @IO_out_string(%IO* %_var90, i8* %_var95)

	%_var96 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var97 = load %IO** %_var96
	%_var99 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var100 = load %CIL** %_var99
	%_var102 = bitcast %CIL* %_var100 to %VirtualMachine*
	%_var101 = call i8* @VirtualMachine_platform(%VirtualMachine* %_var102)

	%_var98 = call %IO* @IO_out_string(%IO* %_var97, i8* %_var101)

	%_var104 = bitcast [2 x i8]* @_string_10 to i8*

	%_var103 = call %IO* @IO_out_string(%IO* %_var98, i8* %_var104)

	%_var105 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var106 = load %IO** %_var105
	%_var108 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var109 = load %CIL** %_var108
	%_var111 = bitcast %CIL* %_var109 to %Computer*
	%_var110 = call i8* @Computer_platform(%Computer* %_var111)

	%_var107 = call %IO* @IO_out_string(%IO* %_var106, i8* %_var110)

	%_var113 = bitcast [2 x i8]* @_string_11 to i8*

	%_var112 = call %IO* @IO_out_string(%IO* %_var107, i8* %_var113)

	%_var114 = bitcast %IO* %_var112 to %Object*
	ret %Object* %_var114
}


define i8* @Computer_platform(%Computer* %self)
{
	%_var115 = bitcast [9 x i8]* @_string_12 to i8*

	ret i8* %_var115
}


define i8* @MachineCode_platform(%MachineCode* %self)
{
	%_var116 = bitcast [7 x i8]* @_string_13 to i8*

	ret i8* %_var116
}


define i8* @X86_platform(%X86* %self)
{
	%_var117 = bitcast [11 x i8]* @_string_14 to i8*

	ret i8* %_var117
}


define i8* @ARM16_platform(%ARM16* %self)
{
	%_var118 = bitcast [12 x i8]* @_string_15 to i8*

	ret i8* %_var118
}


define i8* @VirtualMachine_platform(%VirtualMachine* %self)
{
	%_var119 = bitcast [8 x i8]* @_string_16 to i8*

	ret i8* %_var119
}


define i8* @LLVM_platform(%LLVM* %self)
{
	%_var120 = bitcast [8 x i8]* @_string_17 to i8*

	ret i8* %_var120
}


define i8* @CIL_platform(%CIL* %self)
{
	%_var121 = bitcast [4 x i8]* @_string_18 to i8*

	ret i8* %_var121
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

