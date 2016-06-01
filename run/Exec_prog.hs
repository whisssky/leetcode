{-# LANGUAGE EmptyDataDecls, RankNTypes, ScopedTypeVariables #-}

module Exec_prog
  where 

import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),
  (>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Show, Eq,
  error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,
  zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,
  String, Bool(True, False), Maybe(Nothing, Just));
import qualified Prelude as P;
import System.IO;

newtype Nat = Nat Integer deriving (Show);

integer_of_nat :: Nat -> Integer;
integer_of_nat (Nat x) = x;

equal_nat :: Nat -> Nat -> Bool;
equal_nat m n = integer_of_nat m == integer_of_nat n;

instance Eq Nat where {
  a == b = equal_nat a b;
};

data Nibble = Nibble0 | Nibble1 | Nibble2 | Nibble3 | Nibble4 | Nibble5
  | Nibble6 | Nibble7 | Nibble8 | Nibble9 | NibbleA | NibbleB | NibbleC
  | NibbleD | NibbleE | NibbleF deriving (Show);

data Char = Char Nibble Nibble deriving (Show);

data Ty = Void | Boolean | Integera | NT | Class [Char] deriving (Show);

equal_nibble :: Nibble -> Nibble -> Bool;
equal_nibble NibbleE NibbleF = False;
equal_nibble NibbleF NibbleE = False;
equal_nibble NibbleD NibbleF = False;
equal_nibble NibbleF NibbleD = False;
equal_nibble NibbleD NibbleE = False;
equal_nibble NibbleE NibbleD = False;
equal_nibble NibbleC NibbleF = False;
equal_nibble NibbleF NibbleC = False;
equal_nibble NibbleC NibbleE = False;
equal_nibble NibbleE NibbleC = False;
equal_nibble NibbleC NibbleD = False;
equal_nibble NibbleD NibbleC = False;
equal_nibble NibbleB NibbleF = False;
equal_nibble NibbleF NibbleB = False;
equal_nibble NibbleB NibbleE = False;
equal_nibble NibbleE NibbleB = False;
equal_nibble NibbleB NibbleD = False;
equal_nibble NibbleD NibbleB = False;
equal_nibble NibbleB NibbleC = False;
equal_nibble NibbleC NibbleB = False;
equal_nibble NibbleA NibbleF = False;
equal_nibble NibbleF NibbleA = False;
equal_nibble NibbleA NibbleE = False;
equal_nibble NibbleE NibbleA = False;
equal_nibble NibbleA NibbleD = False;
equal_nibble NibbleD NibbleA = False;
equal_nibble NibbleA NibbleC = False;
equal_nibble NibbleC NibbleA = False;
equal_nibble NibbleA NibbleB = False;
equal_nibble NibbleB NibbleA = False;
equal_nibble Nibble9 NibbleF = False;
equal_nibble NibbleF Nibble9 = False;
equal_nibble Nibble9 NibbleE = False;
equal_nibble NibbleE Nibble9 = False;
equal_nibble Nibble9 NibbleD = False;
equal_nibble NibbleD Nibble9 = False;
equal_nibble Nibble9 NibbleC = False;
equal_nibble NibbleC Nibble9 = False;
equal_nibble Nibble9 NibbleB = False;
equal_nibble NibbleB Nibble9 = False;
equal_nibble Nibble9 NibbleA = False;
equal_nibble NibbleA Nibble9 = False;
equal_nibble Nibble8 NibbleF = False;
equal_nibble NibbleF Nibble8 = False;
equal_nibble Nibble8 NibbleE = False;
equal_nibble NibbleE Nibble8 = False;
equal_nibble Nibble8 NibbleD = False;
equal_nibble NibbleD Nibble8 = False;
equal_nibble Nibble8 NibbleC = False;
equal_nibble NibbleC Nibble8 = False;
equal_nibble Nibble8 NibbleB = False;
equal_nibble NibbleB Nibble8 = False;
equal_nibble Nibble8 NibbleA = False;
equal_nibble NibbleA Nibble8 = False;
equal_nibble Nibble8 Nibble9 = False;
equal_nibble Nibble9 Nibble8 = False;
equal_nibble Nibble7 NibbleF = False;
equal_nibble NibbleF Nibble7 = False;
equal_nibble Nibble7 NibbleE = False;
equal_nibble NibbleE Nibble7 = False;
equal_nibble Nibble7 NibbleD = False;
equal_nibble NibbleD Nibble7 = False;
equal_nibble Nibble7 NibbleC = False;
equal_nibble NibbleC Nibble7 = False;
equal_nibble Nibble7 NibbleB = False;
equal_nibble NibbleB Nibble7 = False;
equal_nibble Nibble7 NibbleA = False;
equal_nibble NibbleA Nibble7 = False;
equal_nibble Nibble7 Nibble9 = False;
equal_nibble Nibble9 Nibble7 = False;
equal_nibble Nibble7 Nibble8 = False;
equal_nibble Nibble8 Nibble7 = False;
equal_nibble Nibble6 NibbleF = False;
equal_nibble NibbleF Nibble6 = False;
equal_nibble Nibble6 NibbleE = False;
equal_nibble NibbleE Nibble6 = False;
equal_nibble Nibble6 NibbleD = False;
equal_nibble NibbleD Nibble6 = False;
equal_nibble Nibble6 NibbleC = False;
equal_nibble NibbleC Nibble6 = False;
equal_nibble Nibble6 NibbleB = False;
equal_nibble NibbleB Nibble6 = False;
equal_nibble Nibble6 NibbleA = False;
equal_nibble NibbleA Nibble6 = False;
equal_nibble Nibble6 Nibble9 = False;
equal_nibble Nibble9 Nibble6 = False;
equal_nibble Nibble6 Nibble8 = False;
equal_nibble Nibble8 Nibble6 = False;
equal_nibble Nibble6 Nibble7 = False;
equal_nibble Nibble7 Nibble6 = False;
equal_nibble Nibble5 NibbleF = False;
equal_nibble NibbleF Nibble5 = False;
equal_nibble Nibble5 NibbleE = False;
equal_nibble NibbleE Nibble5 = False;
equal_nibble Nibble5 NibbleD = False;
equal_nibble NibbleD Nibble5 = False;
equal_nibble Nibble5 NibbleC = False;
equal_nibble NibbleC Nibble5 = False;
equal_nibble Nibble5 NibbleB = False;
equal_nibble NibbleB Nibble5 = False;
equal_nibble Nibble5 NibbleA = False;
equal_nibble NibbleA Nibble5 = False;
equal_nibble Nibble5 Nibble9 = False;
equal_nibble Nibble9 Nibble5 = False;
equal_nibble Nibble5 Nibble8 = False;
equal_nibble Nibble8 Nibble5 = False;
equal_nibble Nibble5 Nibble7 = False;
equal_nibble Nibble7 Nibble5 = False;
equal_nibble Nibble5 Nibble6 = False;
equal_nibble Nibble6 Nibble5 = False;
equal_nibble Nibble4 NibbleF = False;
equal_nibble NibbleF Nibble4 = False;
equal_nibble Nibble4 NibbleE = False;
equal_nibble NibbleE Nibble4 = False;
equal_nibble Nibble4 NibbleD = False;
equal_nibble NibbleD Nibble4 = False;
equal_nibble Nibble4 NibbleC = False;
equal_nibble NibbleC Nibble4 = False;
equal_nibble Nibble4 NibbleB = False;
equal_nibble NibbleB Nibble4 = False;
equal_nibble Nibble4 NibbleA = False;
equal_nibble NibbleA Nibble4 = False;
equal_nibble Nibble4 Nibble9 = False;
equal_nibble Nibble9 Nibble4 = False;
equal_nibble Nibble4 Nibble8 = False;
equal_nibble Nibble8 Nibble4 = False;
equal_nibble Nibble4 Nibble7 = False;
equal_nibble Nibble7 Nibble4 = False;
equal_nibble Nibble4 Nibble6 = False;
equal_nibble Nibble6 Nibble4 = False;
equal_nibble Nibble4 Nibble5 = False;
equal_nibble Nibble5 Nibble4 = False;
equal_nibble Nibble3 NibbleF = False;
equal_nibble NibbleF Nibble3 = False;
equal_nibble Nibble3 NibbleE = False;
equal_nibble NibbleE Nibble3 = False;
equal_nibble Nibble3 NibbleD = False;
equal_nibble NibbleD Nibble3 = False;
equal_nibble Nibble3 NibbleC = False;
equal_nibble NibbleC Nibble3 = False;
equal_nibble Nibble3 NibbleB = False;
equal_nibble NibbleB Nibble3 = False;
equal_nibble Nibble3 NibbleA = False;
equal_nibble NibbleA Nibble3 = False;
equal_nibble Nibble3 Nibble9 = False;
equal_nibble Nibble9 Nibble3 = False;
equal_nibble Nibble3 Nibble8 = False;
equal_nibble Nibble8 Nibble3 = False;
equal_nibble Nibble3 Nibble7 = False;
equal_nibble Nibble7 Nibble3 = False;
equal_nibble Nibble3 Nibble6 = False;
equal_nibble Nibble6 Nibble3 = False;
equal_nibble Nibble3 Nibble5 = False;
equal_nibble Nibble5 Nibble3 = False;
equal_nibble Nibble3 Nibble4 = False;
equal_nibble Nibble4 Nibble3 = False;
equal_nibble Nibble2 NibbleF = False;
equal_nibble NibbleF Nibble2 = False;
equal_nibble Nibble2 NibbleE = False;
equal_nibble NibbleE Nibble2 = False;
equal_nibble Nibble2 NibbleD = False;
equal_nibble NibbleD Nibble2 = False;
equal_nibble Nibble2 NibbleC = False;
equal_nibble NibbleC Nibble2 = False;
equal_nibble Nibble2 NibbleB = False;
equal_nibble NibbleB Nibble2 = False;
equal_nibble Nibble2 NibbleA = False;
equal_nibble NibbleA Nibble2 = False;
equal_nibble Nibble2 Nibble9 = False;
equal_nibble Nibble9 Nibble2 = False;
equal_nibble Nibble2 Nibble8 = False;
equal_nibble Nibble8 Nibble2 = False;
equal_nibble Nibble2 Nibble7 = False;
equal_nibble Nibble7 Nibble2 = False;
equal_nibble Nibble2 Nibble6 = False;
equal_nibble Nibble6 Nibble2 = False;
equal_nibble Nibble2 Nibble5 = False;
equal_nibble Nibble5 Nibble2 = False;
equal_nibble Nibble2 Nibble4 = False;
equal_nibble Nibble4 Nibble2 = False;
equal_nibble Nibble2 Nibble3 = False;
equal_nibble Nibble3 Nibble2 = False;
equal_nibble Nibble1 NibbleF = False;
equal_nibble NibbleF Nibble1 = False;
equal_nibble Nibble1 NibbleE = False;
equal_nibble NibbleE Nibble1 = False;
equal_nibble Nibble1 NibbleD = False;
equal_nibble NibbleD Nibble1 = False;
equal_nibble Nibble1 NibbleC = False;
equal_nibble NibbleC Nibble1 = False;
equal_nibble Nibble1 NibbleB = False;
equal_nibble NibbleB Nibble1 = False;
equal_nibble Nibble1 NibbleA = False;
equal_nibble NibbleA Nibble1 = False;
equal_nibble Nibble1 Nibble9 = False;
equal_nibble Nibble9 Nibble1 = False;
equal_nibble Nibble1 Nibble8 = False;
equal_nibble Nibble8 Nibble1 = False;
equal_nibble Nibble1 Nibble7 = False;
equal_nibble Nibble7 Nibble1 = False;
equal_nibble Nibble1 Nibble6 = False;
equal_nibble Nibble6 Nibble1 = False;
equal_nibble Nibble1 Nibble5 = False;
equal_nibble Nibble5 Nibble1 = False;
equal_nibble Nibble1 Nibble4 = False;
equal_nibble Nibble4 Nibble1 = False;
equal_nibble Nibble1 Nibble3 = False;
equal_nibble Nibble3 Nibble1 = False;
equal_nibble Nibble1 Nibble2 = False;
equal_nibble Nibble2 Nibble1 = False;
equal_nibble Nibble0 NibbleF = False;
equal_nibble NibbleF Nibble0 = False;
equal_nibble Nibble0 NibbleE = False;
equal_nibble NibbleE Nibble0 = False;
equal_nibble Nibble0 NibbleD = False;
equal_nibble NibbleD Nibble0 = False;
equal_nibble Nibble0 NibbleC = False;
equal_nibble NibbleC Nibble0 = False;
equal_nibble Nibble0 NibbleB = False;
equal_nibble NibbleB Nibble0 = False;
equal_nibble Nibble0 NibbleA = False;
equal_nibble NibbleA Nibble0 = False;
equal_nibble Nibble0 Nibble9 = False;
equal_nibble Nibble9 Nibble0 = False;
equal_nibble Nibble0 Nibble8 = False;
equal_nibble Nibble8 Nibble0 = False;
equal_nibble Nibble0 Nibble7 = False;
equal_nibble Nibble7 Nibble0 = False;
equal_nibble Nibble0 Nibble6 = False;
equal_nibble Nibble6 Nibble0 = False;
equal_nibble Nibble0 Nibble5 = False;
equal_nibble Nibble5 Nibble0 = False;
equal_nibble Nibble0 Nibble4 = False;
equal_nibble Nibble4 Nibble0 = False;
equal_nibble Nibble0 Nibble3 = False;
equal_nibble Nibble3 Nibble0 = False;
equal_nibble Nibble0 Nibble2 = False;
equal_nibble Nibble2 Nibble0 = False;
equal_nibble Nibble0 Nibble1 = False;
equal_nibble Nibble1 Nibble0 = False;
equal_nibble NibbleF NibbleF = True;
equal_nibble NibbleE NibbleE = True;
equal_nibble NibbleD NibbleD = True;
equal_nibble NibbleC NibbleC = True;
equal_nibble NibbleB NibbleB = True;
equal_nibble NibbleA NibbleA = True;
equal_nibble Nibble9 Nibble9 = True;
equal_nibble Nibble8 Nibble8 = True;
equal_nibble Nibble7 Nibble7 = True;
equal_nibble Nibble6 Nibble6 = True;
equal_nibble Nibble5 Nibble5 = True;
equal_nibble Nibble4 Nibble4 = True;
equal_nibble Nibble3 Nibble3 = True;
equal_nibble Nibble2 Nibble2 = True;
equal_nibble Nibble1 Nibble1 = True;
equal_nibble Nibble0 Nibble0 = True;

equal_char :: Char -> Char -> Bool;
equal_char (Char x1 x2) (Char y1 y2) = equal_nibble x1 y1 && equal_nibble x2 y2;

instance Eq Char where {
  a == b = equal_char a b;
};

charTochar :: Char -> P.Char;
charTochar (Char Nibble4 Nibble1) = 'A';
charTochar (Char Nibble4 Nibble2) = 'B';
charTochar (Char Nibble4 Nibble3) = 'C';
charTochar (Char Nibble4 Nibble4) = 'D';
charTochar (Char Nibble4 Nibble5) = 'E';
charTochar (Char Nibble4 Nibble6) = 'F';
charTochar (Char Nibble4 Nibble7) = 'G';
charTochar (Char Nibble4 Nibble8) = 'H';
charTochar (Char Nibble4 Nibble9) = 'I';
charTochar (Char Nibble4 NibbleA) = 'J';
charTochar (Char Nibble4 NibbleB) = 'K';
charTochar (Char Nibble4 NibbleC) = 'L';
charTochar (Char Nibble4 NibbleD) = 'M';
charTochar (Char Nibble4 NibbleE) = 'N';
charTochar (Char Nibble4 NibbleF) = 'O';
charTochar (Char Nibble5 Nibble0) = 'P';
charTochar (Char Nibble5 Nibble1) = 'Q';
charTochar (Char Nibble5 Nibble2) = 'R';
charTochar (Char Nibble5 Nibble3) = 'S';
charTochar (Char Nibble5 Nibble4) = 'T';
charTochar (Char Nibble5 Nibble5) = 'U';
charTochar (Char Nibble5 Nibble6) = 'V';
charTochar (Char Nibble5 Nibble7) = 'W';
charTochar (Char Nibble5 Nibble8) = 'X';
charTochar (Char Nibble5 Nibble9) = 'Y';
charTochar (Char Nibble5 NibbleA) = 'Z';
charTochar (Char Nibble5 NibbleF) = '_';
charTochar (Char Nibble6 Nibble1) = 'a';
charTochar (Char Nibble6 Nibble2) = 'b';
charTochar (Char Nibble6 Nibble3) = 'c';
charTochar (Char Nibble6 Nibble4) = 'd';
charTochar (Char Nibble6 Nibble5) = 'e';
charTochar (Char Nibble6 Nibble6) = 'f';
charTochar (Char Nibble6 Nibble7) = 'g';
charTochar (Char Nibble6 Nibble8) = 'h';
charTochar (Char Nibble6 Nibble9) = 'i';
charTochar (Char Nibble6 NibbleA) = 'j';
charTochar (Char Nibble6 NibbleB) = 'k';
charTochar (Char Nibble6 NibbleC) = 'l';
charTochar (Char Nibble6 NibbleD) = 'm';
charTochar (Char Nibble6 NibbleE) = 'n';
charTochar (Char Nibble6 NibbleF) = 'o';
charTochar (Char Nibble7 Nibble0) = 'p';
charTochar (Char Nibble7 Nibble1) = 'q';
charTochar (Char Nibble7 Nibble2) = 'r';
charTochar (Char Nibble7 Nibble3) = 's';
charTochar (Char Nibble7 Nibble4) = 't';
charTochar (Char Nibble7 Nibble5) = 'u';
charTochar (Char Nibble7 Nibble6) = 'v';
charTochar (Char Nibble7 Nibble7) = 'w';
charTochar (Char Nibble7 Nibble8) = 'x';
charTochar (Char Nibble7 Nibble9) = 'y';
charTochar (Char Nibble7 NibbleA) = 'z';
charTochar (Char Nibble3 Nibble0) = '0';
charTochar (Char Nibble3 Nibble1) = '1';
charTochar (Char Nibble3 Nibble2) = '2';
charTochar (Char Nibble3 Nibble3) = '3';
charTochar (Char Nibble3 Nibble4) = '4';
charTochar (Char Nibble3 Nibble5) = '5';
charTochar (Char Nibble3 Nibble6) = '6';
charTochar (Char Nibble3 Nibble7) = '7';
charTochar (Char Nibble3 Nibble8) = '8';
charTochar (Char Nibble3 Nibble9) = '9';

stringTostring :: [Char] -> [P.Char];
stringTostring a = map charTochar a;

equal_ty :: Ty -> Ty -> Bool;
equal_ty NT (Class x5) = False;
equal_ty (Class x5) NT = False;
equal_ty Integera (Class x5) = False;
equal_ty (Class x5) Integera = False;
equal_ty Integera NT = False;
equal_ty NT Integera = False;
equal_ty Boolean (Class x5) = False;
equal_ty (Class x5) Boolean = False;
equal_ty Boolean NT = False;
equal_ty NT Boolean = False;
equal_ty Boolean Integera = False;
equal_ty Integera Boolean = False;
equal_ty Void (Class x5) = False;
equal_ty (Class x5) Void = False;
equal_ty Void NT = False;
equal_ty NT Void = False;
equal_ty Void Integera = False;
equal_ty Integera Void = False;
equal_ty Void Boolean = False;
equal_ty Boolean Void = False;
equal_ty (Class x5) (Class y5) = x5 == y5;
equal_ty NT NT = True;
equal_ty Integera Integera = True;
equal_ty Boolean Boolean = True;
equal_ty Void Void = True;

instance Eq Ty where {
  a == b = equal_ty a b;
};

class Ord a where {
  less_eq :: a -> a -> Bool;
  less :: a -> a -> Bool;
};

instance Ord Integer where {
  less_eq = (\ a b -> a <= b);
  less = (\ a b -> a < b);
};

newtype Int = Int_of_integer Integer deriving (Show);

data Val = Unit | Null | Boola Bool | Intg Int | Addr Nat deriving (Show);

data Instr = Load Nat | Store Nat | Push Val | New [Char]
  | Getfield [Char] [Char] | Putfield [Char] [Char] | Checkcast [Char]
  | Invoke [Char] Nat | Return | Pop | IAdd | Goto Int | CmpEq | IfFalse Int
  | Throw deriving (Show);

integer_of_int :: Int -> Integer;
integer_of_int (Int_of_integer k) = k;

equal_int :: Int -> Int -> Bool;
equal_int k l = integer_of_int k == integer_of_int l;

equal_val :: Val -> Val -> Bool;
equal_val (Intg x4) (Addr x5) = False;
equal_val (Addr x5) (Intg x4) = False;
equal_val (Boola x3) (Addr x5) = False;
equal_val (Addr x5) (Boola x3) = False;
equal_val (Boola x3) (Intg x4) = False;
equal_val (Intg x4) (Boola x3) = False;
equal_val Null (Addr x5) = False;
equal_val (Addr x5) Null = False;
equal_val Null (Intg x4) = False;
equal_val (Intg x4) Null = False;
equal_val Null (Boola x3) = False;
equal_val (Boola x3) Null = False;
equal_val Unit (Addr x5) = False;
equal_val (Addr x5) Unit = False;
equal_val Unit (Intg x4) = False;
equal_val (Intg x4) Unit = False;
equal_val Unit (Boola x3) = False;
equal_val (Boola x3) Unit = False;
equal_val Unit Null = False;
equal_val Null Unit = False;
equal_val (Addr x5) (Addr y5) = equal_nat x5 y5;
equal_val (Intg x4) (Intg y4) = equal_int x4 y4;
equal_val (Boola x3) (Boola y3) = x3 == y3;
equal_val Null Null = True;
equal_val Unit Unit = True;

equal_instr :: Instr -> Instr -> Bool;
equal_instr (IfFalse x14) Throw = False;
equal_instr Throw (IfFalse x14) = False;
equal_instr CmpEq Throw = False;
equal_instr Throw CmpEq = False;
equal_instr CmpEq (IfFalse x14) = False;
equal_instr (IfFalse x14) CmpEq = False;
equal_instr (Goto x12) Throw = False;
equal_instr Throw (Goto x12) = False;
equal_instr (Goto x12) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Goto x12) = False;
equal_instr (Goto x12) CmpEq = False;
equal_instr CmpEq (Goto x12) = False;
equal_instr IAdd Throw = False;
equal_instr Throw IAdd = False;
equal_instr IAdd (IfFalse x14) = False;
equal_instr (IfFalse x14) IAdd = False;
equal_instr IAdd CmpEq = False;
equal_instr CmpEq IAdd = False;
equal_instr IAdd (Goto x12) = False;
equal_instr (Goto x12) IAdd = False;
equal_instr Pop Throw = False;
equal_instr Throw Pop = False;
equal_instr Pop (IfFalse x14) = False;
equal_instr (IfFalse x14) Pop = False;
equal_instr Pop CmpEq = False;
equal_instr CmpEq Pop = False;
equal_instr Pop (Goto x12) = False;
equal_instr (Goto x12) Pop = False;
equal_instr Pop IAdd = False;
equal_instr IAdd Pop = False;
equal_instr Return Throw = False;
equal_instr Throw Return = False;
equal_instr Return (IfFalse x14) = False;
equal_instr (IfFalse x14) Return = False;
equal_instr Return CmpEq = False;
equal_instr CmpEq Return = False;
equal_instr Return (Goto x12) = False;
equal_instr (Goto x12) Return = False;
equal_instr Return IAdd = False;
equal_instr IAdd Return = False;
equal_instr Return Pop = False;
equal_instr Pop Return = False;
equal_instr (Invoke x81 x82) Throw = False;
equal_instr Throw (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) CmpEq = False;
equal_instr CmpEq (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Goto x12) = False;
equal_instr (Goto x12) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) IAdd = False;
equal_instr IAdd (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) Pop = False;
equal_instr Pop (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) Return = False;
equal_instr Return (Invoke x81 x82) = False;
equal_instr (Checkcast x7) Throw = False;
equal_instr Throw (Checkcast x7) = False;
equal_instr (Checkcast x7) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Checkcast x7) = False;
equal_instr (Checkcast x7) CmpEq = False;
equal_instr CmpEq (Checkcast x7) = False;
equal_instr (Checkcast x7) (Goto x12) = False;
equal_instr (Goto x12) (Checkcast x7) = False;
equal_instr (Checkcast x7) IAdd = False;
equal_instr IAdd (Checkcast x7) = False;
equal_instr (Checkcast x7) Pop = False;
equal_instr Pop (Checkcast x7) = False;
equal_instr (Checkcast x7) Return = False;
equal_instr Return (Checkcast x7) = False;
equal_instr (Checkcast x7) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Checkcast x7) = False;
equal_instr (Putfield x61 x62) Throw = False;
equal_instr Throw (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) CmpEq = False;
equal_instr CmpEq (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Goto x12) = False;
equal_instr (Goto x12) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) IAdd = False;
equal_instr IAdd (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) Pop = False;
equal_instr Pop (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) Return = False;
equal_instr Return (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Checkcast x7) = False;
equal_instr (Checkcast x7) (Putfield x61 x62) = False;
equal_instr (Getfield x51 x52) Throw = False;
equal_instr Throw (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) CmpEq = False;
equal_instr CmpEq (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Goto x12) = False;
equal_instr (Goto x12) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) IAdd = False;
equal_instr IAdd (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) Pop = False;
equal_instr Pop (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) Return = False;
equal_instr Return (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Checkcast x7) = False;
equal_instr (Checkcast x7) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Getfield x51 x52) = False;
equal_instr (New x4) Throw = False;
equal_instr Throw (New x4) = False;
equal_instr (New x4) (IfFalse x14) = False;
equal_instr (IfFalse x14) (New x4) = False;
equal_instr (New x4) CmpEq = False;
equal_instr CmpEq (New x4) = False;
equal_instr (New x4) (Goto x12) = False;
equal_instr (Goto x12) (New x4) = False;
equal_instr (New x4) IAdd = False;
equal_instr IAdd (New x4) = False;
equal_instr (New x4) Pop = False;
equal_instr Pop (New x4) = False;
equal_instr (New x4) Return = False;
equal_instr Return (New x4) = False;
equal_instr (New x4) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (New x4) = False;
equal_instr (New x4) (Checkcast x7) = False;
equal_instr (Checkcast x7) (New x4) = False;
equal_instr (New x4) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (New x4) = False;
equal_instr (New x4) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (New x4) = False;
equal_instr (Push x3) Throw = False;
equal_instr Throw (Push x3) = False;
equal_instr (Push x3) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Push x3) = False;
equal_instr (Push x3) CmpEq = False;
equal_instr CmpEq (Push x3) = False;
equal_instr (Push x3) (Goto x12) = False;
equal_instr (Goto x12) (Push x3) = False;
equal_instr (Push x3) IAdd = False;
equal_instr IAdd (Push x3) = False;
equal_instr (Push x3) Pop = False;
equal_instr Pop (Push x3) = False;
equal_instr (Push x3) Return = False;
equal_instr Return (Push x3) = False;
equal_instr (Push x3) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Push x3) = False;
equal_instr (Push x3) (Checkcast x7) = False;
equal_instr (Checkcast x7) (Push x3) = False;
equal_instr (Push x3) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Push x3) = False;
equal_instr (Push x3) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Push x3) = False;
equal_instr (Push x3) (New x4) = False;
equal_instr (New x4) (Push x3) = False;
equal_instr (Store x2) Throw = False;
equal_instr Throw (Store x2) = False;
equal_instr (Store x2) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Store x2) = False;
equal_instr (Store x2) CmpEq = False;
equal_instr CmpEq (Store x2) = False;
equal_instr (Store x2) (Goto x12) = False;
equal_instr (Goto x12) (Store x2) = False;
equal_instr (Store x2) IAdd = False;
equal_instr IAdd (Store x2) = False;
equal_instr (Store x2) Pop = False;
equal_instr Pop (Store x2) = False;
equal_instr (Store x2) Return = False;
equal_instr Return (Store x2) = False;
equal_instr (Store x2) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Store x2) = False;
equal_instr (Store x2) (Checkcast x7) = False;
equal_instr (Checkcast x7) (Store x2) = False;
equal_instr (Store x2) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Store x2) = False;
equal_instr (Store x2) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Store x2) = False;
equal_instr (Store x2) (New x4) = False;
equal_instr (New x4) (Store x2) = False;
equal_instr (Store x2) (Push x3) = False;
equal_instr (Push x3) (Store x2) = False;
equal_instr (Load x1) Throw = False;
equal_instr Throw (Load x1) = False;
equal_instr (Load x1) (IfFalse x14) = False;
equal_instr (IfFalse x14) (Load x1) = False;
equal_instr (Load x1) CmpEq = False;
equal_instr CmpEq (Load x1) = False;
equal_instr (Load x1) (Goto x12) = False;
equal_instr (Goto x12) (Load x1) = False;
equal_instr (Load x1) IAdd = False;
equal_instr IAdd (Load x1) = False;
equal_instr (Load x1) Pop = False;
equal_instr Pop (Load x1) = False;
equal_instr (Load x1) Return = False;
equal_instr Return (Load x1) = False;
equal_instr (Load x1) (Invoke x81 x82) = False;
equal_instr (Invoke x81 x82) (Load x1) = False;
equal_instr (Load x1) (Checkcast x7) = False;
equal_instr (Checkcast x7) (Load x1) = False;
equal_instr (Load x1) (Putfield x61 x62) = False;
equal_instr (Putfield x61 x62) (Load x1) = False;
equal_instr (Load x1) (Getfield x51 x52) = False;
equal_instr (Getfield x51 x52) (Load x1) = False;
equal_instr (Load x1) (New x4) = False;
equal_instr (New x4) (Load x1) = False;
equal_instr (Load x1) (Push x3) = False;
equal_instr (Push x3) (Load x1) = False;
equal_instr (Load x1) (Store x2) = False;
equal_instr (Store x2) (Load x1) = False;
equal_instr (IfFalse x14) (IfFalse y14) = equal_int x14 y14;
equal_instr (Goto x12) (Goto y12) = equal_int x12 y12;
equal_instr (Invoke x81 x82) (Invoke y81 y82) = x81 == y81 && equal_nat x82 y82;
equal_instr (Checkcast x7) (Checkcast y7) = x7 == y7;
equal_instr (Putfield x61 x62) (Putfield y61 y62) = x61 == y61 && x62 == y62;
equal_instr (Getfield x51 x52) (Getfield y51 y52) = x51 == y51 && x52 == y52;
equal_instr (New x4) (New y4) = x4 == y4;
equal_instr (Push x3) (Push y3) = equal_val x3 y3;
equal_instr (Store x2) (Store y2) = equal_nat x2 y2;
equal_instr (Load x1) (Load y1) = equal_nat x1 y1;
equal_instr Throw Throw = True;
equal_instr CmpEq CmpEq = True;
equal_instr IAdd IAdd = True;
equal_instr Pop Pop = True;
equal_instr Return Return = True;

instance Eq Instr where {
  a == b = equal_instr a b;
};

data Num = One | Bit0 Num | Bit1 Num deriving (Show);

data Seq a = Empty | Insert a (Pred a) | Join (Pred a) (Seq a);

newtype Pred a = Seq (() -> Seq a);

max :: forall a. (Ord a) => a -> a -> a;
max a b = (if less_eq a b then b else a);

nat :: Int -> Nat;
nat k = Nat (max (0 :: Integer) (integer_of_int k));

plus_nat :: Nat -> Nat -> Nat;
plus_nat m n = Nat (integer_of_nat m + integer_of_nat n);

one_nat :: Nat;
one_nat = Nat (1 :: Integer);

suc :: Nat -> Nat;
suc n = plus_nat n one_nat;

minus_nat :: Nat -> Nat -> Nat;
minus_nat m n = Nat (max (0 :: Integer) (integer_of_nat m - integer_of_nat n));

zero_nat :: Nat;
zero_nat = Nat (0 :: Integer);

nth :: forall a. [a] -> Nat -> a;
nth (x : xs) n =
  (if equal_nat n zero_nat then x else nth xs (minus_nat n one_nat));

drop :: forall a. Nat -> [a] -> [a];
drop n [] = [];
drop n (x : xs) =
  (if equal_nat n zero_nat then x : xs else drop (minus_nat n one_nat) xs);

take :: forall a. Nat -> [a] -> [a];
take n [] = [];
take n (x : xs) =
  (if equal_nat n zero_nat then [] else x : take (minus_nat n one_nat) xs);

map_of :: forall a b. (Eq a) => [(a, b)] -> a -> Maybe b;
map_of ((l, v) : ps) k = (if l == k then Just v else map_of ps k);
map_of [] k = Nothing;

classa ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Maybe ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))]));
classa = map_of;

fun_upd :: forall a b. (Eq a) => (a -> b) -> a -> b -> a -> b;
fun_upd f a b = (\ x -> (if x == a then b else f x));

member :: forall a. (Eq a) => [a] -> a -> Bool;
member [] y = False;
member (x : xs) y = x == y || member xs y;

map_add :: forall a b. (a -> Maybe b) -> (a -> Maybe b) -> a -> Maybe b;
map_add m1 m2 = (\ x -> (case m2 x of {
                          Nothing -> m1 x;
                          Just a -> Just a;
                        }));

object :: [Char];
object =
  [Char Nibble4 NibbleF, Char Nibble6 Nibble2, Char Nibble6 NibbleA,
    Char Nibble6 Nibble5, Char Nibble6 Nibble3, Char Nibble7 Nibble4];

gen_length :: forall a. Nat -> [a] -> Nat;
gen_length n (x : xs) = gen_length (suc n) xs;
gen_length n [] = n;

size_list :: forall a. [a] -> Nat;
size_list = gen_length zero_nat;

less_eq_nat :: Nat -> Nat -> Bool;
less_eq_nat m n = integer_of_nat m <= integer_of_nat n;

less_nat :: Nat -> Nat -> Bool;
less_nat m n = integer_of_nat m < integer_of_nat n;

sup_pred :: forall a. Pred a -> Pred a -> Pred a;
sup_pred (Seq f) (Seq g) =
  Seq (\ _ ->
        (case f () of {
          Empty -> g ();
          Insert x p -> Insert x (sup_pred p (Seq g));
          Join p xq -> adjunct (Seq g) (Join p xq);
        }));

adjunct :: forall a. Pred a -> Seq a -> Seq a;
adjunct p Empty = Join p Empty;
adjunct p (Insert x q) = Insert x (sup_pred q p);
adjunct p (Join q xq) = Join q (adjunct p xq);

bot_pred :: forall a. Pred a;
bot_pred = Seq (\ _ -> Empty);

single :: forall a. a -> Pred a;
single x = Seq (\ _ -> Insert x bot_pred);

if_pred :: Bool -> Pred ();
if_pred b = (if b then single () else bot_pred);

bind :: forall a b. Pred a -> (a -> Pred b) -> Pred b;
bind (Seq g) f = Seq (\ _ -> apply f (g ()));

apply :: forall a b. (a -> Pred b) -> Seq a -> Seq b;
apply f Empty = Empty;
apply f (Insert x p) = Join (f x) (Join (bind p f) Empty);
apply f (Join p xq) = Join (bind p f) (apply f xq);

rtrancl_tab_FioB_i_i_i ::
  forall a. (Eq a) => (a -> Pred a) -> [a] -> a -> a -> Pred ();
rtrancl_tab_FioB_i_i_i r xa xb xc =
  sup_pred
    (bind (single (xa, (xb, xc)))
      (\ (_, (x, xaa)) -> (if x == xaa then single () else bot_pred)))
    (bind (single (xa, (xb, xc)))
      (\ (xs, (x, z)) ->
        bind (if_pred (not (member xs x)))
          (\ () ->
            bind (r x)
              (\ xaa ->
                bind (rtrancl_tab_FioB_i_i_i r (x : xs) xaa z)
                  (\ () -> single ())))));

rtranclp_FioB_i_i :: forall a. (Eq a) => (a -> Pred a) -> a -> a -> Pred ();
rtranclp_FioB_i_i r xa xb =
  bind (single (xa, xb))
    (\ (x, y) -> bind (rtrancl_tab_FioB_i_i_i r [] x y) (\ () -> single ()));

eq_i_o :: forall a. a -> Pred a;
eq_i_o xa = bind (single xa) single;

subcls1p_i_i_o ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Pred [Char];
subcls1p_i_i_o x xa =
  bind (single (x, xa))
    (\ (p, c) ->
      bind (if_pred (not (c == object)))
        (\ () ->
          bind (eq_i_o (classa p c))
            (\ a ->
              (case a of {
                Nothing -> bot_pred;
                Just (d, _) -> single d;
              }))));

subcls_i_i_i ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> [Char] -> Pred ();
subcls_i_i_i x xa xb =
  bind (single (x, (xa, xb)))
    (\ (gc, (aa, xd)) ->
      bind (rtranclp_FioB_i_i (subcls1p_i_i_o gc) aa xd) (\ () -> single ()));

eval :: forall a. (Eq a) => Pred a -> a -> Bool;
eval (Seq f) = membera (f ());

membera :: forall a. (Eq a) => Seq a -> a -> Bool;
membera Empty x = False;
membera (Insert y p) x = x == y || eval p x;
membera (Join p xq) x = eval p x || membera xq x;

holds :: Pred () -> Bool;
holds p = eval p ();

subcls ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> [Char] -> Bool;
subcls x1 x2 x3 = holds (subcls_i_i_i x1 x2 x3);

matches_ex_entry ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Nat -> (Nat, (Nat, ([Char], (Nat, Nat)))) -> Bool;
matches_ex_entry p c pc xcp =
  let {
    (s, (e, (ca, (_, _)))) = xcp;
  } in less_eq_nat s pc &&
         less_nat pc e && let {
                            (a, b) = (c, ca);
                          } in subcls p a b;

match_ex_table ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Nat -> [(Nat, (Nat, ([Char], (Nat, Nat))))] -> Maybe (Nat, Nat);
match_ex_table p c pc [] = Nothing;
match_ex_table p c pc (e : es) =
  (if matches_ex_entry p c pc e then Just (snd (snd (snd e)))
    else match_ex_table p c pc es);

thea :: forall a. Maybe a -> a;
thea (Just x2) = x2;

map_option :: forall a b. (a -> b) -> Maybe a -> Maybe b;
map_option f Nothing = Nothing;
map_option f (Just x2) = Just (f x2);

eq_o_i :: forall a. a -> Pred a;
eq_o_i xa = bind (single xa) single;

methods_i_i_o ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Pred ([Char] -> Maybe (([Ty], (Ty, a)), [Char]));
methods_i_i_o x xa =
  sup_pred
    (bind (single (x, xa))
      (\ (p, xb) ->
        bind (eq_i_o (classa p object))
          (\ a ->
            (case a of {
              Nothing -> bot_pred;
              Just (_, (_, ms)) ->
                bind (eq_o_i (map_option (\ m -> (m, object)) . map_of ms))
                  (\ xaa -> (if xb == object then single xaa else bot_pred));
            }))))
    (bind (single (x, xa))
      (\ (p, c) ->
        bind (if_pred (not (c == object)))
          (\ () ->
            bind (eq_i_o (classa p c))
              (\ a ->
                (case a of {
                  Nothing -> bot_pred;
                  Just (d, (_, ms)) ->
                    bind (methods_i_i_o p d)
                      (\ xb ->
                        bind (eq_o_i
                               (map_add xb
                                 (map_option (\ m -> (m, c)) . map_of ms)))
                          single);
                })))));

method_i_i_i_o_o_o_o ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> [Char] -> Pred ([Ty], (Ty, (a, [Char])));
method_i_i_i_o_o_o_o x xa xb =
  bind (single (x, (xa, xb)))
    (\ (p, (c, m)) ->
      bind (methods_i_i_o p c)
        (\ xc ->
          bind (eq_i_o (xc m))
            (\ a ->
              (case a of {
                Nothing -> bot_pred;
                Just ((ts, (t, ma)), d) -> single (ts, (t, (ma, d)));
              }))));

is_empty :: forall a. Pred a -> Bool;
is_empty (Seq f) = nulla (f ());

nulla :: forall a. Seq a -> Bool;
nulla Empty = True;
nulla (Insert x p) = False;
nulla (Join p xq) = is_empty p && nulla xq;

singleton :: forall a. (Eq a) => (() -> a) -> Pred a -> a;
singleton dfault (Seq f) =
  (case f () of {
    Empty -> dfault ();
    Insert x p ->
      (if is_empty p then x
        else let {
               y = singleton dfault p;
             } in (if x == y then x else dfault ()));
    Join p xq ->
      (if is_empty p then the_only dfault xq
        else (if nulla xq then singleton dfault p
               else let {
                      x = singleton dfault p;
                      y = the_only dfault xq;
                    } in (if x == y then x else dfault ())));
  });

the_only :: forall a. (Eq a) => (() -> a) -> Seq a -> a;
the_only dfault (Insert x p) =
  (if is_empty p then x
    else let {
           y = singleton dfault p;
         } in (if x == y then x else dfault ()));
the_only dfault (Join p xq) =
  (if is_empty p then the_only dfault xq
    else (if nulla xq then singleton dfault p
           else let {
                  x = singleton dfault p;
                  y = the_only dfault xq;
                } in (if x == y then x else dfault ())));

the :: forall a. (Eq a) => Pred a -> a;
the a =
  singleton
    (\ _ ->
      (error :: forall a. String -> (() -> a) -> a) "not_unique" (\ _ -> the a))
    a;

method ::
  forall a.
    (Eq a) => [([Char],
                 ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
                [Char] -> [Char] -> ([Char], ([Ty], (Ty, a)));
method p c m =
  the (bind (method_i_i_i_o_o_o_o p c m)
        (\ (ts, (t, (ma, d))) -> single (d, (ts, (t, ma)))));

find_handler ::
  [([Char],
     ([Char],
       ([([Char], Ty)],
         [([Char],
            ([Ty],
              (Ty, (Nat, (Nat, ([Instr],
                                 [(Nat, (Nat,
  ([Char], (Nat, Nat))))]))))))])))] ->
    Nat ->
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) ->
        [([Val], ([Val], ([Char], ([Char], Nat))))] ->
        [([Val], ([Val], ([Char], ([Char], Nat))))] ->
          ((Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))])),[([Val], ([Val], ([Char], ([Char], Nat))))]);
find_handler p a h [] fs = ((Just a, (h, fs)),fs);
find_handler p a h (fr : frs) fs=
  let {
    (stk, (loc, (c, (m, pc)))) = fr;
  } in (case match_ex_table p (fst (thea (h a))) pc
               (snd (snd (snd (snd (snd (snd (method p c m)))))))
         of {
         Nothing -> find_handler p a h frs fs;
         Just pc_d ->
           ((Nothing,
             (h, (Addr a : drop (minus_nat (size_list stk) (snd pc_d)) stk,
                   (loc, (c, (m, fst pc_d)))) :
                   frs)),fr:fs);
       });

nat_of_integer :: Integer -> Nat;
nat_of_integer k = Nat (max (0 :: Integer) k);

outOfMemory :: [Char];
outOfMemory =
  [Char Nibble4 NibbleF, Char Nibble7 Nibble5, Char Nibble7 Nibble4,
    Char Nibble4 NibbleF, Char Nibble6 Nibble6, Char Nibble4 NibbleD,
    Char Nibble6 Nibble5, Char Nibble6 NibbleD, Char Nibble6 NibbleF,
    Char Nibble7 Nibble2, Char Nibble7 Nibble9];

nullPointer :: [Char];
nullPointer =
  [Char Nibble4 NibbleE, Char Nibble7 Nibble5, Char Nibble6 NibbleC,
    Char Nibble6 NibbleC, Char Nibble5 Nibble0, Char Nibble6 NibbleF,
    Char Nibble6 Nibble9, Char Nibble6 NibbleE, Char Nibble7 Nibble4,
    Char Nibble6 Nibble5, Char Nibble7 Nibble2];

classCast :: [Char];
classCast =
  [Char Nibble4 Nibble3, Char Nibble6 NibbleC, Char Nibble6 Nibble1,
    Char Nibble7 Nibble3, Char Nibble7 Nibble3, Char Nibble4 Nibble3,
    Char Nibble6 Nibble1, Char Nibble7 Nibble3, Char Nibble7 Nibble4];
otherException :: [Char];
otherException =
  [Char Nibble6 NibbleF,Char Nibble7 Nibble4,Char Nibble6 Nibble8,
    Char Nibble6 Nibble5,Char Nibble7 Nibble2,Char Nibble4 Nibble5,
    Char Nibble7 Nibble8,Char Nibble6 Nibble3,Char Nibble6 Nibble5,
    Char Nibble7 Nibble0,Char Nibble7 Nibble4,Char Nibble6 Nibble9,
    Char Nibble6 NibbleF,Char Nibble6 NibbleE];

addr_of_sys_xcpt :: [Char] -> Nat;
addr_of_sys_xcpt s =
  (if s == nullPointer then zero_nat
    else (if s == classCast then one_nat
           else (if s == outOfMemory then nat_of_integer (2 :: Integer)
                  else nat_of_integer (3 :: Integer))));

plus_int :: Int -> Int -> Int;
plus_int k l = Int_of_integer (integer_of_int k + integer_of_int l);

int_of_nat :: Nat -> Int;
int_of_nat n = Int_of_integer (integer_of_nat n);

is_none :: forall a. Maybe a -> Bool;
is_none (Just x) = False;
is_none Nothing = True;

gen_new_Addr ::
  (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) -> Nat -> Maybe Nat;
gen_new_Addr h n = (if is_none (h n) then Just n else gen_new_Addr h (suc n));

new_Addr :: (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) -> Maybe Nat;
new_Addr h = gen_new_Addr h zero_nat;

list_update :: forall a. [a] -> Nat -> a -> [a];
list_update [] i y = [];
list_update (x : xs) i y =
  (if equal_nat i zero_nat then y : xs
    else x : list_update xs (minus_nat i one_nat) y);

the_Addr :: Val -> Nat;
the_Addr (Addr a) = a;

cast_ok ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] ->
        (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) -> Val -> Bool;
cast_ok p c h v =
  equal_val v Null ||
    let {
      (a, b) = (fst (thea (h (the_Addr v))), c);
    } in subcls p a b;

the_Intg :: Val -> Int;
the_Intg (Intg i) = i;

replicate :: forall a. Nat -> a -> [a];
replicate n x =
  (if equal_nat n zero_nat then [] else x : replicate (minus_nat n one_nat) x);

zero_int :: Int;
zero_int = Int_of_integer (0 :: Integer);

default_val :: Ty -> Val;
default_val Void = Unit;
default_val Boolean = Boola False;
default_val Integera = Intg zero_int;
default_val NT = Null;
default_val (Class c) = Null;

init_fields :: [(([Char], [Char]), Ty)] -> ([Char], [Char]) -> Maybe Val;
init_fields = map_of . map (\ (f, t) -> (f, default_val t));

fields_i_i_o ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> Pred [(([Char], [Char]), Ty)];
fields_i_i_o x xa =
  sup_pred
    (bind (single (x, xa))
      (\ (p, c) ->
        bind (if_pred (not (c == object)))
          (\ () ->
            bind (eq_i_o (classa p c))
              (\ a ->
                (case a of {
                  Nothing -> bot_pred;
                  Just (d, (fs, _)) ->
                    bind (fields_i_i_o p d)
                      (\ xb ->
                        bind (eq_o_i (map (\ (f, aa) -> ((f, c), aa)) fs ++ xb))
                          single);
                })))))
    (bind (single (x, xa))
      (\ (p, xb) ->
        bind (eq_i_o (classa p object))
          (\ a ->
            (case a of {
              Nothing -> bot_pred;
              Just (_, (fs, _)) ->
                bind (eq_o_i (map (\ (f, aa) -> ((f, object), aa)) fs))
                  (\ xaa -> (if xb == object then single xaa else bot_pred));
            }))));

fields ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> [(([Char], [Char]), Ty)];
fields p c = the (fields_i_i_o p c);

blank ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      [Char] -> ([Char], ([Char], [Char]) -> Maybe Val);
blank p c = (c, init_fields (fields p c));

tl :: forall a. [a] -> [a];
tl [] = [];
tl (x21 : x22) = x22;

hd :: forall a. [a] -> a;
hd (x21 : x22) = x21;

exec_instr ::
  Instr ->
    [([Char],
       ([Char],
         ([([Char], Ty)],
           [([Char],
              ([Ty],
                (Ty, (Nat, (Nat, ([Instr],
                                   [(Nat, (Nat,
    ([Char], (Nat, Nat))))]))))))])))] ->
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) ->
        [Val] ->
          [Val] ->
            [Char] ->
              [Char] ->
                Nat ->
                  [([Val], ([Val], ([Char], ([Char], Nat))))] ->
                    (Maybe Nat,
                      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
                        [([Val], ([Val], ([Char], ([Char], Nat))))]));
exec_instr (Load n) p h stk loc c_0 m_0 pc frs =
  (Nothing,
    (h, (nth loc n : stk, (loc, (c_0, (m_0, plus_nat pc one_nat)))) : frs));
exec_instr (Store n) p h stk loc c_0 m_0 pc frs =
  (Nothing,
    (h, (tl stk,
          (list_update loc n (hd stk), (c_0, (m_0, plus_nat pc one_nat)))) :
          frs));
exec_instr (Push v) p h stk loc c_0 m_0 pc frs =
  (Nothing, (h, (v : stk, (loc, (c_0, (m_0, plus_nat pc one_nat)))) : frs));
exec_instr (New c) p h stk loc c_0 m_0 pc frs =
  (case new_Addr h of {
    Nothing ->
      (Just (addr_of_sys_xcpt outOfMemory),
        (h, (stk, (loc, (c_0, (m_0, pc)))) : frs));
    Just a ->
      (Nothing,
        (fun_upd h a (Just (blank p c)),
          (Addr a : stk, (loc, (c_0, (m_0, plus_nat pc one_nat)))) : frs));
  });
exec_instr (Getfield f c) p h stk loc c_0 m_0 pc frs =
  let {
    v = hd stk;
    xp = (if equal_val v Null then Just (addr_of_sys_xcpt nullPointer)
           else Nothing);
    (_, fs) = thea (h (the_Addr v));
  } in (xp, (h, (thea (fs (f, c)) : tl stk,
                  (loc, (c_0, (m_0, plus_nat pc one_nat)))) :
                  frs));
exec_instr (Putfield f c) p h stk loc c_0 m_0 pc frs =
  let {
    v = hd stk;
    r = hd (tl stk);
    xp = (if equal_val r Null then Just (addr_of_sys_xcpt nullPointer)
           else Nothing);
    a = the_Addr r;
    (d, fs) = thea (h a);
    ha = fun_upd h a (Just (d, fun_upd fs (f, c) (Just v)));
  } in (xp, (ha, (tl (tl stk), (loc, (c_0, (m_0, plus_nat pc one_nat)))) :
                   frs));
exec_instr (Checkcast c) p h stk loc c_0 m_0 pc frs =
  let {
    v = hd stk;
    xp = (if not (cast_ok p c h v) then Just (addr_of_sys_xcpt classCast)
           else Nothing);
  } in (xp, (h, (stk, (loc, (c_0, (m_0, plus_nat pc one_nat)))) : frs));
exec_instr (Invoke m n) p h stk loc c_0 m_0 pc frs =
  let {
    ps = take n stk;
    r = nth stk n;
    xp = (if equal_val r Null then Just (addr_of_sys_xcpt nullPointer)
           else Nothing);
    c = fst (thea (h (the_Addr r)));
    (d, (_, (_, (_, (mxl_0, (_, _)))))) = method p c m;
    f = ([], ([r] ++ reverse ps ++ replicate mxl_0 Unit,
               (d, (m, zero_nat))));
  } in (xp, (h, f : (stk, (loc, (c_0, (m_0, pc)))) : frs));
exec_instr Return p h stk_0 loc_0 c_0 m_0 pc frs =
  (if null frs then (Nothing, (h, []))
    else let {
           v = hd stk_0;
           (stk, (loc, (c, (m, pca)))) = hd frs;
           n = size_list (fst (snd (method p c_0 m_0)));
         } in (Nothing,
                (h, (v : drop (plus_nat n one_nat) stk,
                      (loc, (c, (m, plus_nat pca one_nat)))) :
                      tl frs)));
exec_instr Pop p h stk loc c_0 m_0 pc frs =
  (Nothing, (h, (tl stk, (loc, (c_0, (m_0, plus_nat pc one_nat)))) : frs));
exec_instr IAdd p h stk loc c_0 m_0 pc frs =
  let {
    i_2 = the_Intg (hd stk);
    i_1 = the_Intg (hd (tl stk));
  } in (Nothing,
         (h, (Intg (plus_int i_1 i_2) : tl (tl stk),
               (loc, (c_0, (m_0, plus_nat pc one_nat)))) :
               frs));
exec_instr (IfFalse i) p h stk loc c_0 m_0 pc frs =
  let {
    pca = (if equal_val (hd stk) (Boola False)
            then nat (plus_int (int_of_nat pc) i) else plus_nat pc one_nat);
  } in (Nothing, (h, (tl stk, (loc, (c_0, (m_0, pca)))) : frs));
exec_instr CmpEq p h stk loc c_0 m_0 pc frs =
  let {
    v_2 = hd stk;
    v_1 = hd (tl stk);
  } in (Nothing,
         (h, (Boola (equal_val v_1 v_2) : tl (tl stk),
               (loc, (c_0, (m_0, plus_nat pc one_nat)))) :
               frs));
exec_instr (Goto i) p h stk loc c_0 m_0 pc frs =
  (Nothing,
    (h, (stk, (loc, (c_0, (m_0, nat (plus_int (int_of_nat pc) i))))) : frs));
exec_instr Throw p h stk loc c_0 m_0 pc frs =
  let {
    xp = (if equal_val (hd stk) Null then Just (addr_of_sys_xcpt nullPointer)
           else Just (the_Addr (hd stk)));
  } in (xp, (h, (stk, (loc, (c_0, (m_0, pc)))) : frs));

exec ::
  ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) ->
    Maybe (Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))]));
exec (p, (xp, (h, []))) = Nothing;
exec (p, (Nothing, (h, (stk, (loc, (c, (m, pc)))) : frs))) =
  let {
    i = nth (fst (snd (snd (snd (snd (snd (method p c m))))))) pc;
    (xcpt, (ha, frsa)) = exec_instr i p h stk loc c m pc frs;
  } in Just (case xcpt of {
              Nothing -> (Nothing, (ha, frsa));
              Just a -> fst (find_handler p a h ((stk, (loc, (c, (m, pc)))) : frs) frsa);
            });
exec (p, (Just xa, (h, v : va))) = Nothing;



start_heap ::
  forall a.
    [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))] ->
      Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val);
start_heap g =
   fun_upd 
    (fun_upd
      (fun_upd
        (fun_upd (\ _ -> Nothing) (addr_of_sys_xcpt nullPointer)
          (Just (blank g nullPointer)))
        (addr_of_sys_xcpt classCast) (Just (blank g classCast)))
      (addr_of_sys_xcpt outOfMemory) (Just (blank g outOfMemory)))
    (nat_of_integer (3 :: Integer)) (Just (blank g otherException));

start_state ::
  [([Char],
     ([Char],
       ([([Char], Ty)],
         [([Char],
            ([Ty],
              (Ty, (Nat, (Nat, ([Instr],
                                 [(Nat, (Nat,
  ([Char], (Nat, Nat))))]))))))])))] ->
    [Char] ->
      [Char] ->
        (Maybe Nat,
          (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
            [([Val], ([Val], ([Char], ([Char], Nat))))]));
start_state p c m =
  let {
    (_, (_, (_, (_, (mxl_0, _))))) = method p c m;
  } in (Nothing,
         (start_heap p,
           [([], (Null : replicate mxl_0 Unit,
                   (c, (m, zero_nat))))]));

objectC ::
  forall a. ([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])));
objectC = (object, ([Char Nibble7 Nibble5, Char Nibble6 NibbleE, Char Nibble6 Nibble4,
       Char Nibble6 Nibble5, Char Nibble6 Nibble9], ([], [])));



outOfMemoryC ::
  forall a. ([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])));
outOfMemoryC = (outOfMemory, (object, ([], [])));

nullPointerC ::
  forall a. ([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])));
nullPointerC = (nullPointer, (object, ([], [])));

classCastC ::
  forall a. ([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])));
classCastC = (classCast, (object, ([], [])));

otherExceptionC ::
  forall a. ([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])));
otherExceptionC = (otherException, (object, ([], [])));

systemClasses ::
  forall a. [([Char], ([Char], ([([Char], Ty)], [([Char], ([Ty], (Ty, a)))])))];
systemClasses = [objectC, nullPointerC, classCastC, outOfMemoryC];




the1 :: forall a. Maybe a -> a;
the1 (Just x2) = x2;
show_exec0 ::Maybe (Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))])) -> (Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))]));
show_exec0 prog_state = the1 prog_state;
show_exec1 :: (Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))])) -> (Maybe Nat,[P.Char],
              [([Val], ([Val], ([Char], ([Char], Nat))))]);
show_exec1 (ad,(h,fs)) = (ad,"heap",fs);

changeChar :: ([Val], ([Val], ([Char], ([Char], Nat)))) ->  ([Val], ([Val], ([P.Char], ([P.Char], Nat))));
changeChar (c,(d,(e,(f,g)))) = (c,(d,(stringTostring e,(stringTostring f,g))));



show_exec_char ::(Maybe Nat,[P.Char],
              [([Val], ([Val], ([Char], ([Char], Nat))))]) -> (Maybe Nat,[P.Char],
              [([Val], ([Val], ([P.Char], ([P.Char], Nat))))]);
show_exec_char (a,b,[]) = (a,b,[]);
show_exec_char (a,b,c) = (a,b,map changeChar c);

show_exec :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> (Maybe Nat,[P.Char],
              [([Val], ([Val], ([P.Char], ([P.Char], Nat))))]);
show_exec (prog,state) =show_exec_char (show_exec1 (show_exec0 (exec (prog,state))));
show_state ::Maybe (Maybe Nat,
            (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
              [([Val], ([Val], ([Char], ([Char], Nat))))])) ->(Maybe Nat,[P.Char],
              [([Val], ([Val], ([P.Char], ([P.Char], Nat))))]);
show_state prog_state = show_exec_char (show_exec1 (show_exec0 prog_state)); 

show_one_state :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> Integer -> (Maybe Nat,[P.Char],
              [([Val], ([Val], ([P.Char], ([P.Char], Nat))))]);
show_one_state (prog,state) n = if (n==1) then show_exec (prog,state) else show_one_state (prog,the1 (exec(prog,state))) (n-1);



show_heap :: (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val)) -> [(Nat,[P.Char])] -> Nat -> [(Nat,[P.Char])];
show_heap h xs i  = (case (h i) of {
                                        Nothing  -> xs ; 
                                        (Just b) -> (((i,stringTostring (fst (the1 (h i)))):xs)++(show_heap h xs (suc i)));});
heap_in_state :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> Integer -> [(Nat,[P.Char])];
heap_in_state (prog,(ad,(h,fs))) n  = if (n==0) then (show_heap h [] (Nat 0)) else heap_in_state (prog,the1 (exec (prog,(ad,(h,fs))))) (n-1);

{-读取堆中一个类的所有字段-}
add_heap_field :: ([Char], ([Char], [Char]) -> Maybe Val) -> [[Char]] -> [Char] -> [(Nat,([P.Char],[([P.Char],Val)]))] -> [(Nat,([P.Char],[([P.Char],Val)]))];
add_heap_field obj vnames cname ps= if ((P.length vnames)==0) then ps else add_heap_field obj (P.tail vnames) cname (((fst (ps!!0)),((fst (snd (ps!!0))),((stringTostring (vnames!!0),the1 ((snd obj) (vnames!!0,cname))):(snd (snd (ps!!0)))))):(P.tail ps));

exec_n :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> Integer->Nat->(Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]));
exec_n (prog,(ad,(h,fs))) n addr= if (n==0) then (ad,(h,fs)) else exec_n (prog,(the1 (exec (prog,(ad,(h,fs)))))) (n-1) addr;

show_obj :: (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))])) -> [([Char],([[Char]],Integer))] -> [(Nat,([P.Char],[([P.Char],Val)]))] -> Nat ->P.Int-> [(Nat,([P.Char],[([P.Char],Val)]))];

show_obj (a,(h,fs)) xs ps addr index= 
  case  (h addr) of {
  Nothing -> ps;
  (Just b) -> 
    let i = P.length xs
    in if (i==0)
       then ps
       else 
        let cname = fst (xs!!index)
            this_cname = fst (the1 (h addr))
            vnames = fst (snd (xs!!index))
            num = snd (snd (xs!!index))
        in if (this_cname==cname)
           then if (num)==0
                then show_obj (a,(h,fs)) xs ((addr,(stringTostring cname,[])):ps) (suc addr) 0
                else show_obj (a,(h,fs)) xs (add_heap_field (the1 (h addr)) vnames cname ((addr,(stringTostring cname,[])):ps)) (suc addr) 0
           else show_obj (a,(h,fs)) xs ps addr (index+1)
}




outState :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> Handle ->Integer-> IO()
outState (prog,(a,(h,fs))) outh i = 
  do 
    if (P.length fs == 0)
    then return ()
    else case a of {
    (Just b) -> return ();
    Nothing -> do
      hPutStrLn outh ((P.show i)++". "++(P.show (show_exec (prog,(a,(h,fs)))))++"\n")
      outState (prog,(the1 (exec (prog,(a,(h,fs)))))) outh (i+1)
    }
outHeap :: ([([Char],
      ([Char],
        ([([Char], Ty)],
          [([Char],
             ([Ty],
               (Ty, (Nat, (Nat, ([Instr],
                                  [(Nat, (Nat,
   ([Char], (Nat, Nat))))]))))))])))],
    (Maybe Nat,
      (Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),
        [([Val], ([Val], ([Char], ([Char], Nat))))]))) -> Handle -> Integer -> [([Char],([[Char]],Integer))] -> IO()
outHeap (prog,(a,(h,fs))) outh i xs= 
  do
    if (P.length fs == 0)
    then return ()
    else case a of {
    (Just b) -> return();
    Nothing -> do
      hPutStrLn outh ((P.show i)++". "++(P.show (show_obj (a,(h,fs)) xs [] (Nat 0) 0))++"\n")
      outHeap (prog,(the1 (exec (prog,(a,(h,fs)))))) outh (i+1) xs
    }

