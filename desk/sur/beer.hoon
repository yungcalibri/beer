::  /sur/beer/hoon
|%
::  confidence of statement
+$  beer
  $?  %0 :: Not real
      %1 :: Real, firsthand.
  ==
::
+$  beer-action
  $%  [%add =ship =beer]
  ==
:: 
++  beer-schema
:~  [%who [0 | %p]]
    [%timestamp [1 | %da]]   ::  timestamp ideally provided by event, not timestamp of insertion into database
    [%score [2 | %ud]]       ::  the actual score
==

+$  beer-row
  $:  who=@p
      timestamp=@da
      score=@ud
      ~
  ==
--