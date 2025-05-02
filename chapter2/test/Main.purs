module Test.Main where

import Prelude

import Effect (Effect)
import Euler (circleArea, diagonal, leftOverCounts)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  runTest do
    suite "diagonal" do
      test "3 4 5" do
        Assert.equal 5.0 (diagonal 3.0 4.0)
      test "5 12 13" do
        Assert.equal 13.0 (diagonal 5.0 12.0)
    suite "circleArea" do
      test "radius 1" do
        Assert.equal 3.141592653589793 (circleArea 1.0)
      test "radius 3" do
        Assert.equal 28.274333882308138 (circleArea 3.0)
    suite "leftOverCounts" do
      test "23" do
        Assert.equal 23 (leftOverCounts 23)
      test "456" do
        Assert.equal 56 (leftOverCounts 456)
      test "-789" do
        Assert.equal (-89) (leftOverCounts (-789))

