module Euler where

import Prelude

import Data.Int (rem)
import Data.Number (pow, sqrt, pi)

diagonal :: Number -> Number -> Number
diagonal x y = sqrt (pow x 2.0 + pow y 2.0)

circleArea :: Number -> Number
circleArea radius = pi * pow radius 2.0

leftOverCounts :: Int -> Int
leftOverCounts n = rem n 100
