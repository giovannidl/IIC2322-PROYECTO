%Object = type { i8* }

%IO = type { i8*}
%Program = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%MachineCode = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%X86 = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%ARM16 = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%VirtualMachine = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%LLVM = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}
%CIL = type { i8*, %IO*, %X86*, %ARM16*, %LLVM*, %CIL*}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
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


define %MachineCode* @_newMachineCode()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%MachineCode* getelementptr (%MachineCode* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %MachineCode*
	%class_type = getelementptr %MachineCode* %self, i32 0, i32 0
	store i8* bitcast([12 x i8]* @_type_MachineCode to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %MachineCode* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %MachineCode* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %MachineCode* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %MachineCode* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %MachineCode* %self, i32 0, i32 5
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
	ret %MachineCode* %self
}


define %X86* @_newX86()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%X86* getelementptr (%X86* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %X86*
	%class_type = getelementptr %X86* %self, i32 0, i32 0
	store i8* bitcast([4 x i8]* @_type_X86 to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %X86* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %X86* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %X86* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %X86* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %X86* %self, i32 0, i32 5
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
	ret %X86* %self
}


define %ARM16* @_newARM16()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%ARM16* getelementptr (%ARM16* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %ARM16*
	%class_type = getelementptr %ARM16* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_ARM16 to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %ARM16* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %ARM16* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %ARM16* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %ARM16* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %ARM16* %self, i32 0, i32 5
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
	ret %ARM16* %self
}


define %VirtualMachine* @_newVirtualMachine()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%VirtualMachine* getelementptr (%VirtualMachine* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %VirtualMachine*
	%class_type = getelementptr %VirtualMachine* %self, i32 0, i32 0
	store i8* bitcast([15 x i8]* @_type_VirtualMachine to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %VirtualMachine* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %VirtualMachine* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %VirtualMachine* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %VirtualMachine* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %VirtualMachine* %self, i32 0, i32 5
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
	ret %VirtualMachine* %self
}


define %LLVM* @_newLLVM()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%LLVM* getelementptr (%LLVM* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %LLVM*
	%class_type = getelementptr %LLVM* %self, i32 0, i32 0
	store i8* bitcast([5 x i8]* @_type_LLVM to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %LLVM* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %LLVM* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %LLVM* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %LLVM* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %LLVM* %self, i32 0, i32 5
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
	ret %LLVM* %self
}


define %CIL* @_newCIL()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%CIL* getelementptr (%CIL* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %CIL*
	%class_type = getelementptr %CIL* %self, i32 0, i32 0
	store i8* bitcast([4 x i8]* @_type_CIL to i8*), i8** %class_type

	%_var1 = getelementptr inbounds %CIL* %self, i32 0, i32 1
	%_var3 = getelementptr inbounds %CIL* %self, i32 0, i32 2
	%_var5 = getelementptr inbounds %CIL* %self, i32 0, i32 3
	%_var7 = getelementptr inbounds %CIL* %self, i32 0, i32 4
	%_var9 = getelementptr inbounds %CIL* %self, i32 0, i32 5
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

	%_var17 = load [2 x i8]* @_string_0

	%_var18 = bitcast [2 x i8]* @_string_0 to i8*

	%_var16 = call %IO* @IO_out_string(%IO* %_var12, i8* %_var18)

	%_var19 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var20 = load %IO** %_var19
	%_var22 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var23 = load %X86** %_var22
	%_var25 = bitcast %X86* %_var23 to %MachineCode*
	%_var24 = call i8* @MachineCode_platform(%MachineCode* %_var25)

	%_var21 = call %IO* @IO_out_string(%IO* %_var20, i8* %_var24)

	%_var27 = load [2 x i8]* @_string_1

	%_var28 = bitcast [2 x i8]* @_string_1 to i8*

	%_var26 = call %IO* @IO_out_string(%IO* %_var21, i8* %_var28)

	%_var29 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var30 = load %IO** %_var29
	%_var32 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var33 = load %X86** %_var32
	%_var35 = bitcast %X86* %_var33 to %Program*
	%_var34 = call i8* @Program_platform(%Program* %_var35)

	%_var31 = call %IO* @IO_out_string(%IO* %_var30, i8* %_var34)

	%_var37 = load [2 x i8]* @_string_2

	%_var38 = bitcast [2 x i8]* @_string_2 to i8*

	%_var36 = call %IO* @IO_out_string(%IO* %_var31, i8* %_var38)

	%_var39 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var40 = load %IO** %_var39
	%_var42 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var43 = load %ARM16** %_var42
	%_var44 = call i8* @ARM16_platform(%ARM16* %_var43)

	%_var41 = call %IO* @IO_out_string(%IO* %_var40, i8* %_var44)

	%_var46 = load [2 x i8]* @_string_3

	%_var47 = bitcast [2 x i8]* @_string_3 to i8*

	%_var45 = call %IO* @IO_out_string(%IO* %_var41, i8* %_var47)

	%_var48 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var49 = load %IO** %_var48
	%_var51 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var52 = load %ARM16** %_var51
	%_var54 = bitcast %ARM16* %_var52 to %MachineCode*
	%_var53 = call i8* @MachineCode_platform(%MachineCode* %_var54)

	%_var50 = call %IO* @IO_out_string(%IO* %_var49, i8* %_var53)

	%_var56 = load [2 x i8]* @_string_4

	%_var57 = bitcast [2 x i8]* @_string_4 to i8*

	%_var55 = call %IO* @IO_out_string(%IO* %_var50, i8* %_var57)

	%_var58 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var59 = load %IO** %_var58
	%_var61 = getelementptr inbounds %Program* %self, i32 0, i32 3
	%_var62 = load %ARM16** %_var61
	%_var64 = bitcast %ARM16* %_var62 to %Program*
	%_var63 = call i8* @Program_platform(%Program* %_var64)

	%_var60 = call %IO* @IO_out_string(%IO* %_var59, i8* %_var63)

	%_var66 = load [2 x i8]* @_string_5

	%_var67 = bitcast [2 x i8]* @_string_5 to i8*

	%_var65 = call %IO* @IO_out_string(%IO* %_var60, i8* %_var67)

	%_var68 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var69 = load %IO** %_var68
	%_var71 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var72 = load %LLVM** %_var71
	%_var73 = call i8* @LLVM_platform(%LLVM* %_var72)

	%_var70 = call %IO* @IO_out_string(%IO* %_var69, i8* %_var73)

	%_var75 = load [2 x i8]* @_string_6

	%_var76 = bitcast [2 x i8]* @_string_6 to i8*

	%_var74 = call %IO* @IO_out_string(%IO* %_var70, i8* %_var76)

	%_var77 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var78 = load %IO** %_var77
	%_var80 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var81 = load %LLVM** %_var80
	%_var83 = bitcast %LLVM* %_var81 to %VirtualMachine*
	%_var82 = call i8* @VirtualMachine_platform(%VirtualMachine* %_var83)

	%_var79 = call %IO* @IO_out_string(%IO* %_var78, i8* %_var82)

	%_var85 = load [2 x i8]* @_string_7

	%_var86 = bitcast [2 x i8]* @_string_7 to i8*

	%_var84 = call %IO* @IO_out_string(%IO* %_var79, i8* %_var86)

	%_var87 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var88 = load %IO** %_var87
	%_var90 = getelementptr inbounds %Program* %self, i32 0, i32 4
	%_var91 = load %LLVM** %_var90
	%_var93 = bitcast %LLVM* %_var91 to %Program*
	%_var92 = call i8* @Program_platform(%Program* %_var93)

	%_var89 = call %IO* @IO_out_string(%IO* %_var88, i8* %_var92)

	%_var95 = load [2 x i8]* @_string_8

	%_var96 = bitcast [2 x i8]* @_string_8 to i8*

	%_var94 = call %IO* @IO_out_string(%IO* %_var89, i8* %_var96)

	%_var97 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var98 = load %IO** %_var97
	%_var100 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var101 = load %CIL** %_var100
	%_var102 = call i8* @CIL_platform(%CIL* %_var101)

	%_var99 = call %IO* @IO_out_string(%IO* %_var98, i8* %_var102)

	%_var104 = load [2 x i8]* @_string_9

	%_var105 = bitcast [2 x i8]* @_string_9 to i8*

	%_var103 = call %IO* @IO_out_string(%IO* %_var99, i8* %_var105)

	%_var106 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var107 = load %IO** %_var106
	%_var109 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var110 = load %CIL** %_var109
	%_var112 = bitcast %CIL* %_var110 to %VirtualMachine*
	%_var111 = call i8* @VirtualMachine_platform(%VirtualMachine* %_var112)

	%_var108 = call %IO* @IO_out_string(%IO* %_var107, i8* %_var111)

	%_var114 = load [2 x i8]* @_string_10

	%_var115 = bitcast [2 x i8]* @_string_10 to i8*

	%_var113 = call %IO* @IO_out_string(%IO* %_var108, i8* %_var115)

	%_var116 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var117 = load %IO** %_var116
	%_var119 = getelementptr inbounds %Program* %self, i32 0, i32 5
	%_var120 = load %CIL** %_var119
	%_var122 = bitcast %CIL* %_var120 to %Program*
	%_var121 = call i8* @Program_platform(%Program* %_var122)

	%_var118 = call %IO* @IO_out_string(%IO* %_var117, i8* %_var121)

	%_var124 = load [2 x i8]* @_string_11

	%_var125 = bitcast [2 x i8]* @_string_11 to i8*

	%_var123 = call %IO* @IO_out_string(%IO* %_var118, i8* %_var125)

	%_var126 = bitcast %IO* %_var123 to %Object*
	ret %Object* %_var126
}


define i8* @Program_platform(%Program* %self)
{
	%_var127 = load [9 x i8]* @_string_12

	%_var128 = bitcast [9 x i8]* @_string_12 to i8*

	ret i8* %_var128
}


define i8* @MachineCode_platform(%MachineCode* %self)
{
	%_var129 = load [7 x i8]* @_string_13

	%_var130 = bitcast [7 x i8]* @_string_13 to i8*

	ret i8* %_var130
}


define i8* @X86_platform(%X86* %self)
{
	%_var131 = load [11 x i8]* @_string_14

	%_var132 = bitcast [11 x i8]* @_string_14 to i8*

	ret i8* %_var132
}


define i8* @ARM16_platform(%ARM16* %self)
{
	%_var133 = load [12 x i8]* @_string_15

	%_var134 = bitcast [12 x i8]* @_string_15 to i8*

	ret i8* %_var134
}


define i8* @VirtualMachine_platform(%VirtualMachine* %self)
{
	%_var135 = load [8 x i8]* @_string_16

	%_var136 = bitcast [8 x i8]* @_string_16 to i8*

	ret i8* %_var136
}


define i8* @LLVM_platform(%LLVM* %self)
{
	%_var137 = load [8 x i8]* @_string_17

	%_var138 = bitcast [8 x i8]* @_string_17 to i8*

	ret i8* %_var138
}


define i8* @CIL_platform(%CIL* %self)
{
	%_var139 = load [4 x i8]* @_string_18

	%_var140 = bitcast [4 x i8]* @_string_18 to i8*

	ret i8* %_var140
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

