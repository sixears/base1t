{- | A Prelude replacement, collecting all my favourite base imports and
     low-level local imports; including testing base. -}

module Base1T
  ( module Base0T
  , module Base1

    ------------------------------------
    --           tasty-plus           --
    ------------------------------------
  , module TastyPlus
)
where

import Base0T
import Base1

-- tasty-plus --------------------------

import TastyPlus  ( assertIsLeft, assertRight, assertSuccess
                  , runTestsP, runTestsReplay, runTestTree )

-- that's all, folks! ----------------------------------------------------------
