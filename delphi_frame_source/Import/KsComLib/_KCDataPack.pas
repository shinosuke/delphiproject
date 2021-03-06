unit _KCDataPack;
{**************************************************************************}
{                                                                          }
{    This C DLL header file first (automatic) conversion generated by:     }
{    HeadConv 4.0 (c) 1999 by Bob Swart (aka Dr.Bob - www.drbob42.com)     }
{      FINAL DELPHI-JEDI COMMANDLINE EDITION                               }
{                                                                          }
{    Generated Date:  2001-5-16                                            }
{    Generated Time: 13:37:01                                              }
{                                                                          }
{**************************************************************************}

// modified by Huang Yanlai

interface

uses Windows;

{=> DATAPACK.H <=}

{- $define UseCookie }

const
  MAXPACKAGESIZE = 4*1024;
  PARAMBITS = 256;
  BITSPERBYTE = 8;
  ParamBitsSize = PARAMBITS div BITSPERBYTE;
  // log category
  lcKCPack = 7;

type
  TSTADDR = Array[0..5] of Byte;
  TSTParamBits =  Array[0..ParamBitsSize-1] of Byte;

  {$ifdef UseCookie }
  TSTCookie = packed record
    HostName : array[0..33-1] of Char;
    QueueName : array[0..33-1] of Char;
    QueueType : Longint;
  end;
  {$else}
  TSTCookie = packed record
  end;
  {$endif}

  TSTDataHead = packed record
    RequestType : LongWord;			// 交易编码，4字节
	  FirstFlag   : Byte ;				// 是否第一个请求（首包请求）
	  NextFlag    : Byte ;				// 是否后续包请求
	  RecCount    : LongWord;			// 本包的记录数
	  RetCode     : LongWord;		// 返回代码
	  UserID      : LongWord;		// 请求者的ID号码
	  Addr        : TSTADDR;			// 请求着的地址（6个子节）
    Cookie      : TSTCookie;
	  ParamBits   : TSTParamBits;
  end;
  PSTDataHead = ^TSTDataHead;

  TSTPack = packed record
    gddm: Array[0..16-1] of Char;     // BIT 0  BYTE 0 股东代码
    ddbz: Array[0..2-1] of Char;      // BIT 1  BYTE 0 市场标志
    nbbm: Array[0..13-1] of Char;     // BIT 2  BYTE 0 内部编码
    card: Array[0..26-1] of Char;     // BIT 3  BYTE 0 条码卡
    sfzh: Array[0..51-1] of Char;     // BIT 4  BYTE 0 身份证
    gdxm: Array[0..21-1] of Char;     // BIT 5  BYTE 0 股东姓名
    gpdm: Array[0..11-1] of Char;     // BIT 6  BYTE 0 股票代码
    gpmc: Array[0..21-1] of Char;     // BIT 7  BYTE 0 股票名称

    gydm: Array[0..5-1] of Char;      // BIT 0  BYTE 1 柜员代码
    gydm2: Array[0..5-1] of Char;     // BIT 1  BYTE 1 柜员代码2(复核柜员)
    wtjg: Double;                     // BIT 2  BYTE 1 委托价格
    cjjg: Double;                     // BIT 3  BYTE 1 成交价格
    wtsl: Longint;                    // BIT 4  BYTE 1 委托数量
    cjsl: Longint;                    // BIT 5  BYTE 1 成交数量
    wtlb: Array[0..2-1] of Char;      // BIT 6  BYTE 1 委托类别
    lbmc: Array[0..20-1] of Char;     // BIT 7  BYTE 1 委托类别(中文)

    lxdz: Array[0..61-1] of Char;     // BIT 0  BYTE 2 联系地址
    lxdh: Array[0..41-1] of Char;     // BIT 1  BYTE 2 联系电话
    yybid: Longint;                   // BIT 2  BYTE 2 营业部编号
    yybid1: Longint;                  // BIT 3  BYTE 2 营业部编号2(备用)
    htxh: Array[0..7-1] of Char;      // BIT 4  BYTE 2 合同号码
    wtrq: Array[0..15-1] of Char;     // BIT 5  BYTE 2 委托日期
    cjrq: Array[0..15-1] of Char;     // BIT 6  BYTE 2 成交日期
    jymm: Array[0..16-1] of Byte;     // BIT 7  BYTE 2 交易密码

    zjmm: Array[0..16-1] of Byte;     // BIT 0  BYTE 3 资金密码
    czmm: Array[0..16-1] of Byte;     // BIT 1  BYTE 3 存折密码
    yhdm: Array[0..5-1] of Char;      // BIT 2  BYTE 3 银行代码
    zhlb: Array[0..2-1] of Char;      // BIT 3  BYTE 3 账户类别
    yhzh: Array[0..41-1] of Char;     // BIT 4  BYTE 3 银行账号
    zzje: Double;                     // BIT 5  BYTE 3 转账金额
    zzlb: Array[0..2-1] of Char;      // BIT 6  BYTE 3 转账类别
    kyje: Double;                     // BIT 7  BYTE 3 可用资金

    dqje: Double;                     // BIT 0  BYTE 4 当前资金
    zjfs: Double;                     // BIT 1  BYTE 4 资金发生
    wtdj: Double;                     // BIT 2  BYTE 4 委托冻结
    rgdj: Double;                     // BIT 3  BYTE 4 人工冻结
    qtdj: Double;                     // BIT 4  BYTE 4 其他冻结
    gpky: Longint;                    // BIT 5  BYTE 4 股票可用
    gpye: Longint;                    // BIT 6  BYTE 4 股票余额
    gpwtdj: Longint;                  // BIT 7  BYTE 4 股票委托冻结

    gprgdj: Longint;                  // BIT 0  BYTE 5 股票人工冻结
    fssj: Array[0..11-1] of Char;     // BIT 1  BYTE 5 发生时间
    zy: Array[0..4-1] of Char;        // BIT 2  BYTE 5 摘要
    zymc: Array[0..21-1] of Char;     // BIT 3  BYTE 5 摘要名称
    gddm2: Array[0..16-1] of Char;    // BIT 4  BYTE 5 股东代码
    ddbz2: Array[0..2-1] of Char;     // BIT 5  BYTE 5 市场标志
    nbbm2: Array[0..13-1] of Char;    // BIT 6  BYTE 5 内部编码
    card2: Array[0..26-1] of Char;    // BIT 7  BYTE 5 条码卡

    sfzh2: Array[0..41-1] of Char;    // BIT 0  BYTE 6 身份证
    gdxm2: Array[0..21-1] of Char;    // BIT 1  BYTE 6 股东姓名
    lmess: Byte;                      // BIT 2  BYTE 6 MESS 的长度
    mess: Array[0..256-1] of Char;    // Bit 3 - 7 not used

    newmm: Array[0..16-1] of Byte;    // BIT 0  BYTE 7 新密码
    cxksrq: Array[0..9-1] of Char;    // BIT 1  BYTE 7 查询开始日期
    cxjsrq: Array[0..9-1] of Char;    // BIT 2  BYTE 7 查询结束日期
    khlb: Longint;                    // BIT 3  BYTE 7 客户类别
    wtfs: Array[0..10-1] of Char;     // BIT 4  BYTE 7 委托方式
    gdzt: Array[0..2-1] of Char;      // BIT 5  BYTE 7 股东状态
    szdm: Array[0..10-1] of Char;     // BIT 6  BYTE 7 深圳代码
    shdm: Array[0..10-1] of Char;     // BIT 7  BYTE 7 上海代码

    szbdm: Array[0..10-1] of Char;    // BIT 0  BYTE 8 深圳B代码
    shbdm: Array[0..10-1] of Char;    // BIT 1  BYTE 8 上海B代码
    othdm0: Array[0..10-1] of Char;   // BIT 2  BYTE 8 第三方代码
    othdm1: Array[0..10-1] of Char;   // BIT 3  BYTE 8 第四方代码
    othdm2: Array[0..10-1] of Char;   // BIT 4  BYTE 8 第五方代码
    gpmrcj: Longint;                  // BIT 5  BYTE 8 股票买入成交
    email: Array[0..31-1] of Char;    // BIT 6  BYTE 8 EMAIL地址
    email2: Array[0..31-1] of Char;   // BIT 7 BYTE 8 EMAIL地址2

    bl1:  Longint;				// BIT 0 BYTE 9 买1量
	  bl2:  Longint;				// BIT 1 BYTE 9 买2量
	  bl3:  Longint;				// BIT 2 BYTE 9 买3量;
	  bl4:  Longint;				// BIT 3 BYTE 9 买4量;
    sl1:  Longint;				// BIT 4 BYTE 9 卖1量;
    sl2:  Longint;				// BIT 5 BYTE 9 卖2量;
    sl3:  Longint;				// BIT 6 BYTE 9 卖3量;
    sl4:  Longint;				// BIT 7 BYTE 9 卖4量;

    bd1:  Double;				// BIT 0 BYTE 10 买1价;
    bd2:  Double;				// BIT 1 BYTE 10 买2价;
    bd3:  Double;				// BIT 2 BYTE 10 买3价;
    bd4:  Double;				// BIT 3 BYTE 10 买4价;
    sd1:  Double;				// BIT 4 BYTE 10 卖1价;
    sd2:  Double;				// BIT 5 BYTE 10 卖2价;
    sd3:  Double;				// BIT 6 BYTE 10 卖3价;
    sd4:  Double;				// BIT 7 BYTE 10 卖4价;
  end {st_pack};
  PSTPack = ^TSTPack;


// 压缩数据，返回压缩以后的大小byte
function KCPackData(const ParamBits : TSTParamBits; const Data : TSTPack; Buffer : PByte):Integer;

// 解压缩数据，返回压缩的大小byte
function KCUnPackData(const ParamBits : TSTParamBits; var Data : TSTPack; Buffer : PByte):Integer;

procedure KCCheckDefine;

procedure KCClearParamBits(var ParamBits : TSTParamBits);

procedure KCPutStr(var CharArray; Size : Integer; const S:string);

function  KCGetStr(const CharArray; Size : Integer):string;

procedure KCDumpParamBits(const ParamBits : TSTParamBits);

procedure KCDumpPack(const Pack : TSTPack);

function  KCFindParam(const Name : string): Integer;

const
  KCPackDataSizes : Array[0..PARAMBITS-1] of Word =
  (
    // 0
    16,
    2,
    13,
    26,
    51,
    21,
    11,
    21,
    // 1
    5,
    5,
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(LongInt),
    SizeOf(LongInt),
    2,
    20,
    // 2
    61,
    41,
    SizeOf(LongInt),
    SizeOf(LongInt),
    7,
    15,
    15,
    16,
    // 3
    16,
    16,
    5,
    2,
    41,
    SizeOf(Double),
    2,
    SizeOf(Double),
    // 4
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    // 5
    SizeOf(LongInt),
    11,
    4,
    21,
    16,
    2,
    13,
    26,
    // 6
    41,
    21,
    1,
    256,
    0,
    0,
    0,
    0,
    // 7
    16,
    9,
    9,
    SizeOf(LongInt),
    10,
    2,
    10,
    10,
    // 8
    10,
    10,
    10,
    10,
    10,
    SizeOf(LongInt),
    31,
    31,
    // 9
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    SizeOf(LongInt),
    // 10
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    SizeOf(Double),
    // 11
    0,0,0,0,0,0,0,0,
    // 12
    0,0,0,0,0,0,0,0,
    // 13
    0,0,0,0,0,0,0,0,
    // 14
    0,0,0,0,0,0,0,0,
    // 15
    0,0,0,0,0,0,0,0,
    // 16
    0,0,0,0,0,0,0,0,
    // 17
    0,0,0,0,0,0,0,0,
    // 18
    0,0,0,0,0,0,0,0,
    // 19
    0,0,0,0,0,0,0,0,
    // 20
    0,0,0,0,0,0,0,0,
    // 21
    0,0,0,0,0,0,0,0,
    // 22
    0,0,0,0,0,0,0,0,
    // 23
    0,0,0,0,0,0,0,0,
    // 24
    0,0,0,0,0,0,0,0,
    // 25
    0,0,0,0,0,0,0,0,
    // 26
    0,0,0,0,0,0,0,0,
    // 27
    0,0,0,0,0,0,0,0,
    // 28
    0,0,0,0,0,0,0,0,
    // 29
    0,0,0,0,0,0,0,0,
    // 30
    0,0,0,0,0,0,0,0,
    // 31
    0,0,0,0,0,0,0,0
  );

  KCEmpty = 0;
  KCChar = 1;
  KCInteger = 2;
  KCFloat = 3;

  KCPackDataTypes : Array[0..PARAMBITS-1] of Byte =
  (
    // 0
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    // 1
    KCChar,
    KCChar,
    KCFloat,
    KCFloat,
    KCInteger,
    KCInteger,
    KCChar,
    KCChar,
    // 2
    KCChar,
    KCChar,
    KCInteger,
    KCInteger,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    // 3
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCFloat,
    KCChar,
    KCFloat,
    // 4
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCInteger,
    KCInteger,
    KCInteger,
    // 5
    KCInteger,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    // 6
    KCChar,
    KCChar,
    KCInteger,
    KCChar,
    0,
    0,
    0,
    0,
    // 7
    KCChar,
    KCChar,
    KCChar,
    KCInteger,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    // 8
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCChar,
    KCInteger,
    KCChar,
    KCChar,
    // 9
    KCInteger,
    KCInteger,
    KCInteger,
    KCInteger,
    KCInteger,
    KCInteger,
    KCInteger,
    KCInteger,
    // 10
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    KCFloat,
    // 11
    0,0,0,0,0,0,0,0,
    // 12
    0,0,0,0,0,0,0,0,
    // 13
    0,0,0,0,0,0,0,0,
    // 14
    0,0,0,0,0,0,0,0,
    // 15
    0,0,0,0,0,0,0,0,
    // 16
    0,0,0,0,0,0,0,0,
    // 17
    0,0,0,0,0,0,0,0,
    // 18
    0,0,0,0,0,0,0,0,
    // 19
    0,0,0,0,0,0,0,0,
    // 20
    0,0,0,0,0,0,0,0,
    // 21
    0,0,0,0,0,0,0,0,
    // 22
    0,0,0,0,0,0,0,0,
    // 23
    0,0,0,0,0,0,0,0,
    // 24
    0,0,0,0,0,0,0,0,
    // 25
    0,0,0,0,0,0,0,0,
    // 26
    0,0,0,0,0,0,0,0,
    // 27
    0,0,0,0,0,0,0,0,
    // 28
    0,0,0,0,0,0,0,0,
    // 29
    0,0,0,0,0,0,0,0,
    // 30
    0,0,0,0,0,0,0,0,
    // 31
    0,0,0,0,0,0,0,0
  );

  KCPackDataNames : Array[0..PARAMBITS-1] of string =
  (
    // 0
    'gddm',
    'ddbz',
    'nbbm',
    'card',
    'sfzh',
    'gdxm',
    'gpdm',
    'gpmc',
    // 1
    'gydm',
    'gydm2',
    'wtjg',
    'cjjg',
    'wtsl',
    'cjsl',
    'wtlb',
    'lbmc',
    // 2
    'lxdz',
    'lxdh',
    'yybid',
    'yybid1',
    'htxh',
    'wtrq',
    'cjrq',
    'jymm',
    // 3
    'zjmm',
    'czmm',
    'yhdm',
    'zhlb',
    'yhzh',
    'zzje',
    'zzlb',
    'kyje',
    // 4
    'dqje',
    'zjfs',
    'wtdj',
    'rgdj',
    'qtdj',
    'gpky',
    'gpye',
    'gpwtdj',
    // 5
    'gprgdj',
    'fssj',
    'zy',
    'zymc',
    'gddm2',
    'ddbz2',
    'nbbm2',
    'card2',
    // 6
    'sfzh2',
    'gdxm2',
    'lmess',
    'mess',
    '',
    '',
    '',
    '',
    // 7
    'newmm',
    'cxksrq',
    'cxjsrq',
    'khlb',
    'wtfs',
    'gdzt',
    'szdm',
    'shdm',
    // 8
    'szbdm',
    'shbdm',
    'othdm',
    'othdm',
    'othdm',
    'gpmrcj',
    'email',
    'email2',
    // 9
    'bl1',
    'bl2',
    'bl3',
    'bl4',
    'sl1',
    'sl2',
    'sl3',
    'sl4',
    // 10
    'bd1',
    'bd2',
    'bd3',
    'bd4',
    'sd1',
    'sd2',
    'sd3',
    'sd4',
    // 11
    '','','','','','','','',
    // 12
    '','','','','','','','',
    // 13
    '','','','','','','','',
    // 14
    '','','','','','','','',
    // 15
    '','','','','','','','',
    // 16
    '','','','','','','','',
    // 17
    '','','','','','','','',
    // 18
    '','','','','','','','',
    // 19
    '','','','','','','','',
    // 20
    '','','','','','','','',
    // 21
    '','','','','','','','',
    // 22
    '','','','','','','','',
    // 23
    '','','','','','','','',
    // 24
    '','','','','','','','',
    // 25
    '','','','','','','','',
    // 26
    '','','','','','','','',
    // 27
    '','','','','','','','',
    // 28
    '','','','','','','','',
    // 29
    '','','','','','','','',
    // 30
    '','','','','','','','',
    // 31
    '','','','','','','',''
  );

implementation

uses SysUtils,  LogFile;

// 压缩数据，返回压缩以后的大小byte
function KCPackData(const ParamBits : TSTParamBits; const Data : TSTPack; Buffer : PByte):Integer;
var
  I,J : Integer;
  Mask : Byte;
  Count : Integer;
  PData : PByte;
  ASize : Integer;
begin
  PData := PByte(@Data);
  Count := 0;
  Result := 0;
  for I:=0 to ParamBitsSize-1 do
  begin
    Mask := 1;
    for J:=0 to BITSPERBYTE-1 do
    begin
      ASize := KCPackDataSizes[Count];
      if (ParamBits[I] and Mask)<>0 then
      begin
        Move(PData^,Buffer^,ASize);
        Inc(Buffer,ASize);
        Inc(Result,ASize);
      end;
      Inc(PData,ASize);
      Inc(Count);
      Mask := Mask shl 1;
    end;
  end;
end;

// 解压缩数据，返回压缩的大小byte
function KCUnPackData(const ParamBits : TSTParamBits; var Data : TSTPack; Buffer : PByte):Integer;
var
  I,J : Integer;
  Mask : Byte;
  Count : Integer;
  PData : PByte;
  ASize : Integer;
begin
  PData := PByte(@Data);
  Count := 0;
  Result := 0;
  FillChar(PData^,SizeOf(Data),0); // 初始化
  for I:=0 to ParamBitsSize-1 do
  begin
    Mask := 1;
    for J:=0 to BITSPERBYTE-1 do
    begin
      ASize := KCPackDataSizes[Count];
      if (ParamBits[I] and Mask)<>0 then
      begin
        Move(Buffer^,PData^,ASize);
        Inc(Buffer,ASize);
        Inc(Result,ASize);
      end;
      Inc(PData,ASize);
      Inc(Count);
      Mask := Mask shl 1;
    end;
  end;
end;

const
  AssertError='定义的包结构错误！';

procedure KCCheckDefine;
var
  I : Integer;
  Count : Integer;
begin
  Count := 0;
  for I:=0 to PARAMBITS-1 do
  begin
    Inc(Count, KCPackDataSizes[I]);
    if KCPackDataTypes[I]<>KCEmpty then
      Assert(KCPackDataNames[I]<>'',AssertError) else
      Assert(KCPackDataNames[I]='',AssertError);
    case KCPackDataTypes[I] of
      KCChar : ;
      KCInteger : Assert((KCPackDataSizes[I]=Sizeof(Byte)) or (KCPackDataSizes[I]=Sizeof(LongInt)),'定义的包结构错误！');
      KCFloat : Assert(KCPackDataSizes[I]=SizeOf(Double),'定义的包结构错误！');
    else
      Assert(KCPackDataSizes[I]=0,'定义的包结构错误！');
    end;
  end;
  Assert(Count=SizeOf(TSTPack),'定义的包结构错误！');
end;

procedure KCClearParamBits(var ParamBits : TSTParamBits);
begin
  FillChar(ParamBits,SizeOf(ParamBits),0);
end;

procedure KCPutStr(var CharArray; Size : Integer; const S:string);
var
  CopySize : Integer;
begin
  Assert(Size>0);
  FillChar(CharArray,Size,0);
  if S<>'' then
  begin
    CopySize := Length(S);
    if CopySize>Size then
      CopySize := Size;
    Move(PChar(S)^,CharArray,CopySize);
  end;
end;

function  KCGetStr(const CharArray; Size : Integer):string;
begin
  Assert(Size>0);
  SetLength(Result,Size);
  FillChar(PChar(Result)^,Size+1,0);
  Move(CharArray, PChar(Result)^,Size);
  SetLength(Result,StrLen(PChar(Result)));
end;

{$ifndef debug }
procedure KCDumpParamBits(const ParamBits : TSTParamBits);
begin

end;

procedure KCDumpPack(const Pack : TSTPack);
begin

end;

{$else}

procedure KCDumpParamBits(const ParamBits : TSTParamBits);
var
  I,J : Integer;
  Mask : Byte;
  S : string;
begin
  WriteLog('ParamBits',lcKCPack);
  for I:=0 to ParamBitsSize-1 do
  begin
    Mask := 1;
    S := '';
    for J:=0 to BITSPERBYTE do
    begin
      if (ParamBits[I] and Mask)<>0 then
        S := S+'1' else
        S := S+'0';
      Mask := Mask shl 1;
    end;
    WriteLog(S,lcKCPack);
  end;
end;

procedure KCDumpPack(const Pack : TSTPack);
var
  I : Integer;
  PData : PByte;
  S : string;
  K : Longint;
  D : Double;
  ASize : Integer;
begin
  WriteLog('Pack',lcKCPack);
  PData := PByte(@Pack);
  for I:=0 to PARAMBITS-1 do
  begin
    ASize := KCPackDataSizes[I];
    case KCPackDataTypes[I] of
      KCChar :begin
                S := KCGetStr(PData^,ASize);
                WriteLog(Format('%s=%s',[KCPackDataNames[I],S]),lcKCPack);
              end;
      KCInteger:
              begin
                K := 0;
                Move(PData^,K,ASize);
                WriteLog(Format('%s=%d',[KCPackDataNames[I],K]),lcKCPack);
              end;
      KCFloat :
              begin
                D := 0;
                Move(PData^,D,ASize);
                WriteLog(Format('%s=%f',[KCPackDataNames[I],D]),lcKCPack);
              end;
    end;
    Inc(PData,ASize);
  end;
end;

{$endif}

function  KCFindParam(const Name : string): Integer;
var
  I : Integer;
begin
  if Name<>'' then
    for I:=0 to PARAMBITS-1 do
      if SameText(Name,KCPackDataNames[I]) then
      begin
        Result := I;
        Exit;
      end;
  Result := -1;
end;

end.
