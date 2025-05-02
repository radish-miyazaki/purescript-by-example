module Data.AddressBook
  ( Address
  , AddressBook
  , Entry
  , insertEntry
  , showAddress
  , showEntry
  , emptyBook
  , findEntry
  , findEntryByStreet
  , isInBook
  , removeDuplicates
  ) where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, nubByEq)
import Data.Maybe (Maybe(..))

type Entry =
  { firstName :: String
  , lastName :: String
  , address :: Address
  }

type Address =
  { street :: String
  , city :: String
  , state :: String
  }

type AddressBook = List Entry

showEntry :: Entry -> String
showEntry entry = entry.lastName
  <> ", "
  <> entry.firstName
  <> ": "
  <> showAddress entry.address

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ", " <> addr.state

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

emptyBook :: AddressBook
emptyBook = empty

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = filter filterEntry >>> head
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName
    && entry.lastName == lastName

infixr 5 insertEntry as ++

findEntryByStreet :: String -> AddressBook -> Maybe Entry
findEntryByStreet street = head <<< filter (_.address.street >>> (_ == street))

isInBook :: String -> String -> AddressBook -> Boolean
isInBook firstName lastName book = findEntry firstName lastName book /= Nothing

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubByEq (\a b -> a.firstName == b.firstName && a.lastName == b.lastName)
