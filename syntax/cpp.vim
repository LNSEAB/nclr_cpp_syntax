" Vim syntax file
" Language:		C++11
" Maintainer:	LNSEAB <lnseab@gmail.com>

if exists("b:current_syntax")
	finish
endif

syn	keyword	cppReturn		return
syn keyword	cppContinue		continue
syn keyword	cppBreak		break
syn keyword	cppGoto			goto
syn cluster cppKeywords		contains=cppReturn,cppContinue,cppBreak,cppGoto

syn keyword	cppIf			if
syn keyword cppElse			else
syn cluster cppKeywords		add=cppIf,cppElse

syn keyword	cppSwitch		switch
syn keyword cppCase			case
syn keyword	cppDefault		default
syn cluster	cppKeywords		add=cppSwitch,cppCase,cppDefault

syn keyword	cppFor			for
syn keyword	cppWhile		while
syn keyword	cppDo			do
syn cluster	cppKeywords		add=cppFor,cppWhile,cppDo

syn keyword	cppTry			try
syn keyword	cppCatch		catch
syn keyword	cppThrow		throw
syn keyword	cppNoexcept		noexcept
syn cluster cppKeywords		add=cppTry,cppCatch,cppThrow,cppNoexcept

syn keyword	cppStruct		struct
syn keyword	cppClass		class
syn keyword	cppUnion		union 
syn keyword cppEnum			enum 
syn keyword cppNamespace	namespace contained
syn cluster cppKeywords		add=cppStruct,cppClass,cppUnion,cppEnum,cppNamespace

syn keyword cppTemplate		template 
syn keyword cppUsing		using
syn keyword	cppTypedef		typedef
syn keyword	cppTypename		typename
syn cluster cppKeywords		add=cppTemplate,cppUsing,cppTypedef,cppTypename

syn keyword	cppStatic		static
syn keyword	cppConst		const
syn keyword cppMutable		mutable
syn keyword	cppVolatile		volatile
syn keyword cppExtern		extern
syn keyword	cppRegister		register
syn keyword	cppThreadLocal	thread_local
syn cluster cppKeywords		add=cppStatic,cppConst,cppMutable,cppVolatile,cppExtern,cppRegister,cppThreadLocal

syn keyword	cppConstexpr	constexpr
syn keyword	cppInline		inline
syn keyword	cppVirtual		virtual
syn keyword	cppFriend		friend
syn keyword	cppExplicit		explicit
syn keyword cppOperator		operator
syn keyword	cppExport		export
syn keyword	cppStaticAssert	static_assert
syn cluster	cppKeywords		add=cppConstexpr,cppInline,cppVirtual,cppFriend,cppExplicit,cppOperator,cppExport,cppStaticAssert

syn keyword	cppSizeof		sizeof
syn keyword	cppTypeid		typeid
syn keyword	cppDecltype		decltype
syn cluster cppKeywords		add=cppSizeof,cppTypeid,cppDecltype

syn keyword	cppAlignof		alignof
syn keyword cppAlignas		alignas
syn cluster cppKeywords		add=cppAlignof,cppAlignas

syn keyword cppPrivate		private
syn keyword	cppProtected	protected
syn keyword cppPublic		public
syn cluster cppKeywords		add=cppPrivate,cppProtected,cppPublic

syn keyword cppNew			new
syn keyword cppDelete		delete
syn cluster cppKeywords		add=cppNew,cppDelete

syn keyword cppTrue			true
syn keyword	cppFalse		false
syn keyword	cppNullptr		nullptr
syn keyword	cppThis			this
syn cluster cppKeywords		add=cppTrue,cppFalse,cppNullptr,cppThis

syn keyword cppAsm			asm
syn cluster cppKeywords		add=cppAsm

syn keyword cppType			auto bool char char16_t char32_t double float int long short signed unsigned void wchar_t
syn cluster cppKeywords		add=cppType

syn keyword cppConstCast		const_cast
syn	keyword cppStaticCast		static_cast
syn	keyword cppDynamicCast		dynamic_cast
syn keyword cppReinterpretCast	reinterpret_cast
syn	cluster	cppKeywords			add=cppConstCast,cppStaticCast,cppDynamicCast,cppReinterpretCast

syn	match	cppNumber			"\<[0-9]\+\%(\.[0-9]*\%([eE][+-][0-9]\+\)\?[flFL]\?\)\?" 
syn	match	cppFloatDecimal		"\.[0-9]\+\%([eE][+-][0-9]\+\)\?[flFL]\?"
syn	match	cppFloatNoPoint		"\<[0-9]\+[eE][+-][0-9]\+[flFL]\?"	
syn	match	cppHexNumber		"\<0x[0-9a-fA-F]\+"
syn	region	cppCharacter		start="\%(L\|u8\|u\|U\)\?'" skip=+\\'+ end="'"
syn	region	cppString			start="\%(L\|u8\|u\|U\)\?\"" skip=+\\\\|\\"|\\$+ excludenl end=+"+ end='$'
syn	region	cppRawStringLiteral	start="\%(R\|u8R\|LR\|uR\|UR\)\"\w\+(" skip=+\\\\\|\\"\|\\$+ end=')\w\+"'
syn	cluster	cppLiteral			contains=cppNumber,cppCharacter,cppString,cppRawStringLiteral

syn	region	cppComment			start="/\*" end="\*/" fold extend
syn	match	cppCommentError		display "\*/" 
syn	region	cppCommentLine		start="//" end="$" keepend
syn cluster	cppCommentGroup		contains=cppComment,cppCommentLine

syn	match	cppTemplateAccessOperator	"\%(\.\|->\)\_s*template" contains=cppTemplate

syn match	cppNamespaceName		"\<namespace\_s\+\w\+" contains=cppNamespace
syn match	cppAnonymousNamespace	"\<namespace\_s*{"me=e-1 contains=cppNamespace
syn	match	cppUsingNamespace		"\<using\_s\+namespace\_s\+\w\+" contains=cppUsing,cppNamespace

syn	region	cppPPConditional	start="^\s*#\s*\%(if\|ifdef\|elif\|else\)" end="$"
syn match	cppPPEndIf			"^\s*#\s*endif"
syn match	cppPPInclude		"^\s*#\s*include\s\+[0-9A-Za-z/<>\"_]\+\s*" contains=cppPPIncludePath
syn match	cppPPIncludePath	"[<"][^>]*[>"]\s*$" contained
syn region	cppPPDefine			start="^\s*#\s*define\s*" end="$"
syn region	cppPPUndef			start="^\s*#\s*undef\s*" end="$"
syn match	cppPPLine			"^\s*#\s*line\s*"
syn match	cppPPError			"^\s*#\s*error\s*"
syn match	cppPPPragma			"^\s*#\s*pragma\s*"
syn match	cppPPEmpty			"^\s*#\s*$"
syn	cluster	cppPP				contains=cppPPConditional,cppPPEndIf,cppPPInclude,cppInlinePath,cppPPDefine,cppPPUndef,cppPPLine,cppPPError,cppPPPragma,cppPPEmpty

syn	region	cppParen			transparent start='(' end=')' contains=TOP,cppParenError
syn	match	cppParenError		display ")"
syn	region	cppCurly			transparent start='{' end='}' contains=TOP,cppCurlyError
syn	match	cppCurlyError		display "}"

syn keyword	cppOverride			override contained containedin=cppVirtualContext
syn	keyword cppFinal			final contained containedin=cppVirtualContext
syn match	cppVirtualContext	/\<final\_s*[:{]/
syn match	cppVirtualContext	/\<\(override\|final\|override\_s\+final\|final\_s\+override\)\ze\(\(\_s*=\_s*0\)\=\_s*[,;]\|\_s*\({\|\<try\_s*{\|=\_s*\(default\|delete\)\_s*;\)\)/

hi def link cppReturn			Statement
hi def link cppContinue			Statement
hi def link cppBreak			Statement
hi def link cppGoto				Statement

hi def link cppFor				Repeat
hi def link cppWhile			Repeat
hi def link cppDo				Repeat

hi def link	cppIf				Conditional
hi def link cppElse				Conditional

hi def link	cppSwitch			Conditional
hi def link	cppCase				Label
hi def link cppDefault			Keyword

hi def link	cppTry				Exception
hi def link	cppCatch			Exception
hi def link cppThrow			Exception
hi def link	cppNoexcept			Exception

hi def link cppStruct			Structure
hi def link cppClass			Structure
hi def link cppUnion			Structure
hi def link cppEnum				Structure
hi def link cppNamespace		Structure

hi def link cppTemplate			Structure
hi def link cppUsing			Keyword
hi def link	cppTypedef			Keyword
hi def link	cppTypename			Structure

hi def link	cppStatic			StorageClass
hi def link cppConst			StorageClass
hi def link	cppMutable			StorageClass
hi def link	cppVolatile			StorageClass
hi def link	cppExtern			StorageClass
hi def link cppRegister			StorageClass

hi def link	cppConstexpr		Keyword
hi def link cppInline			Keyword
hi def link cppVirtual			Keyword
hi def link cppFriend			Keyword
hi def link cppExplicit			Keyword
hi def link cppDefault			Keyword
hi def link cppOperator			Operator
hi def link cppExport			Keyword

hi def link	cppSizeof			Operator
hi def link	cppTypeid			Operator
hi def link cppDecltype			Operator

hi def link	cppAlignof			Operator
hi def link	cppAlignas			Operator

hi def link	cppAccess			Statement
hi def link cppPrivate			cppAccess
hi def link	cppProtected		cppAccess
hi def link cppPublic			cppAccess

hi def link cppNew				Operator
hi def link cppDelete			Operator

hi def link	cppTrue				Constant
hi def link cppFalse			Constant
hi def link	cppNullptr			Constant
hi def link	cppThis				Keyword

hi def link	cppAsm				Statement

hi def link	cppConstCast		Operator
hi def link cppStaticCast		Operator
hi def link cppDynamicCast		Operator
hi def link cppReinterpretCast	Operator

hi def link	cppType				Type

hi def link	cppOverride			Keyword
hi def link cppFinal			Keyword

hi def link	cppNumber			Constant
hi def link cppFloatDecimal		Constant
hi def link cppFloatNoPoint		Constant
hi def link cppHexNumber		Constant
hi def link cppCharacter		Constant
hi def link	cppString			Constant
hi def link	cppRawStringLiteral	Constant

hi def link	cppComment			Comment
hi def link	cppCommentError		Error
hi def link cppCommentLine		Comment

hi def link	cppNamespaceName	Identifier
hi def link cppUsingNamespace	Identifier

hi def link cppPPConditional	PreCondit
hi def link	cppPPEndIf			PreCondit
hi def link	cppPPIncludePath	String
hi def link	cppPPInclude		Include
hi def link	cppPPDefine			Define
hi def link	cppPPUndef			PreProc
hi def link cppPPLine			PreProc
hi def link	cppPPError			PreProc
hi def link	cppPPPragma			PreProc
hi def link	cppPPEmpty			PreProc

hi def link cppParenError		Error
hi def link cppParenInError		Error
hi def link	cppCurlyError		Error
hi def link cppCurlyInError		Error

let b:current_syntax = "cpp"

" vim: ts=4
