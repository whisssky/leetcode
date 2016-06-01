module CLASSCAST where 
import Exec_prog
import System.IO
import Control.Monad 
import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),(>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Show, Eq,error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,String, Bool(True, False), Maybe(Nothing, Just))
import qualified Prelude as P
c_A :: [Char];
c_A = [Char Nibble4 Nibble1];
m_A_A :: [Char];
m_A_A = [Char Nibble4 Nibble1];
i_A_A :: [Instr];
i_A_A =
  [Load (zero_nat),
   Push Unit,
   Return];
class_A :: ([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat, ([Char], (Nat, Nat))))]))))))]));
class_A = (object,([],[(m_A_A,([],(Void,(nat_of_integer (1 :: Integer),(nat_of_integer (2 :: Integer),(i_A_A,[]))))))]));
c_B :: [Char];
c_B = [Char Nibble4 Nibble2];
v_B_a :: [Char];
v_B_a = [Char Nibble6 Nibble1];
m_B_B :: [Char];
m_B_B = [Char Nibble4 Nibble2];
i_B_B :: [Instr];
i_B_B =
  [Load (zero_nat),
   Invoke m_A_A (zero_nat),
   Pop,
   Push Unit,
   Return];
m_B_s :: [Char];
m_B_s = [Char Nibble7 Nibble3];
i_B_s :: [Instr];
i_B_s =
  [Load (zero_nat),
   Push (Intg (Int_of_integer (2 :: Integer))),
   Putfield [Char Nibble6 Nibble1] [Char Nibble4 Nibble2],
   Push Unit,
   Return];
class_B :: ([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat, ([Char], (Nat, Nat))))]))))))]));
class_B = ([Char Nibble4 Nibble1],([(v_B_a, Integera)],[(m_B_B,([],(Void,(nat_of_integer (1 :: Integer),(nat_of_integer (2 :: Integer),(i_B_B,[])))))),(m_B_s,([],(Void,(nat_of_integer (2 :: Integer),(nat_of_integer (2 :: Integer),(i_B_s,[]))))))]));
c_Test_error :: [Char];
c_Test_error = [Char Nibble5 Nibble4,Char Nibble6 Nibble5,Char Nibble7 Nibble3,Char Nibble7 Nibble4,Char Nibble5 NibbleF,Char Nibble6 Nibble5,Char Nibble7 Nibble2,Char Nibble7 Nibble2,Char Nibble6 NibbleF,Char Nibble7 Nibble2];
m_Test_error_Test_error :: [Char];
m_Test_error_Test_error = [Char Nibble5 Nibble4,Char Nibble6 Nibble5,Char Nibble7 Nibble3,Char Nibble7 Nibble4,Char Nibble5 NibbleF,Char Nibble6 Nibble5,Char Nibble7 Nibble2,Char Nibble7 Nibble2,Char Nibble6 NibbleF,Char Nibble7 Nibble2];
i_Test_error_Test_error :: [Instr];
i_Test_error_Test_error =
  [Load (zero_nat),
   Push Unit,
   Return];
m_Test_error_main :: [Char];
m_Test_error_main = [Char Nibble6 NibbleD,Char Nibble6 Nibble1,Char Nibble6 Nibble9,Char Nibble6 NibbleE];
i_Test_error_main :: [Instr];
i_Test_error_main =
  [New [Char Nibble4 Nibble1],
   Store (nat_of_integer (4 :: Integer)),
   Load (nat_of_integer (4 :: Integer)),
   Load (nat_of_integer (4 :: Integer)),
   Invoke m_A_A (zero_nat),
   Pop,
   Store (nat_of_integer (1 :: Integer)),
   New [Char Nibble4 Nibble2],
   Store (nat_of_integer (4 :: Integer)),
   Load (nat_of_integer (4 :: Integer)),
   Load (nat_of_integer (4 :: Integer)),
   Invoke m_B_B (zero_nat),
   Pop,
   Store (nat_of_integer (2 :: Integer)),
   Load (nat_of_integer (2 :: Integer)),
   Invoke [Char Nibble7 Nibble3] (zero_nat),
   Pop,
   Load (nat_of_integer (1 :: Integer)),
   Checkcast [Char Nibble4 Nibble2],
   Store (nat_of_integer (2 :: Integer)),
   Push Unit,
   Return];
class_Test_error :: ([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat, ([Char], (Nat, Nat))))]))))))]));
class_Test_error = (object,([],[(m_Test_error_Test_error,([],(Void,(nat_of_integer (1 :: Integer),(nat_of_integer (2 :: Integer),(i_Test_error_Test_error,[])))))),(m_Test_error_main,([],(Void,(nat_of_integer (2 :: Integer),(nat_of_integer (4 :: Integer),(i_Test_error_main,[]))))))]));
p :: [([Char],([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat,([Char], (Nat, Nat))))]))))))])))];
p = systemClasses ++ [([Char Nibble4 Nibble1], class_A),([Char Nibble4 Nibble2], class_B),([Char Nibble5 Nibble4,Char Nibble6 Nibble5,Char Nibble7 Nibble3,Char Nibble7 Nibble4,Char Nibble5 NibbleF,Char Nibble6 Nibble5,Char Nibble7 Nibble2,Char Nibble7 Nibble2,Char Nibble6 NibbleF,Char Nibble7 Nibble2], class_Test_error)];
findErrorLine :: [P.Char] -> [P.Char] -> Integer -> Integer;
findErrorLine "A" "A" 1 = 1;
findErrorLine "A" "A" 2 = 1;
findErrorLine "A" "A" 3 = 1;
findErrorLine "A" "A" 4 = 1;
findErrorLine "A" "A" 5 = 1;
findErrorLine "B" "B" 1 = 1;
findErrorLine "B" "B" 2 = 1;
findErrorLine "B" "B" 3 = 1;
findErrorLine "B" "B" 4 = 1;
findErrorLine "B" "B" 5 = 1;
findErrorLine "B" "s" 1 = 5;
findErrorLine "B" "s" 2 = 5;
findErrorLine "B" "s" 3 = 5;
findErrorLine "B" "s" 4 = 6;
findErrorLine "B" "s" 5 = 6;
findErrorLine "Test_error" "Test_error" 1 = 1;
findErrorLine "Test_error" "Test_error" 2 = 1;
findErrorLine "Test_error" "Test_error" 3 = 1;
findErrorLine "Test_error" "Test_error" 4 = 1;
findErrorLine "Test_error" "Test_error" 5 = 1;
findErrorLine "Test_error" "main" 1 = 3;
findErrorLine "Test_error" "main" 2 = 3;
findErrorLine "Test_error" "main" 3 = 3;
findErrorLine "Test_error" "main" 4 = 3;
findErrorLine "Test_error" "main" 5 = 3;
findErrorLine "Test_error" "main" 6 = 3;
findErrorLine "Test_error" "main" 7 = 3;
findErrorLine "Test_error" "main" 8 = 4;
findErrorLine "Test_error" "main" 9 = 4;
findErrorLine "Test_error" "main" 10 = 4;
findErrorLine "Test_error" "main" 11 = 4;
findErrorLine "Test_error" "main" 12 = 4;
findErrorLine "Test_error" "main" 13 = 4;
findErrorLine "Test_error" "main" 14 = 4;
findErrorLine "Test_error" "main" 15 = 5;
findErrorLine "Test_error" "main" 16 = 5;
findErrorLine "Test_error" "main" 17 = 5;
findErrorLine "Test_error" "main" 18 = 6;
findErrorLine "Test_error" "main" 19 = 6;
findErrorLine "Test_error" "main" 20 = 6;
findErrorLine "Test_error" "main" 21 = 7;
findErrorLine "Test_error" "main" 22 = 7;
show_result :: IO();
show_result = outToFile (p,start_state p c_Test_error m_Test_error_main) [(nullPointer,([],0)),(classCast,([],0)),(outOfMemory,([],0)),(otherException,([],0)),([Char Nibble4 Nibble1],([],0)),([Char Nibble4 Nibble2],([v_B_a],1)),([Char Nibble5 Nibble4,Char Nibble6 Nibble5,Char Nibble7 Nibble3,Char Nibble7 Nibble4,Char Nibble5 NibbleF,Char Nibble6 Nibble5,Char Nibble7 Nibble2,Char Nibble7 Nibble2,Char Nibble6 NibbleF,Char Nibble7 Nibble2],([],0))] "ClassCast";
show_a_step :: Integer ->  (Maybe Nat,[P.Char],[([Val], ([Val], ([P.Char], ([P.Char], Nat))))]);
show_a_step n = show_one_state (p,start_state p c_Test_error m_Test_error_main) n;
exec_all_ins1 :: ([([Char],([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat,([Char], (Nat, Nat))))]))))))])))],(Maybe Nat,(Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),[([Val], ([Val], ([Char], ([Char], Nat))))]))) -> [P.Char];
exec_all_ins1 (prog,(Nothing,(h,[]))) = "Success";
exec_all_ins1 (prog,(Just (Nat 1),(h,fs))) = "Exception in thread "++(stringTostring (fst (snd (snd (snd (fs!!((P.length fs)-1)))))))++" :ClassCastException\noccured in "++(reportError fs "");
exec_all_ins1 (prog,(Just (Nat 0),(h,fs))) = "Exception in thread "++(stringTostring (fst (snd (snd (snd (fs!!((P.length fs)-1)))))))++" :NullPointerException\noccured in "++(reportError fs "");
exec_all_ins1 (prog,(Just (Nat 2),(h,fs))) = "Exception in thread "++(stringTostring (fst (snd (snd (snd (fs!!((P.length fs)-1)))))))++" :OutOfMemoryError\noccured in "++(reportError fs "");
exec_all_ins1 (prog,(Just (Nat 3),(h,fs))) = "Exception in thread "++(stringTostring (fst (snd (snd (snd (fs!!((P.length fs)-1)))))))++" :otherException\noccured in "++(reportError fs "");
exec_all_ins1 (prog,(Nothing,(h,fs))) = exec_all_ins1 (prog,(the1 (exec (prog,(Nothing,(h,fs))))));
exec_all_ins1 (prog,(a,(h,fs))) = "Error";
reportError :: [([Val], ([Val], ([Char], ([Char], Nat))))] ->[P.Char] -> [P.Char];
reportError [] str = str;
reportError (fr:fs) str = do
  {
  let str1 = str++"\n"++(stringTostring (fst (snd (snd fr))))++".java:line "++(P.show (findErrorLine (stringTostring (fst (snd (snd fr)))) (stringTostring (fst (snd (snd (snd fr))))) (integer_of_nat (snd (snd (snd (snd fr)))))))++"  "++(stringTostring (fst (snd (snd fr))))++"."++(stringTostring (fst (snd (snd (snd fr)))))
  in (reportError fs str1)
}
outToFile ::  ([([Char],([Char],([([Char], Ty)],[([Char],([Ty],(Ty, (Nat, (Nat, ([Instr],[(Nat, (Nat,([Char], (Nat, Nat))))]))))))])))],(Maybe Nat,(Nat -> Maybe ([Char], ([Char], [Char]) -> Maybe Val),[([Val], ([Val], ([Char], ([Char], Nat))))]))) -> [([Char],([[Char]],Integer))] -> [P.Char] -> IO ()
outToFile (prog,(a,(h,fs))) xs cname = do
  putStrLn ("Result:"++((exec_all_ins1 (prog,(a,(h,fs))))))
  outh1 <- openFile (cname++"_state.txt") WriteMode
  putStrLn ("Writing states to "++cname++"_state.txt...")
  outState (prog,(a,(h,fs))) outh1 1
  outh2 <- openFile (cname++"_heap.txt") WriteMode
  putStrLn ("Writing heap to "++cname++"_heap.txt...")
  outHeap (prog,(a,(h,fs))) outh2 1 xs
  hClose outh1
  hClose outh2
  putStrLn ("Done")
main = do
  show_result
