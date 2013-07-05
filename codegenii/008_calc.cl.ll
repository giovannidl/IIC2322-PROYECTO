%Object = type { i8*}
%IO = type { i8*}
%Program = type { i8*, %IO*, %Expr*}
%Expr = type { i8*}
%BinaryOp = type { i8*, %Expr*, %Expr*}
%SumOp = type { i8*, %Expr*, %Expr*, %Object*}
%SubOp = type { i8*, %Expr*, %Expr*, %Object*}
%MultOp = type { i8*, %Expr*, %Expr*, %Object*}
%NegOp = type { i8*, %Expr*}
%IntExpr = type { i8*, i32}

@.empty_str = private unnamed_addr constant [1 x i8] c"\00"
@_type_Object = internal constant [7 x i8] c"Object\00"
@_type_IO = internal constant [3 x i8] c"IO\00"
@_type_Program = internal constant [8 x i8] c"Program\00"
@_type_Expr = internal constant [5 x i8] c"Expr\00"
@_type_BinaryOp = internal constant [9 x i8] c"BinaryOp\00"
@_type_SumOp = internal constant [6 x i8] c"SumOp\00"
@_type_SubOp = internal constant [6 x i8] c"SubOp\00"
@_type_MultOp = internal constant [7 x i8] c"MultOp\00"
@_type_NegOp = internal constant [6 x i8] c"NegOp\00"
@_type_IntExpr = internal constant [8 x i8] c"IntExpr\00"
@_string_0 = internal constant [4 x i8] c" = \00"
@_string_1 = internal constant [4 x i8] c" - \00"
@_string_2 = internal constant [2 x i8] c"(\00"
@_string_3 = internal constant [4 x i8] c" + \00"
@_string_4 = internal constant [4 x i8] c" - \00"
@_string_5 = internal constant [4 x i8] c" * \00"
@_string_6 = internal constant [14 x i8] c" (undefined) \00"
@_string_7 = internal constant [2 x i8] c")\00"

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


define %Expr* @_newExpr()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%Expr* getelementptr (%Expr* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %Expr*
	%class_type = getelementptr %Expr* %self, i32 0, i32 0
	store i8* bitcast([5 x i8]* @_type_Expr to i8*), i8** %class_type

	ret %Expr* %self
}


define %BinaryOp* @_newBinaryOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%BinaryOp* getelementptr (%BinaryOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %BinaryOp*
	%class_type = getelementptr %BinaryOp* %self, i32 0, i32 0
	store i8* bitcast([9 x i8]* @_type_BinaryOp to i8*), i8** %class_type

	ret %BinaryOp* %self
}


define %SumOp* @_newSumOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%SumOp* getelementptr (%SumOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %SumOp*
	%class_type = getelementptr %SumOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_SumOp to i8*), i8** %class_type

	ret %SumOp* %self
}


define %SubOp* @_newSubOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%SubOp* getelementptr (%SubOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %SubOp*
	%class_type = getelementptr %SubOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_SubOp to i8*), i8** %class_type

	ret %SubOp* %self
}


define %MultOp* @_newMultOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%MultOp* getelementptr (%MultOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %MultOp*
	%class_type = getelementptr %MultOp* %self, i32 0, i32 0
	store i8* bitcast([7 x i8]* @_type_MultOp to i8*), i8** %class_type

	ret %MultOp* %self
}


define %NegOp* @_newNegOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%NegOp* getelementptr (%NegOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %NegOp*
	%class_type = getelementptr %NegOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_NegOp to i8*), i8** %class_type

	ret %NegOp* %self
}


define %IntExpr* @_newIntExpr()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%IntExpr* getelementptr (%IntExpr* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %IntExpr*
	%class_type = getelementptr %IntExpr* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_IntExpr to i8*), i8** %class_type

	%_var171 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	store i32 0, i32* %_var171
	ret %IntExpr* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var2 = call %IntExpr* @Program_int(%Program* %self, i32 15)

	%_var4 = bitcast %IntExpr* %_var2 to %Expr*
	%_var3 = call %SumOp* @Expr_add(%Expr* %_var4, i32 30)

	%_var6 = bitcast %SumOp* %_var3 to %Expr*
	%_var5 = call %MultOp* @Expr_mult(%Expr* %_var6, i32 2)

	%_var8 = bitcast %MultOp* %_var5 to %Expr*
	%_var7 = call %NegOp* @Expr_neg(%Expr* %_var8)

	%_var10 = bitcast %NegOp* %_var7 to %Expr*
	%_var9 = call %SubOp* @Expr_sub(%Expr* %_var10, i32 10)

	%_var12 = bitcast %SubOp* %_var9 to %Expr*
	%_var11 = call %MultOp* @Expr_mult(%Expr* %_var12, i32 5)

	%_var13 = getelementptr inbounds %Program* %self, i32 0, i32 2
	store %MultOp* %_var11, %MultOp** %_var13
	%_var14 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var15 = load %Expr** %_var14
	%_var17 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var18 = load %IO** %_var17
	%_var16 = call %IO* @Expr_print(%Expr* %_var15, %IO* %_var18)

	%_var19 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var20 = load %IO** %_var19
	%_var22 = bitcast [4 x i8]* @_string_0 to i8*

	%_var21 = call %IO* @IO_out_string(%IO* %_var20, i8* %_var22)

	%_var24 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var25 = load %Expr** %_var24
	%_var26 = call i32 @Expr_compute(%Expr* %_var25)

	%_var23 = call %IO* @IO_out_int(%IO* %_var21, i32 %_var26)

	%_var27 = bitcast %IO* %_var23 to %Object*
	ret %Object* %_var27
}


define %IntExpr* @Program_int(%Program* %self, i32 %.Program.i)
{
	%_var28 = call %IntExpr* @_newIntExpr()
	%_var29 = call %IntExpr* @IntExpr_init(%IntExpr* %_var28, i32 %.Program.i)

	ret %IntExpr* %_var29
}


define %SumOp* @Expr_add(%Expr* %self, i32 %.Expr.e)
{
	%_var30 = call %SumOp* @_newSumOp()
	%_var32 = bitcast %SumOp* %_var30 to %BinaryOp*
	%_var33 = call %IntExpr* @_newIntExpr()
	%_var34 = call %IntExpr* @IntExpr_init(%IntExpr* %_var33, i32 %.Expr.e)

	%_var35 = bitcast %IntExpr* %_var34 to %Expr*
	%_var31 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var32, %Expr* %self, %Expr* %_var35)

	ret %SumOp* %_var31
}


define %SubOp* @Expr_sub(%Expr* %self, i32 %.Expr.e)
{
	%_var36 = call %SubOp* @_newSubOp()
	%_var38 = bitcast %SubOp* %_var36 to %BinaryOp*
	%_var39 = call %IntExpr* @_newIntExpr()
	%_var40 = call %IntExpr* @IntExpr_init(%IntExpr* %_var39, i32 %.Expr.e)

	%_var41 = bitcast %IntExpr* %_var40 to %Expr*
	%_var37 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var38, %Expr* %self, %Expr* %_var41)

	ret %SubOp* %_var37
}


define %MultOp* @Expr_mult(%Expr* %self, i32 %.Expr.e)
{
	%_var42 = call %MultOp* @_newMultOp()
	%_var44 = bitcast %MultOp* %_var42 to %BinaryOp*
	%_var45 = call %IntExpr* @_newIntExpr()
	%_var46 = call %IntExpr* @IntExpr_init(%IntExpr* %_var45, i32 %.Expr.e)

	%_var47 = bitcast %IntExpr* %_var46 to %Expr*
	%_var43 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var44, %Expr* %self, %Expr* %_var47)

	ret %MultOp* %_var43
}


define %NegOp* @Expr_neg(%Expr* %self)
{
	%_var48 = call %NegOp* @_newNegOp()
	%_var49 = call %NegOp* @NegOp_init(%NegOp* %_var48, %Expr* %self)

	ret %NegOp* %_var49
}


define %IO* @Expr_print(%Expr* %self, %IO* %.Expr.iostream)
{
	%_var50 = getelementptr %Expr* %self, i32 0, i32 0
	%_var51 = bitcast i8** %_var50 to i8*
	%_var52 = bitcast [8 x i8]* @_type_IntExpr to i8*

	%_var53 = call i32 @strcmp(i8* %_var51, i8* %_var52)
	%_var54 = icmp eq i32 0, %_var53
	br i1 %_var54, label %IntExpr0, label %FalseJump0_0
	FalseJump0_0:
	%_var55 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var56 = call i32 @strcmp(i8* %_var51, i8* %_var55)
	%_var57 = icmp eq i32 0, %_var56
	br i1 %_var57, label %SumOp0, label %FalseJump0_1
	FalseJump0_1:
	%_var58 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var59 = call i32 @strcmp(i8* %_var51, i8* %_var58)
	%_var60 = icmp eq i32 0, %_var59
	br i1 %_var60, label %SubOp0, label %FalseJump0_2
	FalseJump0_2:
	%_var61 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var62 = call i32 @strcmp(i8* %_var51, i8* %_var61)
	%_var63 = icmp eq i32 0, %_var62
	br i1 %_var63, label %MultOp0, label %FalseJump0_3
	FalseJump0_3:
	%_var64 = bitcast [6 x i8]* @_type_NegOp to i8*

	%_var65 = call i32 @strcmp(i8* %_var51, i8* %_var64)
	%_var66 = icmp eq i32 0, %_var65
	br i1 %_var66, label %NegOp0, label %FalseJump0_4
	IntExpr0:
	%.IntExpr.i = bitcast %Expr* %self to %IntExpr*
	%_var69 = bitcast %Expr* %self to %IntExpr*
	%_var68 = call i32 @IntExpr_getValue(%IntExpr* %_var69)

	%_var67 = call %IO* @IO_out_int(%IO* %.Expr.iostream, i32 %_var68)

	br label %final_case0
	SumOp0:
	%.SumOp.sum = bitcast %Expr* %self to %SumOp*
	%_var71 = bitcast %Expr* %self to %BinaryOp*
	%_var70 = call %IO* @BinaryOp_print(%BinaryOp* %_var71, %IO* %.Expr.iostream)

	br label %final_case0
	SubOp0:
	%.SubOp.sub = bitcast %Expr* %self to %SubOp*
	%_var73 = bitcast %Expr* %self to %BinaryOp*
	%_var72 = call %IO* @BinaryOp_print(%BinaryOp* %_var73, %IO* %.Expr.iostream)

	br label %final_case0
	MultOp0:
	%.MultOp.mult = bitcast %Expr* %self to %MultOp*
	%_var75 = bitcast %Expr* %self to %BinaryOp*
	%_var74 = call %IO* @BinaryOp_print(%BinaryOp* %_var75, %IO* %.Expr.iostream)

	br label %final_case0
	NegOp0:
	%.NegOp.neg = bitcast %Expr* %self to %NegOp*
	%_var77 = bitcast [4 x i8]* @_string_1 to i8*

	%_var76 = call %IO* @IO_out_string(%IO* %.Expr.iostream, i8* %_var77)

	%_var79 = bitcast %Expr* %self to %NegOp*
	%_var78 = call %Expr* @NegOp_getValue(%NegOp* %_var79)

	%_var80 = call %IO* @Expr_print(%Expr* %_var78, %IO* %.Expr.iostream)

	br label %final_case0
	FalseJump0_4:
	%_var81 = call %IO* @_newIO()
	br label %final_case0
	final_case0:
	%_var82 = phi %IO* [ %_var67, %IntExpr0 ],[ %_var70, %SumOp0 ],[ %_var72, %SubOp0 ],[ %_var74, %MultOp0 ],[ %_var80, %NegOp0 ],[ %_var81, %FalseJump0_4]
	ret %IO* %_var82
}


define i32 @Expr_compute(%Expr* %self)
{
	%_var83 = getelementptr %Expr* %self, i32 0, i32 0
	%_var84 = bitcast i8** %_var83 to i8*
	%_var85 = bitcast [8 x i8]* @_type_IntExpr to i8*

	%_var86 = call i32 @strcmp(i8* %_var84, i8* %_var85)
	%_var87 = icmp eq i32 0, %_var86
	br i1 %_var87, label %IntExpr1, label %FalseJump1_0
	FalseJump1_0:
	%_var88 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var89 = call i32 @strcmp(i8* %_var84, i8* %_var88)
	%_var90 = icmp eq i32 0, %_var89
	br i1 %_var90, label %SumOp1, label %FalseJump1_1
	FalseJump1_1:
	%_var91 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var92 = call i32 @strcmp(i8* %_var84, i8* %_var91)
	%_var93 = icmp eq i32 0, %_var92
	br i1 %_var93, label %SubOp1, label %FalseJump1_2
	FalseJump1_2:
	%_var94 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var95 = call i32 @strcmp(i8* %_var84, i8* %_var94)
	%_var96 = icmp eq i32 0, %_var95
	br i1 %_var96, label %MultOp1, label %FalseJump1_3
	FalseJump1_3:
	%_var97 = bitcast [6 x i8]* @_type_NegOp to i8*

	%_var98 = call i32 @strcmp(i8* %_var84, i8* %_var97)
	%_var99 = icmp eq i32 0, %_var98
	br i1 %_var99, label %NegOp1, label %FalseJump1_4
	IntExpr1:
	%.IntExpr.i = bitcast %Expr* %self to %IntExpr*
	%_var101 = bitcast %Expr* %self to %IntExpr*
	%_var100 = call i32 @IntExpr_getValue(%IntExpr* %_var101)

	br label %final_case1
	SumOp1:
	%.SumOp.sum = bitcast %Expr* %self to %SumOp*
	%_var103 = bitcast %Expr* %self to %BinaryOp*
	%_var102 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var103)

	%_var104 = call i32 @Expr_compute(%Expr* %_var102)

	%_var106 = bitcast %Expr* %self to %BinaryOp*
	%_var105 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var106)

	%_var107 = call i32 @Expr_compute(%Expr* %_var105)

	%_var108 = add i32 %_var104, %_var107
	br label %final_case1
	SubOp1:
	%.SubOp.sub = bitcast %Expr* %self to %SubOp*
	%_var110 = bitcast %Expr* %self to %BinaryOp*
	%_var109 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var110)

	%_var111 = call i32 @Expr_compute(%Expr* %_var109)

	%_var113 = bitcast %Expr* %self to %BinaryOp*
	%_var112 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var113)

	%_var114 = call i32 @Expr_compute(%Expr* %_var112)

	%_var115 = sub i32 %_var111, %_var114
	br label %final_case1
	MultOp1:
	%.MultOp.mult = bitcast %Expr* %self to %MultOp*
	%_var117 = bitcast %Expr* %self to %BinaryOp*
	%_var116 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var117)

	%_var118 = call i32 @Expr_compute(%Expr* %_var116)

	%_var120 = bitcast %Expr* %self to %BinaryOp*
	%_var119 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var120)

	%_var121 = call i32 @Expr_compute(%Expr* %_var119)

	%_var122 = mul i32 %_var118, %_var121
	br label %final_case1
	NegOp1:
	%.NegOp.neg = bitcast %Expr* %self to %NegOp*
	%_var124 = bitcast %Expr* %self to %NegOp*
	%_var123 = call %Expr* @NegOp_getValue(%NegOp* %_var124)

	%_var125 = call i32 @Expr_compute(%Expr* %_var123)

	%_var126 = sub i32 0, %_var125
	br label %final_case1
	FalseJump1_4:
	%_var127 = call %Int* @_newInt()
	br label %final_case1
	final_case1:
	%_var128 = phi %Int* [ %_var100, %IntExpr1 ],[ %_var108, %SumOp1 ],[ %_var115, %SubOp1 ],[ %_var122, %MultOp1 ],[ %_var126, %NegOp1 ],[ %_var127, %FalseJump1_4]
	ret i32 %_var128
}


define %Expr* @BinaryOp_getLeft(%BinaryOp* %self)
{
	%_var129 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	%_var130 = load %Expr** %_var129
	ret %Expr* %_var130
}


define %Expr* @BinaryOp_getRight(%BinaryOp* %self)
{
	%_var131 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	%_var132 = load %Expr** %_var131
	ret %Expr* %_var132
}


define %IO* @BinaryOp_print(%BinaryOp* %self, %IO* %.BinaryOp.iostream)
{
	%_var134 = bitcast [2 x i8]* @_string_2 to i8*

	%_var133 = call %IO* @IO_out_string(%IO* %.BinaryOp.iostream, i8* %_var134)

	%_var135 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	%_var136 = load %Expr** %_var135
	%_var137 = call %IO* @Expr_print(%Expr* %_var136, %IO* %.BinaryOp.iostream)

	%_var139 = getelementptr %BinaryOp* %self, i32 0, i32 0
	%_var140 = bitcast i8** %_var139 to i8*
	%_var141 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var142 = call i32 @strcmp(i8* %_var140, i8* %_var141)
	%_var143 = icmp eq i32 0, %_var142
	br i1 %_var143, label %SumOp2, label %FalseJump2_0
	FalseJump2_0:
	%_var144 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var145 = call i32 @strcmp(i8* %_var140, i8* %_var144)
	%_var146 = icmp eq i32 0, %_var145
	br i1 %_var146, label %SubOp2, label %FalseJump2_1
	FalseJump2_1:
	%_var147 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var148 = call i32 @strcmp(i8* %_var140, i8* %_var147)
	%_var149 = icmp eq i32 0, %_var148
	br i1 %_var149, label %MultOp2, label %FalseJump2_2
	FalseJump2_2:
	%_var150 = bitcast [7 x i8]* @_type_Object to i8*

	%_var151 = call i32 @strcmp(i8* %_var140, i8* %_var150)
	%_var152 = icmp eq i32 0, %_var151
	br i1 %_var152, label %Object2, label %FalseJump2_3
	SumOp2:
	%.SumOp.sum = bitcast %BinaryOp* %self to %SumOp*
	%_var153 = bitcast [4 x i8]* @_string_3 to i8*

	br label %final_case2
	SubOp2:
	%.SubOp.sub = bitcast %BinaryOp* %self to %SubOp*
	%_var154 = bitcast [4 x i8]* @_string_4 to i8*

	br label %final_case2
	MultOp2:
	%.MultOp.mult = bitcast %BinaryOp* %self to %MultOp*
	%_var155 = bitcast [4 x i8]* @_string_5 to i8*

	br label %final_case2
	Object2:
	%.Object.o = bitcast %BinaryOp* %self to %Object*
	%_var156 = bitcast [14 x i8]* @_string_6 to i8*

	br label %final_case2
	FalseJump2_3:
	%_var157 = call %String* @_newString()
	br label %final_case2
	final_case2:
	%_var158 = phi %String* [ %_var153, %SumOp2 ],[ %_var154, %SubOp2 ],[ %_var155, %MultOp2 ],[ %_var156, %Object2 ],[ %_var157, %FalseJump2_3]
	%_var138 = call %IO* @IO_out_string(%IO* %.BinaryOp.iostream, i8* %_var158)

	%_var159 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	%_var160 = load %Expr** %_var159
	%_var161 = call %IO* @Expr_print(%Expr* %_var160, %IO* %.BinaryOp.iostream)

	%_var163 = bitcast [2 x i8]* @_string_7 to i8*

	%_var162 = call %IO* @IO_out_string(%IO* %.BinaryOp.iostream, i8* %_var163)

	ret %IO* %_var162
}


define %BinaryOp* @BinaryOp_init(%BinaryOp* %self, %Expr* %.BinaryOp.l, %Expr* %.BinaryOp.r)
{
	%_var164 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	store %Expr* %.BinaryOp.l, %Expr** %_var164
	%_var165 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	store %Expr* %.BinaryOp.r, %Expr** %_var165
	%_var166 = bitcast %BinaryOp* %self to %BinaryOp*
	ret %BinaryOp* %_var166
}


define %Expr* @NegOp_getValue(%NegOp* %self)
{
	%_var167 = getelementptr inbounds %NegOp* %self, i32 0, i32 1
	%_var168 = load %Expr** %_var167
	ret %Expr* %_var168
}


define %NegOp* @NegOp_init(%NegOp* %self, %Expr* %.NegOp.v)
{
	%_var169 = getelementptr inbounds %NegOp* %self, i32 0, i32 1
	store %Expr* %.NegOp.v, %Expr** %_var169
	%_var170 = bitcast %NegOp* %self to %NegOp*
	ret %NegOp* %_var170
}


define i32 @IntExpr_getValue(%IntExpr* %self)
{
	%_var172 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	%_var173 = load i32* %_var172
	ret i32 %_var173
}


define %IntExpr* @IntExpr_init(%IntExpr* %self, i32 %.IntExpr.v)
{
	%_var174 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	store i32 %.IntExpr.v, i32* %_var174
	%_var175 = bitcast %IntExpr* %self to %IntExpr*
	ret %IntExpr* %_var175
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

