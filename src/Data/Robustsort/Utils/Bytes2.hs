module Data.Robustsort.Utils.Bytes2
  ( getSortedListFromBytestacks,
  )
where

import Data.Robustsort.Subalgorithms.Bubblesort (bubblesortRecords)
import Data.Robustsort.Utils.Types (Bytestack, Memory (..))

-- | Compile a sorted list of Bits from a list of Bytestacks

-- | ==== __Examples__
-- >>> getSortedListFromBytestacks [([(0,28),(1,38)],BigMemory [([(0,27),(1,28)],BigMemory [([(0,23),(1,27)],Memory [[21,23],[25,27]]),([(0,24),(1,28)],Memory [[22,24],[26,28]])]),([(1,37),(0,38)],BigMemory [([(0,33),(1,38)],Memory [[31,33],[35,38]]),([(0,34),(1,37)],Memory [[32,14],[36,37]])])])]
-- [14, 21, 22, 23, 24, 25, 26, 27, 28, 31, 32, 33, 35, 36, 37, 38]
getSortedListFromBytestacks :: [Bytestack] -> [Int]
getSortedListFromBytestacks bytestacksRaw = acc bytestacksRaw []
  where
    acc :: [Bytestack] -> [Int] -> [Int]
    acc bytestacks sortedBits =
      if areAllEmpty bytestacks
        then sortedBits
        else acc bytestacks' (nextBit : sortedBits)
      where
        (nextBit, bytestacks') = getNextBitFromBytestacks bytestacks
