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
	%_var2 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var0 = call %IO* @_newIO()
	store %IO* %_var0, %IO** %_var1
	store %Expr* null, %Expr** %_var2
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

	%_var149 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	%_var152 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	store %Expr* null, %Expr** %_var149
	store %Expr* null, %Expr** %_var152
	ret %BinaryOp* %self
}


define %SumOp* @_newSumOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%SumOp* getelementptr (%SumOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %SumOp*
	%class_type = getelementptr %SumOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_SumOp to i8*), i8** %class_type

	%_var149 = getelementptr inbounds %SumOp* %self, i32 0, i32 1
	%_var152 = getelementptr inbounds %SumOp* %self, i32 0, i32 2
	%_var196 = getelementptr inbounds %SumOp* %self, i32 0, i32 3
	store %Expr* null, %Expr** %_var149
	store %Expr* null, %Expr** %_var152
	store %Object* null, %Object** %_var196
	ret %SumOp* %self
}


define %SubOp* @_newSubOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%SubOp* getelementptr (%SubOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %SubOp*
	%class_type = getelementptr %SubOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_SubOp to i8*), i8** %class_type

	%_var149 = getelementptr inbounds %SubOp* %self, i32 0, i32 1
	%_var152 = getelementptr inbounds %SubOp* %self, i32 0, i32 2
	%_var197 = getelementptr inbounds %SubOp* %self, i32 0, i32 3
	store %Expr* null, %Expr** %_var149
	store %Expr* null, %Expr** %_var152
	store %Object* null, %Object** %_var197
	ret %SubOp* %self
}


define %MultOp* @_newMultOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%MultOp* getelementptr (%MultOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %MultOp*
	%class_type = getelementptr %MultOp* %self, i32 0, i32 0
	store i8* bitcast([7 x i8]* @_type_MultOp to i8*), i8** %class_type

	%_var149 = getelementptr inbounds %MultOp* %self, i32 0, i32 1
	%_var152 = getelementptr inbounds %MultOp* %self, i32 0, i32 2
	%_var198 = getelementptr inbounds %MultOp* %self, i32 0, i32 3
	store %Expr* null, %Expr** %_var149
	store %Expr* null, %Expr** %_var152
	store %Object* null, %Object** %_var198
	ret %MultOp* %self
}


define %NegOp* @_newNegOp()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%NegOp* getelementptr (%NegOp* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %NegOp*
	%class_type = getelementptr %NegOp* %self, i32 0, i32 0
	store i8* bitcast([6 x i8]* @_type_NegOp to i8*), i8** %class_type

	%_var199 = getelementptr inbounds %NegOp* %self, i32 0, i32 1
	store %Expr* null, %Expr** %_var199
	ret %NegOp* %self
}


define %IntExpr* @_newIntExpr()
{
	%vptr = call i8* @malloc(i64 ptrtoint (%IntExpr* getelementptr (%IntExpr* null , i32 1) to i64))
	%self = bitcast i8* %vptr to %IntExpr*
	%class_type = getelementptr %IntExpr* %self, i32 0, i32 0
	store i8* bitcast([8 x i8]* @_type_IntExpr to i8*), i8** %class_type

	%_var205 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	store i32 0, i32* %_var205
	ret %IntExpr* %self
}


define %Object* @Program_main(%Program* %self)
{
	%_var3 = call %IntExpr* @Program_int(%Program* %self, i32 15)

	%_var5 = bitcast %IntExpr* %_var3 to %Expr*
	%_var4 = call %SumOp* @Expr_add(%Expr* %_var5, i32 30)

	%_var7 = bitcast %SumOp* %_var4 to %Expr*
	%_var6 = call %MultOp* @Expr_mult(%Expr* %_var7, i32 2)

	%_var9 = bitcast %MultOp* %_var6 to %Expr*
	%_var8 = call %NegOp* @Expr_neg(%Expr* %_var9)

	%_var11 = bitcast %NegOp* %_var8 to %Expr*
	%_var10 = call %SubOp* @Expr_sub(%Expr* %_var11, i32 10)

	%_var13 = bitcast %SubOp* %_var10 to %Expr*
	%_var12 = call %MultOp* @Expr_mult(%Expr* %_var13, i32 5)

	%_var14 = getelementptr inbounds %Program* %self, i32 0, i32 2
	store %MultOp* %_var12, %MultOp** %_var14
	%_var15 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var16 = load %Expr** %_var15
	%_var18 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var19 = load %IO** %_var18
	%_var17 = call %IO* @Expr_print(%Expr* %_var16, %IO* %_var19)

	%_var20 = getelementptr inbounds %Program* %self, i32 0, i32 1
	%_var21 = load %IO** %_var20
	%_var23 = bitcast [4 x i8]* @_string_0 to i8*

	%_var22 = call %IO* @IO_out_string(%IO* %_var21, i8* %_var23)

	%_var25 = getelementptr inbounds %Program* %self, i32 0, i32 2
	%_var26 = load %Expr** %_var25
	%_var27 = call i32 @Expr_compute(%Expr* %_var26)

	%_var24 = call %IO* @IO_out_int(%IO* %_var22, i32 %_var27)

	%_var28 = bitcast %IO* %_var24 to %Object*
	ret %Object* %_var28
}


define %IntExpr* @Program_int(%Program* %self, i32 %_Program_i)
{
	%_Program_int_i = alloca i32, align 4
	store i32 %_Program_i, i32* %_Program_int_i
	%_var29 = call %IntExpr* @_newIntExpr()
	%_var31 = load  i32* %_Program_int_i
	%_var30 = call %IntExpr* @IntExpr_init(%IntExpr* %_var29, i32 %_var31)

	ret %IntExpr* %_var30
}


define %SumOp* @Expr_add(%Expr* %self, i32 %_Expr_e)
{
	%_Expr_add_e = alloca i32, align 4
	store i32 %_Expr_e, i32* %_Expr_add_e
	%_var32 = call %SumOp* @_newSumOp()
	%_var34 = bitcast %SumOp* %_var32 to %BinaryOp*
	%_var35 = call %IntExpr* @_newIntExpr()
	%_var37 = load  i32* %_Expr_add_e
	%_var36 = call %IntExpr* @IntExpr_init(%IntExpr* %_var35, i32 %_var37)

	%_var38 = bitcast %IntExpr* %_var36 to %Expr*
	%_var33 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var34, %Expr* %self, %Expr* %_var38)

	ret %SumOp* %_var33
}


define %SubOp* @Expr_sub(%Expr* %self, i32 %_Expr_e)
{
	%_Expr_sub_e = alloca i32, align 4
	store i32 %_Expr_e, i32* %_Expr_sub_e
	%_var39 = call %SubOp* @_newSubOp()
	%_var41 = bitcast %SubOp* %_var39 to %BinaryOp*
	%_var42 = call %IntExpr* @_newIntExpr()
	%_var44 = load  i32* %_Expr_sub_e
	%_var43 = call %IntExpr* @IntExpr_init(%IntExpr* %_var42, i32 %_var44)

	%_var45 = bitcast %IntExpr* %_var43 to %Expr*
	%_var40 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var41, %Expr* %self, %Expr* %_var45)

	ret %SubOp* %_var40
}


define %MultOp* @Expr_mult(%Expr* %self, i32 %_Expr_e)
{
	%_Expr_mult_e = alloca i32, align 4
	store i32 %_Expr_e, i32* %_Expr_mult_e
	%_var46 = call %MultOp* @_newMultOp()
	%_var48 = bitcast %MultOp* %_var46 to %BinaryOp*
	%_var49 = call %IntExpr* @_newIntExpr()
	%_var51 = load  i32* %_Expr_mult_e
	%_var50 = call %IntExpr* @IntExpr_init(%IntExpr* %_var49, i32 %_var51)

	%_var52 = bitcast %IntExpr* %_var50 to %Expr*
	%_var47 = call %BinaryOp* @BinaryOp_init(%BinaryOp* %_var48, %Expr* %self, %Expr* %_var52)

	ret %MultOp* %_var47
}


define %NegOp* @Expr_neg(%Expr* %self)
{
	%_var53 = call %NegOp* @_newNegOp()
	%_var54 = call %NegOp* @NegOp_init(%NegOp* %_var53, %Expr* %self)

	ret %NegOp* %_var54
}


define %IO* @Expr_print(%Expr* %self, %IO* %_Expr_iostream)
{
	%_Expr_print_iostream = alloca %IO*, align 4
	store %IO* %_Expr_iostream, %IO** %_Expr_print_iostream
	%_var55 = getelementptr %Expr* %self, i32 0, i32 0
	%_var56 = bitcast i8** %_var55 to i8*
	%_var57 = bitcast [8 x i8]* @_type_IntExpr to i8*

	%_var58 = call i32 @strcmp(i8* %_var56, i8* %_var57)
	%_var59 = icmp eq i32 0, %_var58
	br i1 %_var59, label %IntExpr0, label %FalseJump0_0
	FalseJump0_0:
	%_var60 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var61 = call i32 @strcmp(i8* %_var56, i8* %_var60)
	%_var62 = icmp eq i32 0, %_var61
	br i1 %_var62, label %SumOp0, label %FalseJump0_1
	FalseJump0_1:
	%_var63 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var64 = call i32 @strcmp(i8* %_var56, i8* %_var63)
	%_var65 = icmp eq i32 0, %_var64
	br i1 %_var65, label %SubOp0, label %FalseJump0_2
	FalseJump0_2:
	%_var66 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var67 = call i32 @strcmp(i8* %_var56, i8* %_var66)
	%_var68 = icmp eq i32 0, %_var67
	br i1 %_var68, label %MultOp0, label %FalseJump0_3
	FalseJump0_3:
	%_var69 = bitcast [6 x i8]* @_type_NegOp to i8*

	%_var70 = call i32 @strcmp(i8* %_var56, i8* %_var69)
	%_var71 = icmp eq i32 0, %_var70
	br i1 %_var71, label %NegOp0, label %FalseJump0_4
	IntExpr0:
	%.IntExpr.i = bitcast %Expr* %self to %IntExpr*
	%_var72 = load  %IO** %_Expr_print_iostream
	%_Expr_print_i = alloca %IntExpr*, align 4

	%_var74 = load  %IntExpr** %_Expr_print_i
	%_var75 = call i32 @IntExpr_getValue(%IntExpr* %_var74)

	%_var73 = call %IO* @IO_out_int(%IO* %_var72, i32 %_var75)

	br label %final_case0
	SumOp0:
	%.SumOp.sum = bitcast %Expr* %self to %SumOp*
	%_Expr_print_sum = alloca %SumOp*, align 4

	%_var76 = load  %SumOp** %_Expr_print_sum
	%_var78 = bitcast %SumOp* %_var76 to %BinaryOp*
	%_var79 = load  %IO** %_Expr_print_iostream
	%_var77 = call %IO* @BinaryOp_print(%BinaryOp* %_var78, %IO* %_var79)

	br label %final_case0
	SubOp0:
	%.SubOp.sub = bitcast %Expr* %self to %SubOp*
	%_Expr_print_sub = alloca %SubOp*, align 4

	%_var80 = load  %SubOp** %_Expr_print_sub
	%_var82 = bitcast %SubOp* %_var80 to %BinaryOp*
	%_var83 = load  %IO** %_Expr_print_iostream
	%_var81 = call %IO* @BinaryOp_print(%BinaryOp* %_var82, %IO* %_var83)

	br label %final_case0
	MultOp0:
	%.MultOp.mult = bitcast %Expr* %self to %MultOp*
	%_Expr_print_mult = alloca %MultOp*, align 4

	%_var84 = load  %MultOp** %_Expr_print_mult
	%_var86 = bitcast %MultOp* %_var84 to %BinaryOp*
	%_var87 = load  %IO** %_Expr_print_iostream
	%_var85 = call %IO* @BinaryOp_print(%BinaryOp* %_var86, %IO* %_var87)

	br label %final_case0
	NegOp0:
	%.NegOp.neg = bitcast %Expr* %self to %NegOp*
	%_var88 = load  %IO** %_Expr_print_iostream
	%_var90 = bitcast [4 x i8]* @_string_1 to i8*

	%_var89 = call %IO* @IO_out_string(%IO* %_var88, i8* %_var90)

	%_Expr_print_neg = alloca %NegOp*, align 4

	%_var91 = load  %NegOp** %_Expr_print_neg
	%_var92 = call %Expr* @NegOp_getValue(%NegOp* %_var91)

	%_var94 = load  %IO** %_Expr_print_iostream
	%_var93 = call %IO* @Expr_print(%Expr* %_var92, %IO* %_var94)

	br label %final_case0
	FalseJump0_4:
	%_var95 = call %IO* @_newIO()
	br label %final_case0
	final_case0:
	%_var96 = phi %IO* [ %_var73, %IntExpr0 ],[ %_var77, %SumOp0 ],[ %_var81, %SubOp0 ],[ %_var85, %MultOp0 ],[ %_var93, %NegOp0 ],[ %_var95, %FalseJump0_4]
	ret %IO* %_var96
}


define i32 @Expr_compute(%Expr* %self)
{
	%_var97 = getelementptr %Expr* %self, i32 0, i32 0
	%_var98 = bitcast i8** %_var97 to i8*
	%_var99 = bitcast [8 x i8]* @_type_IntExpr to i8*

	%_var100 = call i32 @strcmp(i8* %_var98, i8* %_var99)
	%_var101 = icmp eq i32 0, %_var100
	br i1 %_var101, label %IntExpr1, label %FalseJump1_0
	FalseJump1_0:
	%_var102 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var103 = call i32 @strcmp(i8* %_var98, i8* %_var102)
	%_var104 = icmp eq i32 0, %_var103
	br i1 %_var104, label %SumOp1, label %FalseJump1_1
	FalseJump1_1:
	%_var105 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var106 = call i32 @strcmp(i8* %_var98, i8* %_var105)
	%_var107 = icmp eq i32 0, %_var106
	br i1 %_var107, label %SubOp1, label %FalseJump1_2
	FalseJump1_2:
	%_var108 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var109 = call i32 @strcmp(i8* %_var98, i8* %_var108)
	%_var110 = icmp eq i32 0, %_var109
	br i1 %_var110, label %MultOp1, label %FalseJump1_3
	FalseJump1_3:
	%_var111 = bitcast [6 x i8]* @_type_NegOp to i8*

	%_var112 = call i32 @strcmp(i8* %_var98, i8* %_var111)
	%_var113 = icmp eq i32 0, %_var112
	br i1 %_var113, label %NegOp1, label %FalseJump1_4
	IntExpr1:
	%.IntExpr.i = bitcast %Expr* %self to %IntExpr*
	%_Expr_compute_i = alloca %IntExpr*, align 4

	%_var114 = load  %IntExpr** %_Expr_compute_i
	%_var115 = call i32 @IntExpr_getValue(%IntExpr* %_var114)

	br label %final_case1
	SumOp1:
	%.SumOp.sum = bitcast %Expr* %self to %SumOp*
	%_Expr_compute_sum = alloca %SumOp*, align 4

	%_var116 = load  %SumOp** %_Expr_compute_sum
	%_var118 = bitcast %SumOp* %_var116 to %BinaryOp*
	%_var117 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var118)

	%_var119 = call i32 @Expr_compute(%Expr* %_var117)

	%_var120 = load  %SumOp** %_Expr_compute_sum
	%_var122 = bitcast %SumOp* %_var120 to %BinaryOp*
	%_var121 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var122)

	%_var123 = call i32 @Expr_compute(%Expr* %_var121)

	%_var124 = add i32 %_var119, %_var123
	br label %final_case1
	SubOp1:
	%.SubOp.sub = bitcast %Expr* %self to %SubOp*
	%_Expr_compute_sub = alloca %SubOp*, align 4

	%_var125 = load  %SubOp** %_Expr_compute_sub
	%_var127 = bitcast %SubOp* %_var125 to %BinaryOp*
	%_var126 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var127)

	%_var128 = call i32 @Expr_compute(%Expr* %_var126)

	%_var129 = load  %SubOp** %_Expr_compute_sub
	%_var131 = bitcast %SubOp* %_var129 to %BinaryOp*
	%_var130 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var131)

	%_var132 = call i32 @Expr_compute(%Expr* %_var130)

	%_var133 = sub i32 %_var128, %_var132
	br label %final_case1
	MultOp1:
	%.MultOp.mult = bitcast %Expr* %self to %MultOp*
	%_Expr_compute_mult = alloca %MultOp*, align 4

	%_var134 = load  %MultOp** %_Expr_compute_mult
	%_var136 = bitcast %MultOp* %_var134 to %BinaryOp*
	%_var135 = call %Expr* @BinaryOp_getLeft(%BinaryOp* %_var136)

	%_var137 = call i32 @Expr_compute(%Expr* %_var135)

	%_var138 = load  %MultOp** %_Expr_compute_mult
	%_var140 = bitcast %MultOp* %_var138 to %BinaryOp*
	%_var139 = call %Expr* @BinaryOp_getRight(%BinaryOp* %_var140)

	%_var141 = call i32 @Expr_compute(%Expr* %_var139)

	%_var142 = mul i32 %_var137, %_var141
	br label %final_case1
	NegOp1:
	%.NegOp.neg = bitcast %Expr* %self to %NegOp*
	%_Expr_compute_neg = alloca %NegOp*, align 4

	%_var143 = load  %NegOp** %_Expr_compute_neg
	%_var144 = call %Expr* @NegOp_getValue(%NegOp* %_var143)

	%_var145 = call i32 @Expr_compute(%Expr* %_var144)

	%_var146 = sub i32 0, %_var145
	br label %final_case1
	FalseJump1_4:
	%_var147 = call %Int* @_newInt()
	br label %final_case1
	final_case1:
	%_var148 = phi %Int* [ %_var115, %IntExpr1 ],[ %_var124, %SumOp1 ],[ %_var133, %SubOp1 ],[ %_var142, %MultOp1 ],[ %_var146, %NegOp1 ],[ %_var147, %FalseJump1_4]
	ret i32 %_var148
}


define %Expr* @BinaryOp_getLeft(%BinaryOp* %self)
{
	%_var150 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	%_var151 = load %Expr** %_var150
	ret %Expr* %_var151
}


define %Expr* @BinaryOp_getRight(%BinaryOp* %self)
{
	%_var153 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	%_var154 = load %Expr** %_var153
	ret %Expr* %_var154
}


define %IO* @BinaryOp_print(%BinaryOp* %self, %IO* %_BinaryOp_iostream)
{
	%_BinaryOp_print_iostream = alloca %IO*, align 4
	store %IO* %_BinaryOp_iostream, %IO** %_BinaryOp_print_iostream
	%_var155 = load  %IO** %_BinaryOp_print_iostream
	%_var157 = bitcast [2 x i8]* @_string_2 to i8*

	%_var156 = call %IO* @IO_out_string(%IO* %_var155, i8* %_var157)

	%_var158 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	%_var159 = load %Expr** %_var158
	%_var161 = load  %IO** %_BinaryOp_print_iostream
	%_var160 = call %IO* @Expr_print(%Expr* %_var159, %IO* %_var161)

	%_var162 = load  %IO** %_BinaryOp_print_iostream
	%_var164 = getelementptr %BinaryOp* %self, i32 0, i32 0
	%_var165 = bitcast i8** %_var164 to i8*
	%_var166 = bitcast [6 x i8]* @_type_SumOp to i8*

	%_var167 = call i32 @strcmp(i8* %_var165, i8* %_var166)
	%_var168 = icmp eq i32 0, %_var167
	br i1 %_var168, label %SumOp2, label %FalseJump2_0
	FalseJump2_0:
	%_var169 = bitcast [6 x i8]* @_type_SubOp to i8*

	%_var170 = call i32 @strcmp(i8* %_var165, i8* %_var169)
	%_var171 = icmp eq i32 0, %_var170
	br i1 %_var171, label %SubOp2, label %FalseJump2_1
	FalseJump2_1:
	%_var172 = bitcast [7 x i8]* @_type_MultOp to i8*

	%_var173 = call i32 @strcmp(i8* %_var165, i8* %_var172)
	%_var174 = icmp eq i32 0, %_var173
	br i1 %_var174, label %MultOp2, label %FalseJump2_2
	FalseJump2_2:
	%_var175 = bitcast [7 x i8]* @_type_Object to i8*

	%_var176 = call i32 @strcmp(i8* %_var165, i8* %_var175)
	%_var177 = icmp eq i32 0, %_var176
	br i1 %_var177, label %Object2, label %FalseJump2_3
	SumOp2:
	%.SumOp.sum = bitcast %BinaryOp* %self to %SumOp*
	%_var178 = bitcast [4 x i8]* @_string_3 to i8*

	br label %final_case2
	SubOp2:
	%.SubOp.sub = bitcast %BinaryOp* %self to %SubOp*
	%_var179 = bitcast [4 x i8]* @_string_4 to i8*

	br label %final_case2
	MultOp2:
	%.MultOp.mult = bitcast %BinaryOp* %self to %MultOp*
	%_var180 = bitcast [4 x i8]* @_string_5 to i8*

	br label %final_case2
	Object2:
	%.Object.o = bitcast %BinaryOp* %self to %Object*
	%_var181 = bitcast [14 x i8]* @_string_6 to i8*

	br label %final_case2
	FalseJump2_3:
	%_var182 = call %String* @_newString()
	br label %final_case2
	final_case2:
	%_var183 = phi %String* [ %_var178, %SumOp2 ],[ %_var179, %SubOp2 ],[ %_var180, %MultOp2 ],[ %_var181, %Object2 ],[ %_var182, %FalseJump2_3]
	%_var163 = call %IO* @IO_out_string(%IO* %_var162, i8* %_var183)

	%_var184 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	%_var185 = load %Expr** %_var184
	%_var187 = load  %IO** %_BinaryOp_print_iostream
	%_var186 = call %IO* @Expr_print(%Expr* %_var185, %IO* %_var187)

	%_var188 = load  %IO** %_BinaryOp_print_iostream
	%_var190 = bitcast [2 x i8]* @_string_7 to i8*

	%_var189 = call %IO* @IO_out_string(%IO* %_var188, i8* %_var190)

	ret %IO* %_var189
}


define %BinaryOp* @BinaryOp_init(%BinaryOp* %self, %Expr* %_BinaryOp_l, %Expr* %_BinaryOp_r)
{
	%_BinaryOp_init_l = alloca %Expr*, align 4
	store %Expr* %_BinaryOp_l, %Expr** %_BinaryOp_init_l
	%_BinaryOp_init_r = alloca %Expr*, align 4
	store %Expr* %_BinaryOp_r, %Expr** %_BinaryOp_init_r
	%_var191 = load  %Expr** %_BinaryOp_init_l
	%_var192 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 1
	store %Expr* %_var191, %Expr** %_var192
	%_var193 = load  %Expr** %_BinaryOp_init_r
	%_var194 = getelementptr inbounds %BinaryOp* %self, i32 0, i32 2
	store %Expr* %_var193, %Expr** %_var194
	%_var195 = bitcast %BinaryOp* %self to %BinaryOp*
	ret %BinaryOp* %_var195
}


define %Expr* @NegOp_getValue(%NegOp* %self)
{
	%_var200 = getelementptr inbounds %NegOp* %self, i32 0, i32 1
	%_var201 = load %Expr** %_var200
	ret %Expr* %_var201
}


define %NegOp* @NegOp_init(%NegOp* %self, %Expr* %_NegOp_v)
{
	%_NegOp_init_v = alloca %Expr*, align 4
	store %Expr* %_NegOp_v, %Expr** %_NegOp_init_v
	%_var202 = load  %Expr** %_NegOp_init_v
	%_var203 = getelementptr inbounds %NegOp* %self, i32 0, i32 1
	store %Expr* %_var202, %Expr** %_var203
	%_var204 = bitcast %NegOp* %self to %NegOp*
	ret %NegOp* %_var204
}


define i32 @IntExpr_getValue(%IntExpr* %self)
{
	%_var206 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	%_var207 = load i32* %_var206
	ret i32 %_var207
}


define %IntExpr* @IntExpr_init(%IntExpr* %self, i32 %_IntExpr_v)
{
	%_IntExpr_init_v = alloca i32, align 4
	store i32 %_IntExpr_v, i32* %_IntExpr_init_v
	%_var208 = load  i32* %_IntExpr_init_v
	%_var209 = getelementptr inbounds %IntExpr* %self, i32 0, i32 1
	store i32 %_var208, i32* %_var209
	%_var210 = bitcast %IntExpr* %self to %IntExpr*
	ret %IntExpr* %_var210
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

